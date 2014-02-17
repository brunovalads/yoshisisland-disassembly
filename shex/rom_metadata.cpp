#include "rom_metadata.h"
#include <QMessageBox>
#include "debug.h"

//Used super-famicom.hpp of nall by byuu as a reference

void ROM_metadata::analyze() 
{
	has_header = false;
	if((size() & 0x7fff) == 512){
		has_header = true;
	}else{
		has_header = false;
	}
	if(size() < 0x8000){
		return;
	}

	for(bool &chip : chips){
	    chip = false;
	}
	read_header();
}

int ROM_metadata::header_size()
{
	return has_header ? 512 : 0;
}

bool ROM_metadata::has_chip(cart_chips chip)
{
	return chips[chip];
}

ROM_metadata::region ROM_metadata::get_cart_region()
{
	return (get_header_field(CART_REGION) < 2 || get_header_field(CART_REGION) >= 13) ? NTSC : PAL;
}

ROM_metadata::memory_mapper ROM_metadata::get_mapper()
{
	return mapper;
}

ROM_metadata::DSP1_memory_mapper ROM_metadata::get_dsp1_mapper()
{
	if(has_chip(DSP1)){
		if((mapper_id & 0x2f) == 0x20 && size() <= 0x100000){
			return DSP1LOROM_1MB;
		}else if((mapper_id & 0x2f) == 0x20){
			return DSP1LOROM_2MB;
		}else if((mapper_id & 0x2f) == 0x21){
			return DSP1HIROM;
		}
	}
	return DSP1UNMAPPED;
}

unsigned short ROM_metadata::get_header_field(header_field field, bool word)
{
	unsigned short entry = at(header_index + field) & 0x00FF;
	if(word){
		entry |= at(header_index + field + 1) << 8;
	}
	return entry;
}

unsigned short ROM_metadata::get_header_field(checksums field)
{
	return get_header_field((header_field)field, true);
}

unsigned short ROM_metadata::get_vector(vectors vector)
{
	return get_header_field((header_field)(0x20 + vector), true);
}

QString ROM_metadata::get_cart_name()
{
	QString name;
	for(int i = 0; i < 21; i++){
		name.append(at(header_index + i));
	}
	return name;
}

void ROM_metadata::update_header_field(header_field field, unsigned short data, bool word)
{
	update_byte(data & 0x00FF, header_index + field);
	if(word){
		update_byte(data >> 8, header_index + field + 1);
	}
}

void ROM_metadata::update_header_field(checksums field, unsigned short data)
{
	update_header_field((header_field)field, data, true);
}

void ROM_metadata::update_vector(vectors vector, unsigned short data)
{
	update_header_field((header_field)(0x20 + vector), data, true);
}

void ROM_metadata::update_cart_name(QString name)
{
	QByteArray n = name.toUtf8();
	for(int i = 0; i < 21; i++){
		update_byte(n[i], header_index+i);
	}
}

QByteArray ROM_metadata::to_little_endian(QByteArray bytes)
{
	int temp = bytes[0];
	bytes[0] = bytes[bytes.size()-1];
	bytes[bytes.size()-1] = temp;
	return bytes;
}

int ROM_metadata::snes_to_pc(int address)
{
	switch(mapper){
		case LOROM:
			if((address&0xF00000) == 0xF00000){
				address -= 0x800000;
			}else if((address&0xF00000) == 0x700000 || !(address&0x408000)){
				return -1;
			}
		return ((address&0x7F0000)>>1|(address&0x7FFF));
		case HIROM:
			if((address&0xFE0000) == 0x7E0000 || !(address&0x408000)){
				return -1;
			}
		return address&0x3FFFFF;
		case EXLOROM:
			return -1;
		break;
		case EXHIROM:
			return -1;
		break;
		case SA1ROM:
		case SPC7110ROM:
			return -1;
		break;
		case SUPERFXROM:
			return -1;
		break;
		case SDD1ROM:
			return -1;
		break;
		default:
		return -1;
	}
}

