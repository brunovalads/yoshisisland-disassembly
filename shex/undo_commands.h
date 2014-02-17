#ifndef UNDO_COMMANDS_H
#define UNDO_COMMANDS_H

#include <QByteArray>
#include <QUndoCommand>

class undo_nibble_command : public QUndoCommand
{
	public:
		undo_nibble_command(QByteArray *b, int l, unsigned char d[2], bool r);
		void undo();
		void redo();
		
	private:
		QByteArray *buffer;
		int location;
		unsigned char data[2];
		bool run_redo = false;
		bool remove;
};

typedef undo_nibble_command undo_byte_command;

class undo_action_command : public QUndoCommand
{
	public:
		undo_action_command(QByteArray *b, int l, QByteArray *d);
		~undo_action_command();
		
	protected:
		QByteArray *buffer;
		int location;
		QByteArray *data;
		bool check_run_redo();
	
	private:
		bool run_redo = false;
};

class undo_paste_command : public undo_action_command
{
	public:
		using undo_action_command::undo_action_command;
		void undo();
		void redo();
};

class undo_delete_command : public undo_action_command
{
	public:
		using undo_action_command::undo_action_command;
		void undo();
		void redo();
	private:
		int end;
};

#endif // UNDO_COMMANDS_H
