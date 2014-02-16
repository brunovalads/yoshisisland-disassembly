#include "abstract_menu_item.h"
#include "debug.h"

abstract_menu_item::abstract_menu_item(QString text, QString r, QString t, QKeySequence hotkey, QWidget *parent) :
        QAction(text, parent)
{
	run = r;
	toggle = t;
	setShortcut(hotkey);
}
