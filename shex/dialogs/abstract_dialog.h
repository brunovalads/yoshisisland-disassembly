#ifndef ABSTRACT_DIALOG_H
#define ABSTRACT_DIALOG_H

#include <QDialog>
#include "hex_editor.h"

class abstract_dialog : public QDialog
{
		Q_OBJECT
	public:
		explicit abstract_dialog();
		void set_active_editor(hex_editor *editor);
		virtual QString id() = 0;
		
	public slots:
		virtual void refresh();
		
	protected:
		hex_editor *active_editor;
		
		inline bool validate_address(int addr){ return active_editor->get_buffer()->validate_address(addr); }
		
};

#endif // ABSTRACT_DIALOG_H
