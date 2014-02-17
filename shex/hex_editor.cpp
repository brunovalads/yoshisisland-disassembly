#include "hex_editor.h"
#include "character_mapper.h"
#include "debug.h"

#include <QPainter>
#include <QFontMetrics>
#include <QMessageBox>
#include <QAction>
#include <QMenu>

hex_editor::hex_editor(QWidget *parent, QString file_name, QUndoGroup *undo_group, bool new_file) :
        QWidget(parent)
{
	buffer = new ROM_buffer(file_name, new_file);
	if(buffer->load_error() != ""){
		ROM_error = buffer->load_error();
		return;
	}
	buffer->initialize_undo(undo_group);
	is_new = new_file;
	
	if(new_file){
		update_save_state(1);
	}
	
	QTimer *cursor_timer = new QTimer(this);
	cursor_timer->start(1000);
	connect(cursor_timer, SIGNAL(timeout()), this, SLOT(update_cursor_state()));
	connect(scroll_timer, SIGNAL(timeout()), this, SLOT(auto_scroll_update()));
	
	font_setup();
	
	vertical_shift = column_height(1);
	cursor_position = get_byte_position(0);
	
	setContextMenuPolicy(Qt::CustomContextMenu);
	connect(this, SIGNAL(customContextMenuRequested(const QPoint&)),
	        this, SLOT(context_menu(const QPoint&)));
	connect(qApp->clipboard(), SIGNAL(dataChanged()), this, SLOT(clipboard_changed()));
	
	QSize minimum = minimumSizeHint();
	minimum.setHeight(rows/2*font_height+vertical_offset+vertical_shift);
	setMinimumSize(minimum);
	setFocusPolicy(Qt::WheelFocus);
}

QSize hex_editor::minimumSizeHint() const
{
	return QSize((14 + columns * 4)*font_width,
	             rows*font_height+vertical_offset+vertical_shift);
}

void hex_editor::set_focus()
{
	emit update_status_text(get_status_text());
	setFocus();
	buffer->set_active();
	emit selection_toggled(selection_active);
	emit focused(true);
	emit update_save_state(0);
	clipboard_changed();
}
void hex_editor::slider_update(int position)
{
	if(!scroll_mode){
		cursor_position.setY(cursor_position.y() + (offset - position * columns));
		int old_offset = offset;
		offset = position * columns;
		if(selection_active){
			selection_start.setY(selection_start.y()  - (offset - old_offset));
			selection_current.setY(selection_current.y()  - (offset - old_offset));
		}
		update();
	}else{
		position -= height() / 2;
		if(position < 0){
			scroll_direction = false;
			position = -position;
		}else if(position > 0){
			scroll_direction = true;
		}else{
			scroll_speed = INT_MAX;
			scroll_timer->setInterval(scroll_speed);
			return;
		}
		scroll_speed = qAbs(((position - (height() /2))-1) / 15);
		scroll_timer->setInterval(scroll_speed);
	}
}

void hex_editor::scroll_mode_changed()
{
	scroll_mode = !scroll_mode;
	update_window();
	emit toggle_scroll_mode(scroll_mode);
}

void hex_editor::auto_scroll_update()
{
	if(is_dragging){
		update_selection(mouse_position.x(), mouse_position.y());
		return;
	}
	int scroll_factor = 1;
	if(scroll_speed < 5){
		scroll_factor = qAbs(scroll_speed - 20);
	}
	for(int i = 0; i < scroll_factor; i++){
		if(!scroll_direction){
			update_cursor_position(cursor_position.x(), cursor_position.y() - font_height, false);
		}else{
			update_cursor_position(cursor_position.x(), cursor_position.y() + font_height, false);
		}
	}
	update();
}

void hex_editor::control_auto_scroll(bool enabled)
{
	auto_scrolling = enabled;
	if(auto_scrolling){
		scroll_timer->start(scroll_speed);
	}else{
		scroll_timer->stop();
	}
}

void hex_editor::update_cursor_state()
{
	cursor_state = !cursor_state;
	update();
}

void hex_editor::update_undo_action(bool direction)
{
	if(!is_active){
		return;
	}
	update_save_state((direction << 1) + -1);
	if(get_buffer_position(cursor_position) > buffer->size()){
		cursor_position = get_byte_position(buffer->size());
	}
	set_selection_active(false);
	is_dragging = false;
	update_window();
}

