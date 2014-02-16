#ifndef FIND_DIALOG_H
#define FIND_DIALOG_H
#include "abstract_dialog.h"

#include <QLabel>
#include <QComboBox>
#include <QRadioButton>
#include <QPushButton>
#include <QButtonGroup>

class find_replace_dialog : public abstract_dialog
{
		Q_OBJECT
	public:
		explicit find_replace_dialog();
		virtual QString id(){ return "find_replace"; }
		
	signals:
		void count(QString find, bool mode);
		void search(QString find, bool direction, bool mode);
		void replace(QString find, QString replace, bool direction, bool mode);
		void replace_all(QString find, QString replace, bool mode);
		
	public slots:
#define text(I) I##_input->currentText()
		void count_clicked(){ emit count(text(find), hex->isChecked()); }
		void search_clicked(){ emit search(text(find), next->isChecked(), hex->isChecked()); }
		void replace_clicked(){ emit replace(text(find), text(replace), next->isChecked(), hex->isChecked()); }
		void replace_all_clicked(){ emit replace_all(text(find), text(replace), hex->isChecked()); }
#undef text

	private:
		QButtonGroup *direction = new QButtonGroup(this);
		QButtonGroup *search_type = new QButtonGroup(this);
		
		QLabel *find_label = new QLabel("Find: ", this);
		QComboBox *find_input = new QComboBox(this);
		QLabel *replace_label = new QLabel("Replace with: ", this);
		QComboBox *replace_input = new QComboBox(this);
		QRadioButton *next = new QRadioButton("&Next", this);
		QRadioButton *previous = new QRadioButton("&Previous", this);
		QRadioButton *hex = new QRadioButton("&Hex", this);
		QRadioButton *ascii = new QRadioButton("&ASCii", this);
		QPushButton *find_button = new QPushButton("&Find", this);
		QPushButton *replace_button = new QPushButton("&Replace", this);
		QPushButton *replace_all_button = new QPushButton("Replace All", this);
		QPushButton *count_button = new QPushButton("&Count", this);
		QPushButton *close = new QPushButton("Close", this);
};

#endif // FIND_DIALOG_H
