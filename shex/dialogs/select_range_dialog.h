#ifndef select_range_DIALOG_H
#define select_range_DIALOG_H

#include <QLabel>
#include <QPushButton>
#include <QRadioButton>
#include <QLineEdit>

#include "abstract_dialog.h"

class select_range_dialog : public abstract_dialog
{
		Q_OBJECT
	public:
		explicit select_range_dialog();
		virtual QString id(){ return "select_range"; }
		
	signals:
		void triggered(int start, int end);
		
	public slots:
		void range_entered();
		
	private:
		QLabel *start_label = new QLabel("&Starting SNES offset: ", this);
		QLineEdit *start_input = new QLineEdit(this);
		QLabel *end_label = new QLabel("&Ending SNES offset: ", this);
		QLineEdit *end_input = new QLineEdit(this);
		QRadioButton *absolute = new QRadioButton("Absolute offsets", this);
		QRadioButton *relative = new QRadioButton("Relative offsets", this);
		
		QPushButton *select_range = new QPushButton("Select range", this);
		QPushButton *close = new QPushButton("Close", this);
		
		int parse_input(QString input);
};

#endif // select_range_DIALOG_H