void hex_editor::goto_offset(int address)
{
	if(!buffer->is_active()){
		return;
	}

	address = buffer->snes_to_pc(address);
	offset = address - (rows / 2) * columns;
	offset -= offset % columns;
	if(offset < 0){
		offset = 0;
	}else if(offset > buffer->size() - rows * columns){
		offset = buffer->size() - rows * columns;
	}
	cursor_position = get_byte_position(address);
	set_selection_active(false);
	update_window();
}

void hex_editor::select_range(int start, int end)
{
	if(!buffer->is_active()){
		return;
	}
	start = buffer->snes_to_pc(start);
	end = buffer->snes_to_pc(end);

	offset = start - (rows / 2) * columns;
	offset -= offset % columns;
	if(offset < 0){
		offset = 0;
	}else if(offset > buffer->size() - rows * columns){
		offset = buffer->size() - rows * columns;
	}
	selection_start = get_byte_position(start);
	selection_current = get_byte_position(end);
	set_selection_active(true);
	update_window();
}

void hex_editor::context_menu(const QPoint& position)
{	
	QMenu menu;
	menu.addAction("Cut", this, SLOT(cut()), QKeySequence::Cut)->setEnabled(selection_active);
	menu.addAction("Copy", this, SLOT(copy()), QKeySequence::Copy)->setEnabled(selection_active);
	menu.addAction("Paste", this, SLOT(paste()), QKeySequence::Paste)->setEnabled(buffer->check_paste_data());
	menu.addAction("Delete", this, SLOT(delete_text()), QKeySequence::Delete)->setEnabled(selection_active);
	menu.addSeparator();
	menu.addAction("Select all", this, SLOT(select_all()), QKeySequence::SelectAll);
	menu.addSeparator();
	menu.addAction("Follow branch", this, 
	               SLOT(branch()), QKeySequence("Ctrl+b"))->setEnabled(follow_selection(true));
	menu.addAction("Follow jump", this, 
	               SLOT(jump()), QKeySequence("Ctrl+j"))->setEnabled(follow_selection(false));
	menu.addAction("Disassemble", this, 
	               SLOT(disassemble()), QKeySequence("Ctrl+d"))->setEnabled(selection_active);
	
	menu.exec(mapToGlobal(position));
}

void hex_editor::cut()
{
	int position[2];
	if(!buffer->is_active() || !get_selection_range(position)){
		return;
	}
	
	buffer->cut(position[0], position[1], click_side);
	cursor_position = selection_start;
	set_selection_active(false);
	update_window();
	update_save_state(1);
}

void hex_editor::copy()
{
	int position[2];
	if(!buffer->is_active() || !get_selection_range(position)){
		return;
	}
	
	buffer->copy(position[0], position[1], click_side);
	update_window();
	update_save_state(1);
}

void hex_editor::paste(bool raw)
{
	if(!buffer->is_active()){
		return;
	}
	int position[2];
	if(get_selection_range(position)){
		buffer->paste(position[0], position[1], raw);
	}else{
		int size = buffer->paste(get_buffer_position(cursor_position) + buffer->header_size(), 0, raw);
		cursor_position = get_byte_position(get_buffer_position(cursor_position)+size);
		set_selection_active(false);
	}
	update_window();
	update_save_state(1);
}

void hex_editor::delete_text()
{
	if(!buffer->is_active()){
		return;
	}
	int position[2];
	if(!get_selection_range(position)){
		buffer->delete_text(get_buffer_position(cursor_position) + buffer->header_size());
	}else{
		buffer->delete_text(position[0], position[1]);	
		set_selection_active(false);
		cursor_position = selection_start;
	}
	update_window();
	update_save_state(1);
}

void hex_editor::select_all()
{
	if(!buffer->is_active()){
		return;
	}
	selection_start = get_byte_position(0);
	selection_current = get_byte_position(buffer->size());
	set_selection_active(true);
	emit update_status_text(get_status_text());
	update();
}

void hex_editor::branch()
{
	int position[2];
	if(!buffer->is_active() || !get_selection_range(position)){
		return;
	}
	QString text = "selected bytes: ";
	text.append(QString::number(buffer->branch_address(position[1], 
	            buffer->to_little_endian(buffer->range(position[0], position[1]))), 16));
	
	goto_offset(buffer->branch_address(position[1] - buffer->header_size(), 
	            buffer->to_little_endian(buffer->range(position[0], position[1]))));
}

