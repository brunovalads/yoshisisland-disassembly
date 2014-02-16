#ifndef ABSTRACT_MENU_ITEM_H
#define ABSTRACT_MENU_ITEM_H

#include <QAction>
#include "debug.h"

class hex_editor;
class main_window;
class dialog_manager;
class QUndoGroup;
class disassembler;

class abstract_menu_item : public QAction
{
		Q_OBJECT
	public:
		abstract_menu_item(QString text, QWidget *parent) : QAction(text, parent){};
		abstract_menu_item(QString text, QString r, QString t, QKeySequence hotkey, QWidget *parent);
		virtual void connect_to_widget(QWidget *widget){ qDebug() << "Not a recognized widget" << widget; }
		virtual void connect_to_widget(hex_editor *editor){Q_UNUSED(editor);}
		virtual void connect_to_widget(main_window *window){Q_UNUSED(window);}
		virtual void connect_to_widget(QUndoGroup *group){Q_UNUSED(group);}
		virtual void connect_to_widget(dialog_manager *dialog_controller){Q_UNUSED(dialog_controller);}
		virtual void connect_to_widget(disassembler *disassembly_panel){Q_UNUSED(disassembly_panel);}
		
	protected:
		QString run;
		QString toggle;
		
};

#endif // ABSTRACT_MENU_ITEM_H
