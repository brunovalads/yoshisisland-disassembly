#ifndef DIALOG_MANAGER_H
#define DIALOG_MANAGER_H

#include "dialogs/find_replace_dialog.h"
#include "dialogs/goto_dialog.h"
#include "dialogs/select_range_dialog.h"
#include "dialogs/expand_rom_dialog.h"
#include "dialogs/metadata_editor_dialog.h"
#include "dialogs/map_editor_dialog.h"

#include "debug.h"

#include <QObject>

class hex_editor;

class dialog_manager : public QObject
{
		Q_OBJECT
	public:
		explicit dialog_manager(QObject *parent = 0);
		~dialog_manager();
		
		void connect_to_editor(hex_editor *editor);
		void set_active_editor(hex_editor *editor);
		
	signals:
		void active_editors(bool active);
		
	public slots:
		inline void show_goto_dialog() { raise_dialog("goto"); }
		inline void show_select_range_dialog() { raise_dialog("select_range"); }
		inline void show_expand_dialog(){ raise_dialog("expand_ROM"); }
		inline void show_metadata_editor_dialog(){ raise_dialog("metadata_editor"); }
		inline void show_find_replace_dialog(){ raise_dialog("find_replace"); }
		inline void show_map_editor_dialog(){ raise_dialog("map_editor"); }
		
	private:
		QList<abstract_dialog *> dialog_list;
		
		void raise_dialog(QString id);
		abstract_dialog *find_dialog(QString id);
		
};

#endif // DIALOG_MANAGER_H
