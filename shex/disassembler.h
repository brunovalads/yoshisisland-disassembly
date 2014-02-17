#ifndef DISASSEMBLER_H
#define DISASSEMBLER_H

#include <QPlainTextEdit>
#include <QList>
#include <QLayout>
#include <QCheckBox>
#include "debug.h"

class disassembler : public QPlainTextEdit
{
		Q_OBJECT
	public:
		struct opcode{
			QString name;
			int size;
			bool A_16;
			bool I_16;
		};

		explicit disassembler(QWidget *parent = 0);
		static QGridLayout *get_layout(disassembler *self);
	
	signals:
		void A_changed(bool);
		void I_changed(bool);
		
	public slots:
		void disassemble(QByteArray *data);
		void toggle_display(bool state);
		inline void toggle_A(bool state){ A_state = state; }
		inline void toggle_I(bool state){ I_state = state; }
		inline void toggle_error_stop(bool state){ error_stop = state; }
		
	private:
		bool A_state = false;
		bool I_state = false;
		bool error_stop = false;
		QCheckBox *set_A = new QCheckBox("16 bit A", this);
		QCheckBox *set_I = new QCheckBox("16 bit I", this);
		QCheckBox *stop = new QCheckBox("Stop on unlikely", this);
		static const QList<opcode> opcode_list;
		static const QList<unsigned char> unlikely;
		static bool display;
		void layout_adjust();
		
		
};

#endif // DISASSEMBLER_H
