#ifndef EXPAND_ROM_DIALOG_H
#define EXPAND_ROM_DIALOG_H

#include "abstract_dialog.h"

class expand_ROM_dialog : public abstract_dialog
{
		Q_OBJECT
	public:
		explicit expand_ROM_dialog();
		virtual QString id(){ return "expand_ROM"; }
};

#endif // EXPAND_ROM_DIALOG_H