void hex_editor::jump()
{
	int position[2];
	if(!buffer->is_active() || !get_selection_range(position)){
		return;
	}
	QString text = "selected bytes: ";
	text.append(QString::number(buffer->jump_address(position[1], 
	            buffer->to_little_endian(buffer->range(position[0], position[1]))), 16));
	
	goto_offset(buffer->jump_address(position[1] - buffer->header_size(), 
	            buffer->to_little_endian(buffer->range(position[0], position[1]))));
	QByteArray selection = buffer->to_little_endian(buffer->range(position[0], position[1]));
}

void hex_editor::disassemble()
{
	int position[2];
	if(!buffer->is_active() || !get_selection_range(position)){
		return;
	}
	QByteArray data = buffer->range(position[0], position[1]);
	emit send_disassemble_data(&data);
}

void hex_editor::count(QString find, bool mode)
{
	if(!buffer->is_active()){
		return;
	}
	int result = buffer->count(find, mode);
	if(result < 0){
		search_error(result, find);
	}else{
		update_status_text(QString::number(result) + " Results found for " + find);
	}

}

void hex_editor::search(QString find, bool direction, bool mode)
{	
	if(!buffer->is_active()){
		return;
	}
	
	int position[2];
	if(!get_selection_range(position)){
		position[1] = get_buffer_position(cursor_position) + buffer->header_size();
	}else if(!direction){
		position[1] = position[0] - 1;
	}
	int result = buffer->search(find, position[1], direction, mode);
	if(result < 0){
		search_error(result, find);
	}else{
		int start = buffer->pc_to_snes(result - buffer->header_size());
		int end = 0;
		if(mode){
			end = buffer->pc_to_snes(result - buffer->header_size() + buffer->to_hex(find).length()/2 - 1);
		}else{
			end = buffer->pc_to_snes(result - buffer->header_size() + find.length() - 1);
		}
		goto_offset(end);
		select_range(start, end);
	}
}

void hex_editor::replace(QString find, QString replace, bool direction, bool mode)
{
	if(!buffer->is_active()){
		return;
	}
	int position = get_buffer_position(cursor_position) + buffer->header_size();
	int result = buffer->replace(find, replace, position, direction, mode);
	if(result < 0){
		search_error(result, find, replace);
	}else{
		int start = buffer->pc_to_snes(result - buffer->header_size());
		int end = 0;
		if(mode){
			end = buffer->pc_to_snes(result - buffer->header_size() + buffer->to_hex(replace).length()/2 - 1);
		}else{
			end = buffer->pc_to_snes(result - buffer->header_size() + replace.length() - 1);
		}
		goto_offset(end);
		select_range(start, end);
	}
	update_save_state(1);
}

void hex_editor::replace_all(QString find, QString replace, bool mode)
{
	if(!buffer->is_active()){
		return;
	}
	int result = buffer->replace_all(find, replace, mode);
	if(result < 0){
		search_error(result, find, replace);
	}else{
		update_status_text(QString::number(result) + " Results found for " + find);
	}
	update_save_state(1);
}

void hex_editor::paintEvent(QPaintEvent *event)
{
	Q_UNUSED(event);
	QPainter painter(this);
	painter.translate(0, vertical_shift);
	
	QColor text = palette().color(QPalette::WindowText);
	painter.setPen(text);
	painter.setFont(font);
	
	for(int i = hex_offset; i < columns * column_width(3) + hex_offset; i += column_width(6)){
		painter.fillRect(i-1, vertical_offset-font_height, column_width(2)+2, 
		                 column_height(rows+1)+6, palette().color(QPalette::AlternateBase));
	}
	
	if(cursor_position.y() > 0 && cursor_position.y() < column_height(rows)+vertical_offset && !selection_active){
		QRect active_line(hex_offset-1, cursor_position.y()-1+vertical_offset, 
		                  columns*column_width(3)-font_width+2, font_height);
		painter.fillRect(active_line, palette().color(QPalette::Highlight));
		if(cursor_state){
			painter.fillRect(cursor_position.x(), cursor_position.y()-1+vertical_offset, 
			                 1, font_height, text);
			painter.fillRect(to_ascii_column(cursor_position.x()), cursor_position.y()-1+vertical_offset, 
			                 1, font_height, text);
		}
	}
	
	if(selection_active){
		paint_selection(painter);
	}

	painter.drawText(0, 0, offset_header);
	int byte_count = rows * columns + offset;
	for(int i = offset; i < byte_count; i += columns){
		QString line = buffer->get_line(i, columns);
		painter.drawText(0, column_height((i-offset)/columns)+font_height+vertical_offset, line);
	}
	
}

