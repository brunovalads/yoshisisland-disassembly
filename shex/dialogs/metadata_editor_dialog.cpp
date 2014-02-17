#include "metadata_editor_dialog.h"
#include "debug.h"

#include <QGridLayout>

metadata_editor_dialog::metadata_editor_dialog()
{
	QGridLayout *layout = new QGridLayout(this);
	QHBoxLayout *action_buttons = new QHBoxLayout();
	
#define add_widget(ITEM, ROW, TYPE) \
	layout->addWidget(ITEM ## _label, ROW, 0); \
	layout->addWidget(current_## ITEM ##_##TYPE, ROW, 1)
	
	add_widget(mapper, 0, label);
	add_widget(chips, 1, label);
	add_widget(region, 2, label);
	add_widget(name, 3, line_edit);
	
#undef add_widget
#define label_init(ENUM, NAME, COLUMN, LENGTH) \
	for(int i = 0; i < ROM_metadata::ENUM ##_COUNT; i++){ \
		NAME ##_labels[i] = new QLabel(ROM_metadata::NAME ##_strings[i].second + ":",this); \
		current_## NAME ##_line_edits[i] = new QLineEdit("", this); \
		current_## NAME ##_line_edits[i]->setProperty("maxLength", LENGTH); \
		layout->addWidget(NAME ## _labels[i], base_row+i, COLUMN); \
		layout->addWidget(current_## NAME ##_line_edits[i], base_row+i, COLUMN+1); \
	} \
	base_row += ROM_metadata::ENUM ##_COUNT
	
	int base_row = 4;
	label_init(HEADER, header, 0, 3);
	base_row = 0;
	label_init(CHECKSUM, checksum, 2, 5);
	label_init(VECTOR, vector, 2, 5);
#undef label_init
	
	layout->addLayout(action_buttons, base_row+1, 0, 1, 4);

	action_buttons->addWidget(reload);
	action_buttons->addWidget(apply);
	action_buttons->addWidget(cancel);
	setLayout(layout);
	
	current_name_line_edit->setProperty("maxLength", 21);
	connect(cancel, SIGNAL(pressed()), this, SLOT(close()));
	connect(apply, SIGNAL(pressed()), this, SLOT(write()));
	connect(reload, SIGNAL(pressed()), this, SLOT(refresh()));
}

void metadata_editor_dialog::refresh()
{
	if(active_editor){
		ROM_buffer *buffer = active_editor->get_buffer();
		current_mapper_label->setText(ROM_metadata::mapper_strings[buffer->get_mapper()].second);
		current_chips_label->setText(calculate_chips());
		current_region_label->setText(ROM_metadata::region_strings[buffer->get_cart_region()].second);
		current_name_line_edit->setText(buffer->get_cart_name());
		current_name_line_edit->setCursorPosition(0);
		
		for(int i = 0; i < ROM_metadata::HEADER_COUNT; i++){
			QString field = "$" + QString::number(buffer->get_header_field(
			                ROM_metadata::header_strings[i].first),16).toUpper().rightJustified(2,'0');
			current_header_line_edits[i]->setText(field);
		}
		for(int i = 0; i < ROM_metadata::CHECKSUM_COUNT; i++){
			QString field = "$" + QString::number(buffer->get_header_field(
			                ROM_metadata::checksum_strings[i].first),16).toUpper().rightJustified(4,'0');
			current_checksum_line_edits[i]->setText(field);
		}
		for(int i = 0; i < ROM_metadata::VECTOR_COUNT; i++){
			QString field = "$"+ QString::number(buffer->get_vector(
			                ROM_metadata::vector_strings[i].first), 16).toUpper().rightJustified(4,'0');
			current_vector_line_edits[i]->setText(field);
		}
		
	}
	abstract_dialog::refresh();
}

void metadata_editor_dialog::write()
{
	ROM_buffer *buffer = active_editor->get_buffer();
	buffer->update_cart_name(current_name_line_edit->text().leftJustified(21, ' '));
	
	for(int i = 0; i < ROM_metadata::HEADER_COUNT; i++){
		buffer->update_header_field(ROM_metadata::header_strings[i].first, 
		                            validate_hex(current_header_line_edits[i]->text()));
	}
	for(int i = 0; i < ROM_metadata::CHECKSUM_COUNT; i++){
		buffer->update_header_field(ROM_metadata::checksum_strings[i].first, 
		                            validate_hex(current_checksum_line_edits[i]->text()));
	}
	for(int i = 0; i < ROM_metadata::VECTOR_COUNT; i++){
		buffer->update_vector(ROM_metadata::vector_strings[i].first, 
		                            validate_hex(current_vector_line_edits[i]->text()));
	}
	
	buffer->analyze();
	refresh();
	active_editor->update();
}

QString metadata_editor_dialog::calculate_chips()
{
	QString chips;
	ROM_buffer *buffer = active_editor->get_buffer();
	for(int i = 0; i < ROM_metadata::NO_CHIPS; i++){
		if(buffer->has_chip((ROM_metadata::cart_chips)i)){
			if(chips != ""){
				chips.append(", ");
			}
			chips.append(buffer->chip_strings[i].second);
		}
	}
	if(chips == ""){
		chips.append(buffer->chip_strings[ROM_metadata::NO_CHIPS].second);
	}

	return chips;
}

unsigned short metadata_editor_dialog::validate_hex(QString input)
{
	bool status;
	return input.remove(QRegExp("[^0-9A-Fa-f]")).toInt(&status, 16);
}
