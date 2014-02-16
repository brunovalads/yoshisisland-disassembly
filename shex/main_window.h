#ifndef MAIN_WINDOW_H
#define MAIN_WINDOW_H

#include <QMainWindow>
#include <QUndoGroup>
#include <QAction>
#include "dialog_manager.h"
#include "menu_manager.h"
#include "rom_buffer.h"
#include <QLayout>

#include "debug.h"
class hex_editor;
class dynamic_scrollbar;
class QLabel;
class disassembler;

class main_window : public QMainWindow
{
		Q_OBJECT
		
	public:
		main_window(QWidget *parent = 0);
		~main_window();
		
	public slots:
		inline void close_tab(){ close_tab(tab_widget->currentIndex()); }
		bool close_tab(int i);
		void changed_tab(int i);
		void file_save_state(bool clean);
		void new_file();
		void open();
		bool save(bool override_name = false, int target = -1);
		inline void save_as(){ save(true); }
		void version();
		inline void set_copy_style(int style){ ROM_buffer::set_copy_style((ROM_buffer::copy_style)style); }
		
	signals:
		void active_editors(bool active);
		
	protected:
		virtual void closeEvent(QCloseEvent *event);

	private:
		QLabel *statusbar = new QLabel(this);
		QTabWidget *tab_widget = new QTabWidget(this);
		QUndoGroup *undo_group = new QUndoGroup(this);
		dialog_manager *dialog_controller = new dialog_manager(this);
		menu_manager *menu_controller = new menu_manager(this, menuBar());
		int new_counter = 0;

		void init_connections(hex_editor *editor, dynamic_scrollbar *scrollbar, disassembler *disassembly_panel);
		void create_new_tab(QString name, bool new_file = false);
		hex_editor *get_editor(int i) const;
		
};

#endif // MAIN_WINDOW_H
