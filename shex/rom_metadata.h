#ifndef ROM_metadata_H
#define ROM_metadata_H

#include <QObject>
#include <map>
#include <QPair>

class ROM_metadata {
		Q_GADGET
		Q_ENUMS(header_field)
		Q_ENUMS(region)
		Q_ENUMS(memory_mapper)
		Q_ENUMS(DSP1_memory_mapper)
		Q_ENUMS(cart_chips)

	public:
		enum header_field {
			MAPPER = 0x15,
			ROM_TYPE = 0x16,
			ROM_SIZE = 0x17,
			RAM_SIZE = 0x18,
			CART_REGION = 0x19,
			COMPANY = 0x1A,
			VERSION = 0x1B,
			HEADER_COUNT = 7
		};
		
		enum checksums {
			COMPLEMENT = 0x1C,
			CHECKSUM = 0x1E,
			CHECKSUM_COUNT = 2
		};
		
		enum vectors{
			NATIVE_COP = 0x04,
			NATIVE_BRK = 0x06,
			NATIVE_ABORT = 0x08,
			NATIVE_NMI = 0x0A,
			NATIVE_IRQ = 0x0E,
			EMULATION_COP = 0x14,
			EMULATION_ABORT = 0x18,
			EMULATION_NMI = 0x1A,
			EMULATION_RESET = 0x1C,
			EMULATION_IRQ = 0x1E,
			VECTOR_COUNT = 10
		};
		
		enum region{
			NTSC,
			PAL
		};
		
		enum memory_mapper{
			LOROM,
			HIROM,
			EXLOROM,
			EXHIROM,
			SUPERFXROM,
			SA1ROM,
			SPC7110ROM,
			SDD1ROM
		};
		
		enum DSP1_memory_mapper{
			DSP1UNMAPPED,
			DSP1LOROM_1MB,
			DSP1LOROM_2MB,
			DSP1HIROM
		};
		
		enum cart_chips {
			SUPERFX,
			SA1,
			SRTC,
			SDD1,
			SPC7110,
			SPC7110RTC,
			CX4,
			DSP1,
			DSP2,
			DSP3,
			DSP4,
			OBC1,
			ST010,
			ST011,
			ST018,
			NO_CHIPS,
		};
		
		static const QPair <header_field, QString> header_strings[];
		static const QPair <checksums, QString> checksum_strings[];
		static const QPair <vectors, QString> vector_strings[];
		static const QPair <region, QString> region_strings[];
		static const QPair <memory_mapper, QString> mapper_strings[];
		static const QPair <DSP1_memory_mapper, QString> dsp_strings[];
		static const QPair <ROM_metadata::cart_chips, QString> chip_strings[];
		
		virtual ~ROM_metadata(){}
		void analyze();
		int header_size();
		bool has_chip(cart_chips chip);
		region get_cart_region();
		memory_mapper get_mapper();
		DSP1_memory_mapper get_dsp1_mapper();
		unsigned short get_header_field(header_field field, bool word = false);
		unsigned short get_header_field(checksums field);
		unsigned short get_vector(vectors vector);
		QString get_cart_name();
		void update_header_field(header_field field, unsigned short data, bool word = false);
		void update_header_field(checksums field, unsigned short data);
		void update_vector(vectors vector, unsigned short data);
		void update_cart_name(QString name);
		QByteArray to_little_endian(QByteArray bytes);
		int snes_to_pc(int address);
		int pc_to_snes(int address);
		bool validate_address(int address, bool error_method = true);
		int branch_address(int address, QByteArray branch);
		int jump_address(int address, QByteArray jump);
		
		virtual int size() = 0;
		virtual char at(int index) = 0;
		virtual void update_byte(char byte, int position, int delete_start = 0, int delete_end = 0) = 0;
		
		inline QString get_address_error(){ return address_error; }
	private:
		void read_header();
		unsigned int find_header();
		unsigned int score_header(int address);
		void find_chips();
		void find_mapper();
		
		QString address_error;
		
		bool has_header = false;
		bool unknown_ROM = false;

		unsigned int header_index = 0x00;
		unsigned int ram_size = 0x00;
		unsigned char mapper_id = 0x00;
		unsigned char rom_type = 0x00;
		unsigned char rom_size = 0x00;
		
		memory_mapper mapper = LOROM;
		bool chips[NO_CHIPS] = {0};
};
#endif // ROM_metadata_H