int ROM_metadata::pc_to_snes(int address)
{
	switch(mapper){
		case LOROM:
			if (address>=0x400000/* || address > size()*/){
				return -1;
			}
			address = ((address<<1)&0x7F0000)|(address&0x7FFF)|0x8000;
			if((address&0xF00000)==0x700000){
				address |= 0x800000;
			}
		return address;
		case HIROM:
			if(address>=0x400000/* || address > size()*/){
				return -1;
			}
		return address|0xC00000;
		case EXLOROM:
			return -1;
		break;
		case EXHIROM:
			return -1;
		break;
		case SA1ROM:
		case SPC7110ROM:
			return -1;
		break;
		case SUPERFXROM:
			return -1;
		break;
		case SDD1ROM:
			return -1;
		break;
		default:
		return -1;
	}
}

bool ROM_metadata::validate_address(int address, bool error_method)
{
	address_error = "";
	QString address_string = QString::number(address, 16).toUpper();
	if(address > 1 << 24){
		address_error = "$" + address_string + " is out of the SNES's bounds!";
	}else if(address < 0){
		address_error = "$" + address_string + " is a negative address!";
	}else if(snes_to_pc(address) > size()){
		address_error = "$" + address_string + " is larger than the ROM's size!";
	}else if(snes_to_pc(address) < 0 || !address){
		address_error = "$" + address_string + " is not a valid "+ mapper_strings[mapper].second +" address!";
	}
	
	if(address_error != "" && error_method){
		QMessageBox::warning(0, "Address error!", address_error);
		qDebug() << address_error;
		return false;
	}else if(address_error != ""){
		qDebug() << address_error;
		return false;
	}
	
	return true;
}

int ROM_metadata::branch_address(int address, QByteArray branch)
{
	address = pc_to_snes(address);
	short word = address & 0xFFFF;
	if(branch.size() == 1){
		char relative_branch = branch[0];
		return (address & 0xFF0000) | ((word + relative_branch) & 0xFFFF);
	}
	short relative_branch = branch[0] & 0x00FF;
	relative_branch |= (branch[1] & 0x00FF) << 8;
	return (address & 0xFF0000) | ((word + relative_branch) & 0xFFFF);
}

int ROM_metadata::jump_address(int address, QByteArray jump)
{
	address = pc_to_snes(address);
	address &= 0xFF0000;
	if(jump.size() == 3){
		address = jump[0] << 16;
	}
	return (address | ((jump[1] & 0xFF)<< 8) | (jump[2] & 0xFF)) & 0xFFFFFF;
}

void ROM_metadata::read_header() 
{
	header_index = find_header();
	if(header_index > (unsigned int)size()){
		header_index = 0x007fC0;
		unknown_ROM = true;
		qDebug() << "UNKNOWN ROM TRIGGERED!";
	}
	mapper_id = get_header_field(MAPPER);
	rom_type = get_header_field(ROM_TYPE);
	rom_size = get_header_field(ROM_SIZE);
	find_chips();
	find_mapper();
	
	if(has_chip(SUPERFX)){
		ram_size = 1024 << (at(header_index - 3) & 7);
	}else{
		ram_size = 1024 << (get_header_field(RAM_SIZE) & 7);
	}
	if(ram_size == 1024){
		ram_size = 0;
	}
}

unsigned ROM_metadata::find_header()
{
	unsigned int score_lo = score_header(0x007fc0);
	unsigned int score_hi = score_header(0x00ffc0);
	unsigned int score_ex = score_header(0x40ffc0);
	
	if(score_lo >= score_hi && score_lo >= score_ex + 4){
		return 0x007fc0;
	}else if(score_hi >= score_ex + 4){
		return 0x00ffc0;
	}else{
		return 0x40ffc0;
	}
}

