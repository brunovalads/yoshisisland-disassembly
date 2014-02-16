#ifndef ROM_BUFFER_H
#define ROM_BUFFER_H

#include "rom_metadata.h"

#include <QFile>
#include <QFileInfo>
#include <QClipboard>
#include <QApplication>
#include <QMimeData>
#include <QUndoGroup>
#include <QUndoStack>
#include <QRegExp>

class ROM_buffer : public ROM_metadata
{
	public:
		enum copy_style{
			NO_SPACES,
			SPACES,
			HEX_FORMAT,
			ASM_BYTE_TABLE,
			ASM_WORD_TABLE,
			ASM_LONG_TABLE,
			C_SOURCE
		};
		
		enum search_error{
			NOT_FOUND = -1,
			INVALID_FIND = -2,
			INVALID_REPLACE = -3
		};
		
		
		ROM_buffer(QString file_name, bool new_file = false);
		virtual ~ROM_buffer(){}
		void save(QString path);
		void initialize_undo(QUndoGroup *undo_group);
		void cut(int start, int end, bool ascii_mode);
		void copy(int start, int end, bool ascii_mode);
		int paste(int start, int end = 0, bool raw = false);
		void delete_text(int start, int end = 0);
		void update_nibble(char byte, int position, int delete_start = 0, int delete_end = 0);
		virtual void update_byte(char byte, int position, int delete_start = 0, int delete_end = 0);
		QString get_line(int index, int length);
		QString get_formatted_address(int address);
		int count(QString find, bool mode);
		int search(QString find, int position, bool direction, bool mode);
		int replace(QString find, QString replace, int position, bool direction, bool mode);
		int replace_all(QString find, QString replace, bool mode);
		
		inline QString get_file_name(){ QFileInfo info(ROM); return info.fileName();  }
		inline virtual int size(){ return buffer.size() - header_size(); }
		inline virtual char at(int index){ return index == size() ? 0 : buffer.at(index + header_size()); }
		inline QByteArray range(int start, int end){ return buffer.mid(start, end-start); }
		inline bool check_paste_data(){ return clipboard->mimeData()->hasText(); }
		inline void set_active(){ undo_stack->setActive(); }
		inline bool is_active(){ return undo_stack->isActive(); }
		inline QString to_hex(QString input) { return input.remove(QRegExp("[^0-9A-Fa-f]")); }
		inline QString load_error() { return ROM_error; }
		static inline void set_copy_style(copy_style style){ copy_type = style; }
		

	private:
		QFile ROM;
		QByteArray buffer;
		QClipboard *clipboard = QApplication::clipboard();
		QUndoStack *undo_stack;
		static copy_style copy_type;
		QString ROM_error = "";
		
		QByteArray input_to_byte_array(QString input, int mode);
};

#endif // ROM_BUFFER_H