void hex_editor::paint_selection(QPainter &painter)
{		
	int start = get_selection_point(selection_start);
	int end = get_selection_point(selection_current);
	if(start > end){
		qSwap(start, end);
	}
	for(; start < end+1 && end != offset; start++){
		QPoint position = get_byte_position(start);
		painter.fillRect(position.x()-1, position.y(), font_width*3, font_height+4, 
		                 palette().color(QPalette::Active, QPalette::Highlight));
		painter.fillRect(to_ascii_column(position.x()), position.y(), font_width, font_height+4, 
		                 palette().color(QPalette::Active, QPalette::Highlight));
	}
	
	painter.fillRect(column_width(10+columns*3)+1, 0, font_width, column_height(rows+1), 
	                 palette().color(QPalette::Base));
}

bool hex_editor::event(QEvent *e)
{
	if(e->type() == QEvent::KeyPress && static_cast<QKeyEvent *>(e)->key() == Qt::Key_Tab){
		click_side = !click_side;
		return true;
	}
	return QWidget::event(e);
}

void hex_editor::keyPressEvent(QKeyEvent *event)
{
	
	if(event->modifiers() == (Qt::ControlModifier | Qt::ShiftModifier)){
		if(event->key() == Qt::Key_V){
			paste(true);
			update();
		}
	}
	if(event->modifiers() == Qt::ControlModifier){
		return;
	}
	
	if(click_side){
		if(event->key() >= Qt::Key_Space && event->key() <= Qt::Key_AsciiTilde){
			char key = event->text().at(0).unicode();
			handle_typed_character(character_mapper::decode(key), true);
		}
	}else{
		if(event->key() >= Qt::Key_0 && event->key() <= Qt::Key_9){
			handle_typed_character(event->key() - Qt::Key_0);
		}else if(event->key() >= Qt::Key_A && event->key() <= Qt::Key_F){
			handle_typed_character(event->key() - Qt::Key_A + 10);
		}
	}
	
	switch(event->key()){
		case Qt::Key_Backspace:
			update_cursor_position(cursor_position.x()-column_width(3), cursor_position.y(), false);
			delete_text();
		break;
			
		case Qt::Key_Home:
			update_cursor_position(column_width(11), cursor_position.y());
		break;
		case Qt::Key_End:
				update_cursor_position(column_width(9+columns*3), cursor_position.y());
		break;
		case Qt::Key_Up:
			if(selection_active){
				update_selection_position(-columns);
			}else{
				update_cursor_position(cursor_position.x(), cursor_position.y() - font_height);
			}
		break;
		case Qt::Key_Down:
			if(selection_active){
				update_selection_position(columns);
			}else{
				update_cursor_position(cursor_position.x(), cursor_position.y() + font_height);
			}
		break;
		case Qt::Key_Right:
			update_cursor_position(cursor_position.x()+column_width(1+click_side), cursor_position.y());
		break;
		case Qt::Key_Left:
			update_cursor_position(cursor_position.x()-column_width(2+click_side), cursor_position.y());
		break;
		case Qt::Key_PageUp:
			update_cursor_position(cursor_position.x(), cursor_position.y() - column_height(rows));
		break;
		case Qt::Key_PageDown:
			update_cursor_position(cursor_position.x(), cursor_position.y() + column_height(rows));
		break;
		default:
		break;
	}
}

void hex_editor::handle_typed_character(unsigned char key, bool update_byte)
{
	int position[2];
	if(get_selection_range(position)){
		selection_active = false;
		cursor_position = selection_start;
	}else{
		position[1] = 0;
	}
	if(update_byte){
		buffer->update_byte(key, get_buffer_position(cursor_position), position[0], position[1]);
	}else{
		buffer->update_nibble(key, get_buffer_position(cursor_position, false), position[0], position[1]);
	}
	update_cursor_position(cursor_position.x()+font_width*(2 * update_byte ? 2 : 1), cursor_position.y(), false);
	update_window();
	update_save_state(1);
}

void hex_editor::wheelEvent(QWheelEvent *event)
{
	int steps = event->delta() / 8 / 15;
	if(selection_active){
		update_selection_position(-steps * columns);
	}else{
		update_cursor_position(cursor_position.x(), cursor_position.y() + (-steps * font_height));
	}
}

