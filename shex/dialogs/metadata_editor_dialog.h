#ifndef METADATA_EDITOR_DIALOG_H
#define METADATA_EDITOR_DIALOG_H

#include <QLabel>
#include <QPushButton>
#include <QRadioButton>
#include <QLineEdit>

#include "abstract_dialog.h"
#include "hex_editor.h"

class metadata_editor_dialog : public abstract_dialog
{
		Q_OBJECT
	public:
		explicit metadata_editor_dialog();
		virtual QString id(){ return "metadata_editor"; }
		
	public slots:
		virtual void refresh();
		void write();
		
	private:
		QLabel *mapper_label = new QLabel("Memory mapper: ", this);
		QLabel *chips_label = new QLabel("Enabled chips: ", this);
		QLabel *region_label = new QLabel("Cart region: ", this);
		QLabel *name_label = new QLabel("Cart name: ", this);
		QLabel *header_labels[ROM_metadata::HEADER_COUNT];
		QLabel *checksum_labels[ROM_metadata::CHECKSUM_COUNT];
		QLabel *vector_labels[ROM_metadata::VECTOR_COUNT];

		QLabel *current_mapper_label = new QLabel("", this);
		QLabel *current_chips_label = new QLabel("", this);
		QLabel *current_region_label = new QLabel("", this);
		QLineEdit *current_name_line_edit = new QLineEdit("", this);
		QLineEdit *current_header_line_edits[ROM_metadata::HEADER_COUNT];
		QLineEdit *current_checksum_line_edits[ROM_metadata::CHECKSUM_COUNT];
		QLineEdit *current_vector_line_edits[ROM_metadata::VECTOR_COUNT];
		
		QPushButton *reload = new QPushButton("Reload", this);
		QPushButton *apply = new QPushButton("Apply", this);
		QPushButton *cancel = new QPushButton("Cancel", this);
		
		QString calculate_chips();
		unsigned short validate_hex(QString input);
};

#endif // METADATA_EDITOR_DIALOG_H
