#include "undo_commands.h"
#include "debug.h"

undo_nibble_command::undo_nibble_command(QByteArray *b, int l, unsigned char d[2], bool r)
{
	buffer = b;
	location = l;
	data[0] = d[0];
	data[1] = d[1];
	remove = r;
}

void undo_nibble_command::undo()
{
	if(remove){
		buffer->remove(location, 1);
	}else{
		(*buffer)[location] = data[0];
	}
}

void undo_nibble_command::redo()
{
	if(!run_redo){
		run_redo = true;
		return;
	}
	(*buffer)[location] = data[1];
}

undo_action_command::undo_action_command(QByteArray *b, int l, QByteArray *d)
{
	buffer = b;
	location = l;
	data = d;
}

undo_action_command::~undo_action_command()
{
	delete data;
}

bool undo_action_command::check_run_redo()
{
	if(run_redo){
		return true;
	}
	return !(run_redo = true);
}

void undo_paste_command::undo()
{
	buffer->remove(location, data->length());
}

void undo_paste_command::redo()
{
	if(!check_run_redo()){
		return;
	}
	buffer->insert(location, *data);
}

void undo_delete_command::undo()
{
	buffer->insert(location, *data);
}

void undo_delete_command::redo()
{
	if(!check_run_redo()){
		return;
	}
	buffer->remove(location, data->length());
}
