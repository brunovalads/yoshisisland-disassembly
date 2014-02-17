#include "group_menu_item.h"
#include "main_window.h"

group_menu_item::group_menu_item(QString text, QString r, int v, QKeySequence hotkey, QWidget *parent) :
        abstract_menu_item(text, parent)
{
	run = r;
	value = v;
	setShortcut(hotkey);
}

void group_menu_item::connect_to_widget(main_window *window)
{
	connect(this, SIGNAL(triggered(int)), window, run.toUtf8().data());
}
