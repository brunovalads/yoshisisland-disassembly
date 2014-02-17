#include "select_range_dialog.h"
#include "debug.h"

#include <QGridLayout>
#include <QMessageBox>

select_range_dialog::select_range_dialog()
{	
	connect(close, SIGNAL(clicked()), this, SLOT(close()));
	connect(select_range, SIGNAL(clicked()), this, SLOT(range_entered()));
	
	start_label->setBuddy(start_input);
	end_label->setBuddy(end_input);
	absolute->setChecked(true);
	
	QGridLayout *layout = new QGridLayout(this);
	layout->addWidget(start_label, 0, 0);
	layout->addWidget(start_input, 0, 1, 1, 2);
	layout->addWidget(end_label, 1, 0);
	layout->addWidget(end_input, 1, 1, 1, 2);
	layout->addWidget(absolute, 2, 0, 1, 3);
	layout->addWidget(relative, 3, 0, 1, 3);
	layout->addWidget(select_range, 4, 1);
	layout->addWidget(close, 4, 2);
	setLayout(layout);
	
	start_input->setProperty("maxLength", 7);
	end_input->setProperty("maxLength", 7);
}

void select_range_dialog::range_entered()
{
	int start_address = parse_input(start_input->text());
	int end_address = parse_input(end_input->text());
	if(relative->isChecked()){
		start_address = active_editor->get_buffer()->pc_to_snes(active_editor->get_relative_position(start_address));
		end_address = active_editor->get_buffer()->pc_to_snes(active_editor->get_relative_position(end_address));
	}
	if(!validate_address(start_address) || !validate_address(end_address)){
		return;
	}
	if(start_address > end_address){
		qSwap(start_address, end_address);
	}
	emit triggered(start_address, end_address);
}

int select_range_dialog::parse_input(QString input)
{
	bool status;
	input.remove(QRegExp("[^0-9A-Fa-f]"));
	int address = input.toInt(&status, 16);
	if(address > 1 << 24){
		status = false;
	}else if(input.isEmpty()){
		return -1;
	}
	
	return address;
}