void hex_editor::mousePressEvent(QMouseEvent *event)
{
	if(event->button() == Qt::RightButton){
		return;
	}
	
	int x = event->x();
	int y = event->y() - vertical_shift;
	
	if((event->x() > column_width(3*columns+14) && event->x() < column_width(4*columns+14))){
		x = to_hex_column(x) + 1;
		click_side = true;
	}else{
		click_side = false;
	}
	if(get_buffer_position(x, y) > buffer->size() || event->y() < vertical_offset+vertical_shift){
		return;
	}
	
	set_selection_active(false);
	if(x > column_width(11) && x < column_width(11+columns*3)-font_width){
		update_cursor_position(x, y);
		is_dragging = true;
		selection_start = get_byte_position(get_buffer_position(x, y));
		selection_current = selection_start;
	}
}

void hex_editor::mouseMoveEvent(QMouseEvent *event)
{
	mouse_position = event->pos();
	if(click_side){
		mouse_position.setX(to_hex_column(event->x()));
	}
	
	if(is_dragging){
		set_selection_active(true);
		update_selection(mouse_position.x(), event->y());
		if(event->y() > column_height(rows)){
			scroll_timer->start(20);
			scroll_direction = true;
		}else if(event->y() < vertical_shift){
			scroll_timer->start(20);
			scroll_direction = false;
		}else{
			scroll_timer->stop();
		}
	}
}

void hex_editor::mouseReleaseEvent(QMouseEvent *event)
{
	mouse_position = event->pos();
	if(click_side){
		mouse_position.setX(to_hex_column(event->x()));
	}
	
	is_dragging = false;
	scroll_timer->stop();

	if(is_dragging){
		update_selection(mouse_position.x(), event->y());
	}
}

void hex_editor::resizeEvent(QResizeEvent *event)
{
	Q_UNUSED(event);

	rows = (size().height() - vertical_shift)/ font_height;
	update_window();
}

void hex_editor::font_setup()
{
	font.setFamily("Courier");
	font.setStyleHint(QFont::TypeWriter);
	font.setKerning(false);
	font.setPixelSize(14);
	
	QFontMetrics font_info(font);
	font_width = font_info.averageCharWidth();
	font_height = font_info.height();
	hex_offset = column_width(11);
	ascii_offset = column_width(15+columns*3);
}

QString hex_editor::get_status_text()
{
	QString text;
	QTextStream string_stream(&text);
	if(selection_active){
		int position1 = get_buffer_position(selection_start);
		int position2 = get_buffer_position(selection_current);
		if(position1 > position2){
			qSwap(position1, position2);
		}
		if(position1 < 0){
			position1 += offset;
		}
		
		string_stream << "Selection range: $" << buffer->get_formatted_address(position1)
		              << " to $" << buffer->get_formatted_address(position2);
	}else{
		int position = get_buffer_position(cursor_position);
		unsigned char byte = buffer->at(position);
		
		string_stream << "Current offset: $" << buffer->get_formatted_address(position)
		              << "    Hex: 0x" << QString::number(byte, 16).rightJustified(2, '0').toUpper()
		              << "    Dec: " << QString::number(byte).rightJustified(3, '0')
		              << "    Bin: %" << QString::number(byte, 2).rightJustified(8, '0');
	}
	return text;
}

int hex_editor::get_selection_point(QPoint point)
{
	if(point.y() < 0){
		point.setY(vertical_offset);
		point.setX(column_width(11));
	}else if(point.y() > column_height(rows)+vertical_offset - font_height){
		point.setY(column_height(rows)+vertical_offset -font_height);
		point.setX(column_width(11+columns*3)-font_width);
	}
	return get_buffer_position(point);
}

bool hex_editor::get_selection_range(int position[2])
{
	position[0] = get_buffer_position(selection_start) + buffer->header_size();
	position[1] = get_buffer_position(selection_current) + buffer->header_size();
	if(position[0] > position[1]){
		qSwap(position[0], position[1]);
		qSwap(selection_start, selection_current);
	}
	position[1]++;
	return selection_active;
}

