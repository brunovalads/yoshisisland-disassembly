#include "map_editor_dialog.h"
#include "character_mapper.h"
#include <QGridLayout>
#include <QLineEdit>
#include <QLabel>
#include <QFileDialog>
#include <QPalette>
#include "debug.h"

map_editor_dialog::map_editor_dialog
()
{
	QGridLayout *layout = new QGridLayout(this);
	layout->setHorizontalSpacing(0);
	layout->setVerticalSpacing(0);
	int letter = 0x20;
	for(int i = 0; i < 10; i+=2){
		for(int j = 0; j < 19; j++){
			QLabel *letter_label = new QLabel(" " + QString(letter) + " ", this);
			QLineEdit *line_edit = new QLineEdit(QString::number(letter, 16), this);
			line_edit->setProperty("maxLength", 2);
			line_edit->setMaximumWidth(line_edit->minimumSizeHint().width()*2);
			line_edit->setInputMask("HH");
			QPalette palette = line_edit->palette();
			if(i/2&1){
				palette.setColor(QPalette::Background, palette.alternateBase().color());
				palette.setColor(QPalette::Base, palette.alternateBase().color());
				
			}else{
				palette.setColor(QPalette::Background, palette.base().color());
				palette.setColor(QPalette::Base, palette.base().color());
			}
			line_edit->setPalette(palette);
			letter_label->setPalette(palette);
			letter_label->setAutoFillBackground(true);
			input_list.append(line_edit);
			layout->addWidget(letter_label, j, i);
			layout->addWidget(line_edit, j, i+1);
			letter++;
		}
	}
	load->setStatusTip("Loads a new active map.");
	save->setStatusTip("Saves and applies the edited map.");
	apply->setStatusTip("Applies without saving the edited map.");
	clear->setStatusTip("Clear the active map.");
	layout->addWidget(load, 20, 0, 1, 2);
	layout->addWidget(save, 20, 2, 1, 2);
	layout->addWidget(apply, 20, 4, 1, 2);
	layout->addWidget(clear, 20, 6, 1, 2);
	layout->addWidget(close, 20, 8, 1, 2);
	setLayout(layout);

	connect(load, SIGNAL(clicked()), this, SLOT(load_map()));
	connect(save, SIGNAL(clicked()), this, SLOT(save_map()));
	connect(apply, SIGNAL(clicked()), this, SLOT(apply_map()));
	connect(clear, SIGNAL(clicked()), this, SLOT(clear_map()));
	connect(close, SIGNAL(clicked()), this, SLOT(close()));
}

void map_editor_dialog::load_map()
{
	active_map = QFileDialog::getOpenFileName(this, "Open file", QDir::homePath(), 
	                                          "Map files (*.map *.txt);;All files(*.*)");
	character_mapper::load_map(active_map);
	if(active_editor){
		active_editor->update();
	}
	QMap<unsigned char, unsigned char> *loaded_map = character_mapper::get_map();
	for(int i = 0; i < 0x5F; i++){
		input_list[i]->setText(QString::number(loaded_map->value(i+0x20), 16).rightJustified(2, '0'));
	}
}

void map_editor_dialog::save_map()
{
	apply_map();
	QString save = QFileDialog::getSaveFileName(this, "Open file", QDir::homePath(), 
	                                          "Map files (*.map *.txt);;All files(*.*)");	
	character_mapper::save_map(save);
}

void map_editor_dialog::apply_map()
{
	QMap<unsigned char, unsigned char> *new_map = new QMap<unsigned char, unsigned char>;

	for(int i = 0; i < 0x5F; i++){
		new_map->insert(i+0x20, input_list[i]->text().toInt(0, 16));
	}
	
	character_mapper::set_map(new_map);
	if(active_editor){
		active_editor->update();
	}
}

void map_editor_dialog::clear_map()
{
	for(int i = 0; i < 0x5F; i++){
		input_list[i]->setText(QString::number(i+0x20, 16).rightJustified(2, '0'));
	}
	apply_map();
}
