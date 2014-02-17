#ifndef GENERIC_MENU_ITEM_H
#define GENERIC_MENU_ITEM_H

#include "menus/abstract_menu_item.h"
#include "hex_editor.h"
#include "main_window.h"
#include "dialog_manager.h"

template <typename W>
class generic_menu_item : public abstract_menu_item
{
	public:
		using abstract_menu_item::abstract_menu_item;
		void connect_to_widget(W widget)
		{
			connect(static_cast<abstract_menu_item *>(this), 
			        SIGNAL(triggered()),widget, run.toUtf8().data());
			if(toggle != ""){
				connect(widget, toggle.toUtf8().data(), 
				        static_cast<abstract_menu_item *>(this), SLOT(setEnabled(bool)));
			}
		}
		
};

#endif // GENERIC_MENU_ITEM_H
