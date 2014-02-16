#ifndef HISTORY_MENU_ITEM_H
#define HISTORY_MENU_ITEM_H
#include "menus/abstract_menu_item.h"

class QUndoGroup;
class hex_editor;

class history_menu_item : public abstract_menu_item
{
		Q_OBJECT
	public:
		history_menu_item(QString text, QString r, QString t, QKeySequence hotkey, QWidget *parent);
		virtual void connect_to_widget(QUndoGroup *group);
		virtual void connect_to_widget(hex_editor *editor);
	signals:
		void run_history_update(bool direction);
		
	public slots:
		void set_prefix(const QString &t);
		inline void activated(){ emit run_history_update((text() == "U&ndo") ? true : false); }
		
	private:
		QString prefix;
		
};

#endif // HISTORY_MENU_ITEM_H