bool hex_editor::follow_selection(bool type)
{
	int position[2];
	if(get_selection_range(position)){
		int range = position[1]-position[0];
		if(type && (range == 1 || range == 2)){
			return true;
		}else if(!type && (range == 2 || range == 3)){
			if(buffer->validate_address(buffer->jump_address(position[1] - buffer->header_size(),
			            buffer->to_little_endian(buffer->range(position[0], position[1]))), false)){
				return true;                
			}
		}
	}
	return false;
}

int hex_editor::get_buffer_position(QPoint &point, bool byte_align)
{
	return get_buffer_position(point.x(), point.y(), byte_align);
}

int hex_editor::get_buffer_position(int x, int y, bool byte_align)
{
	int position = (x - column_width(11)) / font_width;
	position -= position / 3;
	position = ((y-vertical_offset)/font_height)*columns*2+position+offset*2;
	return byte_align ? position/2 : position;
	
}

QPoint hex_editor::get_byte_position(int address, bool byte_align)
{
	int nibble_offset = 0;
	if(!byte_align){
		nibble_offset += (address & 1) * font_width;
		address /= 2;
	}
	int screen_relative = address - offset;
	return QPoint(column_width((screen_relative % columns)*3+11)+nibble_offset, 
	              column_height(screen_relative / columns) + vertical_offset);
}

void hex_editor::update_cursor_position(int x, int y, bool do_update)
{
	if(get_buffer_position(x, y) == buffer->size() && column_width(10+columns*3) == x){
		cursor_position.setX(x);
	}else if(x == column_width(11+columns*3)){
		cursor_position.setX(column_width(12));
		if(y + font_height > column_height(rows)){
			offset += columns;
		}else{
			cursor_position.setY(y + font_height);
		}
	}else{
		int position = get_buffer_position(x, y, false);
		if(position < 0){
			position = 0;
		}else if(position/2 > buffer->size()){
			position = buffer->size()*2-1;
		}
		while(position/2 >= offset + rows * columns){
			offset += columns;
		}
		while(position/2 < offset){
			offset -= columns;
		}
		cursor_position = get_byte_position(position, false);
	}
	
	if(do_update){
		update_window();
	}
}

void hex_editor::update_selection_position(int amount)
{
	int new_offset = offset + amount;
	if(new_offset > 0 && new_offset < buffer->size()){
		offset = new_offset;
		selection_start -= QPoint(0, amount);
		selection_current -= QPoint(0, amount);
	}
	update();
}

void hex_editor::update_selection(int x, int y)
{
	int old_offset = offset;
	QPoint last_byte = get_byte_position(buffer->size()-1);
	if(x < column_width(11)){
		x = column_width(11);
	}else if(x >= column_width(10+columns*3)-font_width){
		x = column_width(10+columns*3)-font_width*2;
	}else if(x >= last_byte.x()-font_width && y-font_height >= last_byte.y()){
		x = last_byte.x()-font_width*2;
	}
	x -= font_width;
	
	if(y < vertical_offset && !offset){
		y = vertical_offset;
	}else if(y > vertical_offset + column_height(rows) && offset == buffer->size()-rows*columns){
		y = vertical_offset + column_height(rows);
	}
	
	QPoint position = get_byte_position(get_buffer_position(x+font_width, y-vertical_shift));
	update_cursor_position(position.x(), position.y(), false);
	
	if(old_offset != offset){
		selection_start.setY(selection_start.y() - (offset - old_offset));
	}
	selection_current = cursor_position;
	update_window();
}

void hex_editor::update_window()
{
	if(!scroll_mode){
		emit update_slider(offset / columns);
		emit update_range(get_max_lines()+1);
	}else{
		emit update_range(height());
	}
	emit update_status_text(get_status_text());
	cursor_state = true;
	update();
	emit selection_toggled(selection_active);
}

void hex_editor::search_error(int error, QString find, QString replace_with)
{
	if(error == ROM_buffer::INVALID_REPLACE){
		update_status_text("Error: Invalid replace hex string: " + replace_with);
	}else if(error == ROM_buffer::INVALID_FIND){
		update_status_text("Error: Invalid find hex string: " + find);
	}else if(error == ROM_buffer::NOT_FOUND){
		update_status_text("Error: String " + find + " not found.");
	}
}

hex_editor::~hex_editor()
{
	emit selection_toggled(false);
	emit clipboard_usable(false);
	emit focused(false);
	delete buffer;
}

const QString hex_editor::offset_header = "Offset     00 01 02 03 04 05 06 07 08 09 0A 0B 0C 0D 0E 0F";