unsigned ROM_metadata::score_header(int address)
{
	if(size() < address + 64){
		return 0;
	}
	int score = 0;
	header_index = address;
	
	unsigned short reset_vector = get_vector(EMULATION_RESET);
	unsigned short checksum = get_header_field(CHECKSUM);
	unsigned short complement = get_header_field(COMPLEMENT);
	
	unsigned char resetop = at((address & ~0x7fff) | (reset_vector & 0x7fff));
	unsigned char guessed_mapper = get_header_field(MAPPER) & ~0x10;

	if(reset_vector < 0x8000){
		return 0;
	}

	if(resetop == 0x78 || resetop == 0x18 || resetop == 0x38 || 
	   resetop == 0x9c || resetop == 0x4c || resetop == 0x5c){
		score += 8;
	}

	if(resetop == 0xc2 || resetop == 0xe2 || resetop == 0xad || resetop == 0xae || 
	   resetop == 0xac || resetop == 0xaf || resetop == 0xa9 || resetop == 0xa2 || 
	   resetop == 0xa0 || resetop == 0x20 || resetop == 0x22){
		score += 4;
	}

	if(resetop == 0x40 || resetop == 0x60 || resetop == 0x6b || 
	   resetop == 0xcd || resetop == 0xec || resetop == 0xcc)
		score -= 4;
	
	if(resetop == 0x00 || resetop == 0x02  || resetop == 0xdb || 
	   resetop == 0x42 || resetop == 0xff){
		score -= 8;
	}
	
	if((checksum + complement) == 0xffff && (checksum != 0) && (complement != 0)){
		score += 4;
	}
	
	if(address == 0x007fc0 && guessed_mapper == 0x20){
		score += 2;
	}else if(address == 0x00ffc0 && guessed_mapper == 0x21){
		score += 2;
	}else if(address == 0x007fc0 && guessed_mapper == 0x22){
		score += 2;
	}else if(address == 0x40ffc0 && guessed_mapper == 0x25){
		score += 2;
	}
	
	if(get_header_field(COMPANY) == 0x33){
		score += 2;
	}
	if(get_header_field(RAM_SIZE) < 0x08){
		score++;
	}
	if(get_header_field(CART_REGION) < 14){
		score++;
	}
	if(get_header_field(ROM_TYPE) < 0x08){
		score++;
	}else if(get_header_field(ROM_SIZE) < 0x10){
		score++;
	}

	if(score < 0){
		return 0;
	}
	
	return score;
}

void ROM_metadata::find_chips()
{
	if(mapper_id == 0x20 && (rom_type == 0x13 || rom_type == 0x14 || rom_type == 0x15 || rom_type == 0x1a)){
		chips[SUPERFX] = true;
	}
	if(mapper_id == 0x23 && (rom_type == 0x32 || rom_type == 0x34 || rom_type == 0x35)){
		chips[SA1] = true;
	}
	if(mapper_id == 0x35 && rom_type == 0x55){
		chips[SRTC] = true;
	}
	if(mapper_id == 0x32 && (rom_type == 0x43 || rom_type == 0x45)){
		chips[SDD1] = true;
	}
	if(mapper_id == 0x3a && (rom_type == 0xf5 || rom_type == 0xf9)){
		chips[SPC7110] = true;
		chips[SPC7110RTC] = (rom_type == 0xf9);
	}
	if(mapper_id == 0x20 && rom_type == 0xf3){
		chips[CX4] = true;
	}
	if(((mapper_id == 0x20 || mapper_id == 0x21) && rom_type == 0x03) ||
	   (mapper_id == 0x30 && rom_type == 0x05 && get_header_field(COMPANY) != 0xb2) ||
	   (mapper_id == 0x31 && (rom_type == 0x03 || rom_type == 0x05))){
		chips[DSP1] = true;
	}	
	if(mapper_id == 0x20 && rom_type == 0x05){
		chips[DSP2] = true;
	}
	if(mapper_id == 0x30 && rom_type == 0x05 && get_header_field(COMPANY) == 0xb2){
		chips[DSP3] = true;
	}
	if(mapper_id == 0x30 && rom_type == 0x03){
		chips[DSP4] = true;
	}
	if(mapper_id == 0x30 && rom_type == 0x25){
		chips[OBC1] = true;
	}
	if(mapper_id == 0x30 && rom_type == 0xf6 && rom_size >= 10){
		chips[ST010] = true;
	}
	if(mapper_id == 0x30 && rom_type == 0xf6 && rom_size < 10){
		chips[ST011] = true;
	}
	if(mapper_id == 0x30 && rom_type == 0xf5){
		chips[ST018] = true;
	}
}

void ROM_metadata::find_mapper()
{
	if(has_chip(SUPERFX)){
		mapper = SUPERFXROM;
	}else if(has_chip(SA1)){
		mapper = SA1ROM;
	}else if(has_chip(SPC7110)){
		mapper = SPC7110ROM;
	}else if(has_chip((SDD1))){
		mapper = SDD1ROM;
	}else if(header_index == 0x40ffc0){
		mapper = EXHIROM;
	}else if(header_index == 0x7fc0 && (size() >= 0x401000 || mapper_id == 0x32)){
		mapper = EXLOROM;
	}else if(header_index == 0xffc0){
		mapper = HIROM;
	}else{
		mapper = LOROM;
	}
}

