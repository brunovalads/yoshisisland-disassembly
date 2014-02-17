#include "disassembler.h"
#include "debug.h"

disassembler::disassembler(QWidget *parent) :
        QPlainTextEdit(parent)
{
	connect(this, SIGNAL(A_changed(bool)), set_A, SLOT(setChecked(bool)));
	connect(this, SIGNAL(I_changed(bool)), set_I, SLOT(setChecked(bool)));
	                
	connect(set_A, SIGNAL(toggled(bool)), this, SLOT(toggle_A(bool)));
	connect(set_I, SIGNAL(toggled(bool)), this, SLOT(toggle_I(bool)));
	connect(stop, SIGNAL(toggled(bool)), this, SLOT(toggle_error_stop(bool)));
	
	if(!display){
		hide();
		set_A->hide();
		set_I->hide();
		stop->hide();
	}
	setReadOnly(true);
}

void disassembler::disassemble(QByteArray *data)
{
	QString decoded;
	for(int i = 0; i < data->size();){
		unsigned char hex = (unsigned char)data->at(i);
		opcode op = opcode_list[hex];
		int size = op.size;
		if(op.size > 1){
			size += (A_state && op.A_16) || (I_state && op.I_16);
			int operand = (size > 1 && (i+1) < data->size()) ? (unsigned char)data->at(i+1) : 0;
			operand |= (size > 2 && (i+2) < data->size()) ? ((unsigned char)data->at(i+2) << 8) : 0;
			operand |= (size > 3 && (i+3) < data->size()) ? ((unsigned char)data->at(i+3) << 16) : 0;
			if(i+size > data->size()){
				QString hex = QString::number(operand, 16).rightJustified((i+size-data->size())*2, '0');
				decoded.append(op.name.arg(hex.rightJustified((size-1)*2, 'X')));
			}else{
				decoded.append(op.name.arg(QString::number(operand, 16).rightJustified((size-1)*2, '0')));
			}
			if(hex == 0xC2){
				A_state = (data->at(i+1) & 0x20) ? 1 : 0;
				I_state = (data->at(i+1) & 0x10) ? 1 : 0;			
			}else if(hex == 0xE2){
				A_state = (data->at(i+1) & 0x20) ? 0 : 1;
				I_state = (data->at(i+1) & 0x10) ? 0 : 1;
			}
		}else{
			decoded.append(op.name);
		}
		qDebug() << (error_stop && unlikely.contains(hex));
		if(error_stop && unlikely.contains(hex)){
			decoded.append("Unlikely opcode detected, aborting!");
			break;
		}
		i += size;
	}
	emit A_changed(A_state);
	emit I_changed(I_state);
	setPlainText(decoded);
	show();
}

void disassembler::toggle_display(bool state) { 
	setVisible(state); 
	set_A->setVisible(state);
	set_I->setVisible(state);
	stop->setVisible(state);
	display = state;
	layout_adjust();
}

QGridLayout *disassembler::get_layout(disassembler *self)
{	
	QGridLayout *grid = new QGridLayout();	
	grid->addWidget(self, 0, 0, 1, 2);
	grid->addWidget(self->set_A, 1, 0, 1, 1);
	grid->addWidget(self->set_I, 2, 0, 1, 1);
	grid->addWidget(self->stop, 1, 1, 2, 1);

	return grid;
}

void disassembler::layout_adjust()
{
        QWidget *parent = parentWidget();
        while(parent){
		int height = parent->height();
		parent->setUpdatesEnabled(false);
		parent->adjustSize();
		parent->resize(parent->width(), height);
		parent->setUpdatesEnabled(true);
		parent = parent->parentWidget();
	}
}

bool disassembler::display = false;

