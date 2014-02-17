#include "find_replace_dialog.h"
#include <QGridLayout>
#include <QCompleter>

find_replace_dialog::find_replace_dialog()
{
	direction->addButton(next);
	direction->addButton(previous);
	next->setChecked(true);
	
	search_type->addButton(hex);
	search_type->addButton(ascii);
	hex->setChecked(true);
	
	find_input->setEditable(true);
	find_input->completer()->setCompletionMode(QCompleter::PopupCompletion);
	
	replace_input->setEditable(true);
	replace_input->completer()->setCompletionMode(QCompleter::PopupCompletion);
	
	QGridLayout *layout = new QGridLayout(this);
	layout->addWidget(find_label, 0, 0);
	layout->addWidget(find_input, 0, 1, 1, 4);
	layout->addWidget(replace_label, 1, 0);
	layout->addWidget(replace_input, 1, 1, 1, 4);
	layout->addWidget(next, 2, 0);
	layout->addWidget(previous, 2, 1);
	layout->addWidget(hex, 2, 3);
	layout->addWidget(ascii, 2, 4);
	layout->addWidget(count_button, 4, 0);
	layout->addWidget(find_button, 4, 1);
	layout->addWidget(replace_button, 4, 2);
	layout->addWidget(replace_all_button, 4, 3);
	layout->addWidget(close, 4, 4);
	setLayout(layout);

	connect(count_button, SIGNAL(clicked()), this, SLOT(count_clicked()));
	connect(find_button, SIGNAL(clicked()), this, SLOT(search_clicked()));
	connect(replace_button, SIGNAL(clicked()), this, SLOT(replace_clicked()));
	connect(replace_all_button, SIGNAL(clicked()), this, SLOT(replace_all_clicked()));
	connect(close, SIGNAL(clicked()), this, SLOT(close()));
}
