#include <QMenuBar>
#include "menu_manager.h"
#include "menus/history_menu_item.h"
#include "menus/generic_menu_item.h"
#include "menus/toggle_menu_item.h"
#include "rom_buffer.h"
#include "disassembler.h"
#include "debug.h"


menu_manager::menu_manager(QObject *parent, QMenuBar *m) :
        QObject(parent)
{
	menu_bar = m;
	create_menus();
	create_actions();
	connect(copy_group, SIGNAL(triggered(QAction*)), this, SLOT(group_callback(QAction*)));
}

void menu_manager::create_menus()
{
	menu_list.append(new QMenu("&File"));
	menu_list.append(new QMenu("&Edit"));
	menu_list.append(new QMenu("&Navigation"));
	menu_list.append(new QMenu("&ROM utilities"));
	menu_list.append(new QMenu("&Options"));
	menu_list.append(new QMenu("&Help"));
	
	foreach(QMenu *menu, menu_list){
		menu_bar->addMenu(menu);
	}
	menu_list.append(new QMenu("&Copy style"));
}

void menu_manager::create_actions()
{
typedef QKeySequence hotkey;
#define add_toggle_action(M,N,R,T,H) menu->addAction(new generic_menu_item<M *>(N, SLOT(R), SIGNAL(T), H, menu))
#define add_widget_toggle_action(M,N,R,H) menu->addAction(new toggle_menu_item<M *>(N, SLOT(R), "", H, menu))
#define add_action(M,N,R,H) menu->addAction(new generic_menu_item<M *>(N, SLOT(R), "", H, menu))
#define add_group_action(C,N,R,E,H) menu->addAction(C->addAction(new group_menu_item(N, SLOT(R), E, H, menu)))
#define add_history_action(N,R,H) menu->addAction(new history_menu_item(N, SLOT(R), "", H, menu))
	QMenu *menu = find_menu("&File");
	add_action(main_window, "&New", new_file(), hotkey::New);
	add_action(main_window, "&Open", open(), hotkey::Open);
	add_action(main_window, "&Save", save(), hotkey::Save);
	add_action(main_window, "&Save as", save_as(), hotkey::SaveAs);
	menu->addSeparator();
	add_toggle_action(main_window, "&Close tab", close_tab(), active_editors(bool), hotkey::Close);
	add_action(main_window, "E&xit", close(), hotkey::Quit);

	menu = find_menu("&Edit");
	add_history_action("U&ndo", update_undo_action(bool), hotkey::Undo);
	add_history_action("R&edo", update_undo_action(bool), hotkey::Redo);
	menu->addSeparator();
	add_toggle_action(hex_editor, "Cu&t", cut(), selection_toggled(bool),hotkey::Cut);
	add_toggle_action(hex_editor, "&Copy", copy(), selection_toggled(bool), hotkey::Copy);
	add_toggle_action(hex_editor, "&Paste", paste(), clipboard_usable(bool), hotkey::Paste);
	add_toggle_action(hex_editor, "&Delete", delete_text(), selection_toggled(bool), hotkey::Delete);
	menu->addSeparator();
	add_toggle_action(hex_editor, "&Select all", select_all(), focused(bool), hotkey::SelectAll);
	add_toggle_action(dialog_manager, "Select &range", 
	                  show_select_range_dialog(), active_editors(bool), hotkey("Ctrl+r"));
	menu->addSeparator();
	add_toggle_action(dialog_manager, "&Find/Replace", 
	                  show_find_replace_dialog(), active_editors(bool), hotkey("Ctrl+f"));

	menu = find_menu("&Navigation");
	add_toggle_action(dialog_manager, "&Goto offset", show_goto_dialog(), active_editors(bool), hotkey("Ctrl+g"));
	
	menu = find_menu("&ROM utilities");
	add_toggle_action(dialog_manager, "&Expand ROM", show_expand_dialog(), active_editors(bool), hotkey("Ctrl+e"));
	add_toggle_action(dialog_manager, "&Metadata editor", 
	                  show_metadata_editor_dialog(), active_editors(bool), hotkey("Ctrl+m"));
	menu->addSeparator();
	add_toggle_action(hex_editor, "Follow &branch", branch(), focused(bool),hotkey("Ctrl+b"));
	add_toggle_action(hex_editor, "Follow &jump", jump(), focused(bool), hotkey("Ctrl+j"));
	add_toggle_action(hex_editor, "&Disassemble", disassemble(), focused(bool), hotkey("Ctrl+d"));

	menu = find_menu("&Options");
	add_toggle_action(hex_editor, "&Scrollbar toggle", scroll_mode_changed(), focused(bool), hotkey("Alt+s"));
	add_action(dialog_manager, "&Character map editor", show_map_editor_dialog(), hotkey("Alt+c"));
	add_widget_toggle_action(disassembler, "Disassembly panel toggle", toggle_display(bool), hotkey("Alt+d"));
	menu->addMenu(find_menu("&Copy style"));
	menu = find_menu("&Copy style");
	add_group_action(copy_group, "&No space", set_copy_style(int), ROM_buffer::NO_SPACES, hotkey("Alt+1"));
	add_group_action(copy_group, "&Spaces", set_copy_style(int), ROM_buffer::SPACES, hotkey("Alt+2"));
	add_group_action(copy_group, "&Hex format", set_copy_style(int), ROM_buffer::HEX_FORMAT, hotkey("Alt+3"));
	add_group_action(copy_group, "&Byte table", set_copy_style(int), ROM_buffer::ASM_BYTE_TABLE, hotkey("Alt+4"));
	add_group_action(copy_group, "&Word table", set_copy_style(int), ROM_buffer::ASM_WORD_TABLE, hotkey("Alt+5"));
	add_group_action(copy_group, "&Long table", set_copy_style(int), ROM_buffer::ASM_LONG_TABLE, hotkey("Alt+6"));
	add_group_action(copy_group, "&C source", set_copy_style(int), ROM_buffer::C_SOURCE, hotkey("Alt+7"));
	enable_checkable(copy_group);

	menu = find_menu("&Help");
	add_action(main_window, "&Version", version(), hotkey("Alt+v"));

#undef add_action
#undef add_toggle_action
}

QMenu *menu_manager::find_menu(QString id)
{
	foreach(QMenu *menu, menu_list){
		if(menu->title() == id){
			return menu;
		}
	}
	qDebug() << "Error: Menu " << id << " not found";
	return 0;
}

void menu_manager::enable_checkable(QActionGroup *group)
{
	QList<QAction *> actions = group->actions();
	foreach(QAction *current, actions){
		current->setCheckable(true);
	}
	actions.first()->setChecked(true);
}

menu_manager::~menu_manager()
{
	foreach(QMenu *menu, menu_list){
		delete menu;
	}
}
