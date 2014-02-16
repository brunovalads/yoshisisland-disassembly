#include "goto_dialog.h"
#include "debug.h"

#include <QGridLayout>
#include <QMessageBox>

goto_dialog::goto_dialog()
{
	connect(close, SIGNAL(clicked()), this, SLOT(close()));
	connect(goto_offset, SIGNAL(clicked()), this, SLOT(address_entered()));
	
	label->setBuddy(offset_input);
	absolute->setChecked(true);
	
	QGridLayout *layout = new QGridLayout(this);
	layout->addWidget(label, 0, 0);
	layout->addWidget(offset_input, 0, 1, 1, 2);
	layout->addWidget(absolute, 1, 0, 1, 3);
	layout->addWidget(relative, 2, 0, 1, 3);
	layout->addWidget(goto_offset, 3, 1);
	layout->addWidget(close, 3, 2);
	setLayout(layout);
	
	offset_input->setProperty("maxLength", 7);
}

void goto_dialog::address_entered()
{
	bool status;
	QString input = offset_input->text().remove(QRegExp("[^0-9A-Fa-f]"));
	int address = input.toInt(&status, 16);
	if(input.isEmpty()){
		return;
	}
	if(relative->isChecked()){
		address = active_editor->get_buffer()->pc_to_snes(active_editor->get_relative_position(address));
	}
	if(validate_address(address)){
		emit triggered(address);
	}
}