const QPair <ROM_metadata::header_field, QString> ROM_metadata::header_strings[] = {
	{ROM_metadata::MAPPER, "Mapper"},
	{ROM_metadata::ROM_TYPE, "ROM type"},
	{ROM_metadata::ROM_SIZE, "ROM size"},
	{ROM_metadata::RAM_SIZE, "RAM size"},
	{ROM_metadata::CART_REGION, "Country"},
	{ROM_metadata::COMPANY, "Company"},
	{ROM_metadata::VERSION, "Version"}
};

const QPair <ROM_metadata::checksums, QString> ROM_metadata::checksum_strings[] = {
        {ROM_metadata::COMPLEMENT, "Checksum Complement"},
	{ROM_metadata::CHECKSUM, "Checksum"}
};

const QPair <ROM_metadata::vectors, QString> ROM_metadata::vector_strings[] = {
        {ROM_metadata::NATIVE_COP, "Native COP"},
	{ROM_metadata::NATIVE_BRK, "Native BRK"},
	{ROM_metadata::NATIVE_ABORT, "Native ABORT"},
	{ROM_metadata::NATIVE_NMI, "Native NMI"},
	{ROM_metadata::NATIVE_IRQ, "Native IRQ"},
	{ROM_metadata::EMULATION_COP, "Emulation COP"},
	{ROM_metadata::EMULATION_ABORT, "Emulation ABORT"},
	{ROM_metadata::EMULATION_NMI, "Emulation NMI"},
	{ROM_metadata::EMULATION_RESET, "Reset"},
	{ROM_metadata::EMULATION_IRQ, "Emulation IRQ"}
};

const QPair <ROM_metadata::region, QString> ROM_metadata::region_strings[] = {
        {ROM_metadata::NTSC, "NTSC"},
	{ROM_metadata::PAL, "PAL"}
};

const QPair <ROM_metadata::memory_mapper, QString> ROM_metadata::mapper_strings[] = {
	{ROM_metadata::LOROM, "LOROM"},
	{ROM_metadata::HIROM, "HIROM"},
	{ROM_metadata::EXLOROM, "ExLOROM"},
	{ROM_metadata::EXHIROM, "ExHIROM"},
	{ROM_metadata::SUPERFXROM, "SuperFX ROM"},
	{ROM_metadata::SA1ROM, "SA1 ROM"},
	{ROM_metadata::SPC7110ROM, "SPC7110 ROM"},
	{ROM_metadata::SDD1ROM, "SDD1 ROM"}
};

const QPair <ROM_metadata::DSP1_memory_mapper, QString> ROM_metadata::dsp_strings[] = {
	{ROM_metadata::DSP1UNMAPPED,"DSP! Unmapped"},
	{ROM_metadata::DSP1LOROM_1MB,"DSP1 2MB HIROM"},
	{ROM_metadata::DSP1LOROM_2MB,"DSP1 1MB LOROM"},
	{ROM_metadata::DSP1HIROM,"DSP1 HIROM"}
};

const QPair <ROM_metadata::cart_chips, QString> ROM_metadata::chip_strings[] = {
	{ROM_metadata::SUPERFX, "SuperFX"},
	{ROM_metadata::SA1, "SA1"},
	{ROM_metadata::SRTC, "SRTC"},
	{ROM_metadata::SDD1, "SDD1"},
	{ROM_metadata::SPC7110, "SPC7110"},
	{ROM_metadata::SPC7110RTC, "SPC7110 RTC"},
	{ROM_metadata::CX4, "CX4"},
	{ROM_metadata::DSP1, "DSP1"},
	{ROM_metadata::DSP2, "DSP2"},
	{ROM_metadata::DSP3, "DSP3"},
	{ROM_metadata::DSP4, "DSP4"},
	{ROM_metadata::OBC1, "OBC1"},
	{ROM_metadata::ST010, "ST-010"},
	{ROM_metadata::ST011, "ST-011"},
        {ROM_metadata::ST018, "ST-018"},
	{ROM_metadata::NO_CHIPS, "No chips"}
        
};
