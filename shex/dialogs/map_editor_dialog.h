#ifndef MAP_EDITOR_DIALOG_H
#define MAP_EDITOR_DIALOG_H

#include "dialogs/abstract_dialog.h"
#include <QPushButton>
#include <QList>

class QLineEdit;
class map_editor_dialog : public abstract_dialog
{
		Q_OBJECT
	public:
		explicit map_editor_dialog();
		virtual QString id(){ return "map_editor"; }
		virtual void refresh(){}
		
	public slots:
		void load_map();
		void save_map();
		void apply_map();
		void clear_map();
	
	private:
		QPushButton *load = new QPushButton("&Load", this);
		QPushButton *save = new QPushButton("&Save", this);
		QPushButton *apply = new QPushButton("&Apply", this);
		QPushButton *clear = new QPushButton("&Clear", this);
		QPushButton *close = new QPushButton("Clos&e", this);
		
		QString active_map;
		QList<QLineEdit *> input_list;
};

#endif // MAP_EDITOR_DIALOG_H
