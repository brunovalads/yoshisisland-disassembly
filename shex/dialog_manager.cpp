#include "dialog_manager.h"
#include "hex_editor.h"

dialog_manager::dialog_manager(QObject *parent) :
        QObject(parent)
{
	dialog_list.append(new goto_dialog());
	dialog_list.append(new select_range_dialog());
	dialog_list.append(new expand_ROM_dialog());
	dialog_list.append(new metadata_editor_dialog());
	dialog_list.append(new find_replace_dialog());
	dialog_list.append(new map_editor_dialog());
}

void dialog_manager::connect_to_editor(hex_editor *editor)
{
	connect(find_dialog("goto"), SIGNAL(triggered(int)), editor, SLOT(goto_offset(int)));
	connect(find_dialog("select_range"), SIGNAL(triggered(int,int)), editor, SLOT(select_range(int,int)));
	connect(find_dialog("find_replace"), SIGNAL(count(QString, bool)), editor, SLOT(count(QString, bool)));
	connect(find_dialog("find_replace"), SIGNAL(search(QString, bool, bool)),
	        editor, SLOT(search(QString, bool, bool)));
	connect(find_dialog("find_replace"), SIGNAL(replace(QString, QString, bool, bool)),
	        editor, SLOT(replace(QString, QString, bool, bool)));
	connect(find_dialog("find_replace"), SIGNAL(replace_all(QString, QString, bool)),
	        editor, SLOT(replace_all(QString, QString, bool)));
}

void dialog_manager::set_active_editor(hex_editor *editor)
{
	foreach(abstract_dialog *dialog, dialog_list){
		dialog->set_active_editor(editor);
		dialog->refresh();
	}
}

void dialog_manager::raise_dialog(QString id)
{
	abstract_dialog *dialog = find_dialog(id);
	dialog->show();
	dialog->raise();
	dialog->activateWindow();
}

abstract_dialog *dialog_manager::find_dialog(QString id)
{
	foreach(abstract_dialog *dialog, dialog_list){
		if(dialog->id() == id){
			return dialog;
		}
	}
	qDebug() << "Error: Dialog " << id << " not found";
	return 0;
}

dialog_manager::~dialog_manager()
{
	foreach(abstract_dialog *dialog, dialog_list){
		delete dialog;
	}
}
