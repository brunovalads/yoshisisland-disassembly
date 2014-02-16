#ifndef HEX_EDITOR_H
#define HEX_EDITOR_H

#include "rom_buffer.h"

#include <QWidget>
#include <QKeyEvent>
#include <QWheelEvent>
#include <QMouseEvent>
#include <QFont>
#include <QTimer>

class hex_editor : public QWidget
{
	Q_OBJECT
	public:
		explicit hex_editor(QWidget *parent, QString file_name, QUndoGroup *undo_group, bool new_file = false);
		~hex_editor();
		inline ROM_buffer *get_buffer(){ return buffer; }
		inline int get_relative_position(int address){ return get_buffer_position(cursor_position) + address; }
		virtual QSize minimumSizeHint() const;
		void set_focus();
		inline void save(QString path) { buffer->save(path); update_save_state(-save_state); }
		inline bool can_save(){ return save_state; }
		inline bool new_file(){ return is_new; }
		inline QString load_error() { return ROM_error; }
		QString get_file_name() { return buffer->get_file_name(); }

	signals:
		void update_slider(int position);
		void update_range(int value);
		void update_status_text(QString text);
		void toggle_scroll_mode(bool mode);
		void selection_toggled(bool state);
		void focused(bool has_focus);
		void clipboard_usable(bool usable);
		void can_save(bool save);
		void send_disassemble_data(QByteArray *data);

	public slots:
		void update_cursor_state();
		void update_undo_action(bool direction);
		void goto_offset(int address);
		void select_range(int start, int end);
		void slider_update(int position);
		void scroll_mode_changed();
		void auto_scroll_update();
		void control_auto_scroll(bool enabled);
		void context_menu(const QPoint& position);
		void cut();
		void copy();
		void paste(bool raw = false);
		void delete_text();
		void select_all();
		void branch();
		void jump();
		void disassemble();
		void count(QString find, bool mode);
		void search(QString find, bool direction, bool mode);
		void replace(QString find, QString replace, bool direction, bool mode);
		void replace_all(QString find, QString replace, bool mode);
		
		inline void clipboard_changed(){ emit clipboard_usable(buffer->check_paste_data()); }

	protected:
		virtual void paintEvent(QPaintEvent *event);
		virtual void paint_selection(QPainter &painter);
		virtual bool event(QEvent *e);
		virtual void keyPressEvent(QKeyEvent *event);
		virtual void handle_typed_character(unsigned char key, bool update_byte = false);
		virtual void wheelEvent(QWheelEvent *event);
		virtual void mousePressEvent(QMouseEvent *event);
		virtual void mouseMoveEvent(QMouseEvent *event);
		virtual void mouseReleaseEvent(QMouseEvent *event);
		virtual void resizeEvent(QResizeEvent *event);

	private:
		ROM_buffer *buffer;
		int columns = 16;
		int rows = 32;
		int offset = 0;
		QPoint cursor_position;
		QPoint selection_start;
		QPoint selection_current;
		bool cursor_state = false;
		bool is_dragging = false;
		bool selection_active = false;
		bool click_side = false;
		bool is_active = true;
		QFont font;
		int font_width;
		int font_height;
		int vertical_offset = 6;
		int vertical_shift;
		bool scroll_mode = false;
		bool auto_scrolling;
		QTimer *scroll_timer = new QTimer(this);
		int hex_offset;
		int ascii_offset;
		int scroll_speed;
		bool scroll_direction;
		QPoint mouse_position;
		int save_state = 0;
		bool is_new;
		QString ROM_error = "";
		
		void font_setup();
		QString get_status_text();
		int get_selection_point(QPoint point);
		bool get_selection_range(int position[2]);
		bool follow_selection(bool type);
		int get_buffer_position(int x, int y, bool byte_align = true);
		int get_buffer_position(QPoint &point, bool byte_align = true);
		QPoint get_byte_position(int address, bool byte_align = true);
		void update_nibble(char byte);
		void update_cursor_position(int x, int y, bool do_update = true);
		void update_selection_position(int amount);
		void update_selection(int x, int y);
		void update_window();
		void search_error(int error, QString find = "", QString replace_with = "");
		
		inline int column_width(int size){ return size * font_width; }
		inline int column_height(int size){ return size * font_height; }
		inline int to_ascii_column(int x){ return column_width(14+columns*3+(x-font_width*11)/font_width/3); }
		inline int to_hex_column(int x){ return column_width(11+(x-font_width*(14+columns*3))/font_width*3); }
		inline int get_max_lines(){ return buffer->size() / columns - rows; }
		inline void set_selection_active(bool s){ selection_active = s; emit selection_toggled(s); }
		inline void update_save_state(int direction){ save_state += direction; emit can_save(!save_state); }
		
		static const QString offset_header;
};

#endif // HEX_EDITOR_H