const QList<disassembler::opcode> disassembler::opcode_list = {
        {"BRK #$%1\n", 2, false, false},
	{"ORA ($%1,X)\n", 2, false, false},
	{"COP #$%1\n", 2, false, false},
	{"ORA $%1,S\n", 2, false, false},
	{"TSB $%1\n", 2, false, false},
	{"ORA $%1\n", 2, false, false},
	{"ASL $%1\n", 2, false, false},
	{"ORA [$%1]\n", 2, false, false},
	{"PHP\n", 1, false, false},
	{"ORA #$%1\n", 2, true , false},
	{"ASL A\n", 1, false, false},
	{"PHD\n", 1, false, false},
	{"TSB $%1\n", 3, false, false},
	{"ORA $%1\n", 3, false, false},
	{"ASL $%1\n", 3, false, false},
	{"ORA $%1\n", 4, false, false},
	{"BPL $%1\n", 2, false, false},
	{"ORA ($%1),Y\n", 2, false, false},
	{"ORA ($%1)\n", 2, false, false},
	{"ORA ($%1,S),Y\n", 2, false, false},
	{"TRB $%1\n", 2, false, false},
	{"ORA $%1,X\n", 2, false, false},
	{"ASL $%1,X\n", 2, false, false},
	{"ORA [$%1],Y\n", 2, false, false},
	{"CLC\n", 1, false, false},
	{"ORA $%1,Y\n", 3, false, false},
	{"INC A\n", 1, false, false},
	{"TCS\n", 1, false, false},
	{"TRB $%1\n", 3, false, false},
	{"ORA $%1,X\n", 3, false, false},
	{"ASL $%1,X\n", 3, false, false},
	{"ORA $%1,X\n", 4, false, false},
	{"JSR $%1\n", 3, false, false},
	{"AND ($%1,X)\n", 2, false, false},
	{"JSL $%1\n", 4, false, false},
	{"AND $%1,S\n", 2, false, false},
	{"BIT $%1\n", 2, false, false},
	{"AND $%1\n", 2, false, false},
	{"ROL $%1\n", 2, false, false},
	{"AND [$%1]\n", 2, false, false},
	{"PLP\n", 1, false, false},
	{"AND #$%1\n", 2, true , false},
	{"ROL A\n", 1, false, false},
	{"PLD\n", 1, false, false},
	{"BIT $%1\n", 3, false, false},
	{"AND $%1\n", 3, false, false},
	{"ROL $%1\n", 3, false, false},
	{"AND $%1\n", 4, false, false},
	{"BMI $%1\n", 2, false, false},
	{"AND ($%1),Y\n", 2, false, false},
	{"AND ($%1)\n", 2, false, false},
	{"AND ($%1,S),Y\n", 2, false, false},
	{"BIT $%1,X\n", 2, false, false},
	{"AND $%1,X\n", 2, false, false},
	{"ROL $%1,X\n", 2, false, false},
	{"AND [$%1],Y\n", 2, false, false},
	{"SEC\n", 1, false, false},
	{"AND $%1,Y\n", 3, false, false},
	{"DEC A\n", 1, false, false},
	{"TSC\n", 1, false, false},
	{"BIT $%1,X\n", 2, false, false},
	{"AND $%1,X\n", 2, false, false},
	{"ROL $%1,X\n", 2, false, false},
	{"AND $%1,X\n", 4, false, false},
	{"RTI\n", 1, false, false},
	{"EOR ($%1,X)\n", 2, false, false},
	{"WDM $%1\n", 2, false, false},
	{"EOR $%1,S\n", 2, false, false},
	{"MVN $%1\n", 3, false, false},
	{"EOR $%1\n", 2, false, false},
	{"LSR $%1\n", 2, false, false},
	{"EOR [$%1]\n", 2, false, false},
	{"PHA\n", 1, false, false},
	{"EOR #$%1\n", 2, true , false},
	{"LSR A\n", 1, false, false},
	{"PHK\n", 1, false, false},
	{"JMP $%1\n", 3, false, false},
	{"EOR $%1\n", 3, false, false},
	{"LSR $%1\n", 3, false, false},
	{"EOR $%1\n", 4, false, false},
	{"BVC $%1\n", 2, false, false},
	{"EOR ($%1),Y\n", 2, false, false},
	{"EOR ($%1)\n", 2, false, false},
	{"EOR ($%1,S),Y\n", 2, false, false},
	{"MVN $%1\n", 3, false, false},
	{"EOR $%1,X\n", 2, false, false},
	{"LSR $%1,X\n", 2, false, false},
	{"EOR [$%1],Y\n", 2, false, false},
	{"CLI\n", 1, false, false},
	{"EOR $%1,Y\n", 3, false, false},
	{"PHY\n", 1, false, false},
	{"TCD\n", 1, false, false},
	{"JML $%1\n", 4, false, false},
	{"EOR $%1,X\n", 3, false, false},
	{"LSR $%1,X\n", 3, false, false},
	{"EOR $%1,X\n", 4, false, false},
	{"RTS\n", 1, false, false},
	{"ADC ($%1,X)\n", 2, false, false},
	{"PER $%1\n", 3, false, false},
	{"ADC $%1,S\n", 2, false, false},
	{"STZ $%1\n", 2, false, false},
	{"ADC $%1\n", 2, false, false},
	{"ROR $%1\n", 2, false, false},
	{"ADC [$%1]\n", 2, false, false},
	{"PLA\n", 1, false, false},
	{"ADC #$%1\n", 2, true , false},
	{"ROR A\n", 1, false, false},
	{"RTL\n", 1, false, false},
	{"JMP ($%1)\n", 3, false, false},
	{"ADC $%1\n", 3, false, false},
	{"ROR $%1\n", 3, false, false},
	{"ADC $%1\n", 4, false, false},
	{"BVS $%1\n", 2, false, false},
	{"ADC ($%1),Y\n", 2, false, false},
	{"ADC ($%1)\n", 2, false, false},
	{"ADC ($%1,S),Y\n", 2, false, false},
	{"STZ $%1,X\n", 2, false, false},
	{"ADC $%1,X\n", 2, false, false},
	{"ROR $%1,X\n", 2, false, false},
	{"ADC [$%1],Y\n", 2, false, false},
	{"SEI\n", 1, false, false},
	{"ADC $%1,Y\n", 3, false, false},
	{"PLY\n", 1, false, false},
	{"TDC\n", 1, false, false},
	{"JMP ($%1,X)\n", 3, false, false},
	{"ADC $%1,X\n", 3, false, false},
	{"ROR $%1,X\n", 3, false, false},
	{"ADC $%1,X\n", 4, false, false},
	{"BRA $%1\n", 2, false, false},
	{"STA ($%1,X)\n", 2, false, false},
	{"BRL $%1\n", 3, false, false},
	{"STA $%1,S\n", 2, false, false},
	{"STY $%1\n", 2, false, false},
	{"STA $%1\n", 2, false, false},
	{"STX $%1\n", 2, false, false},
	{"STA [$%1]\n", 2, false, false},
	{"DEY\n", 1, false, false},
	{"BIT #$%1\n", 2, true , false},
	{"TXA\n", 1, false, false},
	{"PHB\n", 1, false, false},
	{"STY $%1\n", 3, false, false},
	{"STA $%1\n", 3, false, false},
	{"STX $%1\n", 3, false, false},
	{"STA $%1\n", 4, false, false},
	{"BCC $%1\n", 2, false, false},
	{"STA ($%1),Y\n", 2, false, false},
	{"STA ($%1)\n", 2, false, false},
	{"STA ($%1,S),Y\n", 2, false, false},
	{"STY $%1,X\n", 2, false, false},
	{"STA $%1,X\n", 2, false, false},
	{"STX $%1,Y\n", 2, false, false},
	{"STA [$%1],Y\n", 2, false, false},
	{"TYA\n", 1, false, false},
	{"STA $%1,Y\n", 3, false, false},
	{"TXS\n", 1, false, false},
	{"TXY\n", 1, false, false},
	{"STZ $%1\n", 3, false, false},
	{"STA $%1,X\n", 3, false, false},
	{"STZ $%1,X\n", 3, false, false},
	{"STA $%1,X\n", 4, false, false},
	{"LDY #$%1\n", 2, false, true },
	{"LDA ($%1,X)\n", 2, false, false},
	{"LDX #$%1\n", 2, false, true },
	{"LDA $%1,S\n", 2, false, false},
	{"LDY $%1\n", 2, false, false},
	{"LDA $%1\n", 2, false, false},
	{"LDX $%1\n", 2, false, false},
	{"LDA [$%1]\n", 2, false, false},
	{"TAY\n", 1, false, false},
	{"LDA #$%1\n", 2, true , false},
	{"TAX\n", 1, false, false},
	{"PLB\n", 1, false, false},
	{"LDY $%1\n", 3, false, false},
	{"LDA $%1\n", 3, false, false},
	{"LDX $%1\n", 3, false, false},
	{"LDA $%1\n", 4, false, false},
	{"BCS $%1\n", 2, false, false},
	{"LDA ($%1),Y\n", 2, false, false},
	{"LDA ($%1)\n", 2, false, false},
	{"LDA ($%1,S),Y\n", 2, false, false},
	{"LDY $%1,X\n", 2, false, false},
	{"LDA $%1,X\n", 2, false, false},
	{"LDX $%1,Y\n", 2, false, false},
	{"LDA [$%1],Y\n", 2, false, false},
	{"CLV\n", 1, false, false},
	{"LDA $%1,Y\n", 3, false, false},
	{"TSX\n", 1, false, false},
	{"TYX\n", 1, false, false},
	{"LDY $%1,X\n", 3, false, false},
	{"LDA $%1,X\n", 3, false, false},
	{"LDX $%1,Y\n", 3, false, false},
	{"LDA $%1,X\n", 4, false, false},
	{"CPY #$%1\n", 2, false, true },
	{"CMP ($%1,X)\n", 2, false, false},
	{"REP #$%1\n", 2, false, false},
	{"CMP $%1,S\n", 2, false, false},
	{"CPY $%1\n", 2, false, false},
	{"CMP $%1\n", 2, false, false},
	{"DEC $%1\n", 2, false, false},
	{"CMP [$%1]\n", 2, false, false},
	{"INY\n", 1, false, false},
	{"CMP #$%1\n", 2, true , false},
	{"DEX\n", 1, false, false},
	{"WAI\n", 1, false, false},
	{"CPY $%1\n", 3, false, false},
	{"CMP $%1\n", 3, false, false},
	{"DEC $%1\n", 3, false, false},
	{"CMP $%1\n", 4, false, false},
	{"BNE $%1\n", 2, false, false},
	{"CMP ($%1),Y\n", 2, false, false},
	{"CMP ($%1)\n", 2, false, false},
	{"CMP ($%1,S),Y\n", 2, false, false},
	{"PEI ($%1)\n", 2, false, false},
	{"CMP $%1,X\n", 2, false, false},
	{"DEC $%1,X\n", 2, false, false},
	{"CMP [$%1],Y\n", 2, false, false},
	{"CLD\n", 1, false, false},
	{"CMP $%1,Y\n", 3, false, false},
	{"PHX\n", 1, false, false},
	{"STP\n", 1, false, false},
	{"JMP [$%1]\n", 3, false, false},
	{"CMP $%1,X\n", 3, false, false},
	{"DEC $%1,X\n", 3, false, false},
	{"CMP $%1,X\n", 4, false, false},
	{"CPX #$%1\n", 2, false, true },
	{"SBC ($%1,X)\n", 2, false, false},
	{"SEP #$%1\n", 2, false, false},
	{"SBC $%1,S\n", 2, false, false},
	{"CPX $%1\n", 2, false, false},
	{"SBC $%1\n", 2, false, false},
	{"INC $%1\n", 2, false, false},
	{"SBC [$%1]\n", 2, false, false},
	{"INX\n", 1, false, false},
	{"SBC #$%1\n", 2, true , false},
	{"NOP\n", 1, false, false},
	{"XBA\n", 1, false, false},
	{"CPX $%1\n", 3, false, false},
	{"SBC $%1\n", 3, false, false},
	{"INC $%1\n", 3, false, false},
	{"SBC $%1\n", 4, false, false},
	{"BEQ $%1\n", 2, false, false},
	{"SBC ($%1),Y\n", 2, false, false},
	{"SBC ($%1)\n", 2, false, false},
	{"SBC ($%1,S),Y\n", 2, false, false},
	{"PEA $%1\n", 3, false, false},
	{"SBC $%1,X\n", 2, false, false},
	{"INC $%1,X\n", 2, false, false},
	{"SBC [$%1],Y\n", 2, false, false},
	{"SED\n", 1, false, false},
	{"SBC $%1,Y\n", 3, false, false},
	{"PLX\n", 1, false, false},
	{"XCE\n", 1, false, false},
	{"JSR ($%1,X)\n", 3, false, false},
	{"SBC $%1,X\n", 3, false, false},
	{"INC $%1,X\n", 3, false, false},
	{"SBC $%1,X\n", 4, false, false}
};

const QList<unsigned char> disassembler::unlikely = {
        0x00, 0x02, 0x03, 0x13, 0x23, 0x33, 0x42, 0x43, 0x53, 0x63, 
        0x73, 0x83, 0x93, 0xA3, 0xB3, 0xC3, 0xD3, 0xDB, 0xE3, 0xF3, 0xFF
};
