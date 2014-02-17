#ifndef GROUP_MENU_ITEM_H
#define GROUP_MENU_ITEM_H
#include "abstract_menu_item.h"

class group_menu_item : public abstract_menu_item
{
		Q_OBJECT
	public:
		group_menu_item(QString text, QString r, int v, QKeySequence hotkey, QWidget *parent);
		virtual void connect_to_widget(main_window *window);
		void run_trigger(){ emit triggered(value); }
		
	signals:
		void triggered(int);
		
	private:
		int value;
	
		
};

#endif // GROUP_MENU_ITEM_H
