#ifndef TOGGLE_MENU_ITEM_H
#define TOGGLE_MENU_ITEM_H

#include "menus/abstract_menu_item.h"
#include "disassembler.h"

template <typename W>
class toggle_menu_item : public abstract_menu_item
{
	public:
		using abstract_menu_item::abstract_menu_item;
		void connect_to_widget(W widget)
		{
			if(!isCheckable()){
				setCheckable(true);
				setChecked(false);
			}
			connect(static_cast<abstract_menu_item *>(this), 
			        SIGNAL(toggled(bool)), widget, run.toUtf8().data());
			if(toggle != ""){
				connect(widget, toggle.toUtf8().data(), 
				        static_cast<abstract_menu_item *>(this), SLOT(setEnabled(bool)));
			}
		}
		
};

#endif // TOGGLE_MENU_ITEM_H
