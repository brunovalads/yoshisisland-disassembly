#include "character_mapper.h"
#include <QFile>
#include <QRegExp>
#include "debug.h"

bool character_mapper::load_map(QString map_file_path)
{
	if(map == nullptr){
		map = new QMap<unsigned char, unsigned char>();
	}else{
		map->clear();
	}
	QFile map_file(map_file_path);
	if(!map_file.open(QIODevice::ReadOnly | QIODevice::Text)){
		return (map_state = false);
	}
	while(!map_file.atEnd()){
		QString line = map_file.readLine().trimmed();
		int seperator = line.remove(QRegExp("//.*")).lastIndexOf('=');
		if(line.isEmpty()){
			continue;
		}
		QString right = line.right(line.length()-seperator-1).trimmed();
		QString left = line.left(seperator).trimmed().leftJustified(1, ' ');
		bool status;
		unsigned char value = right.toInt(&status, 16);	

		if(seperator == -1 || left.length() != 1 || right.length() != 2 || !status){
			return (map_state = false);
		}

		map->insert(left.at(0).toLatin1(), value);
	}
	return (map_state = true);
}

void character_mapper::save_map(QString map_file_path)
{
	if(map == nullptr){
		return;
	}
	QFile map_file(map_file_path);
	if(!map_file.open(QIODevice::WriteOnly | QIODevice::Text)){
		return;
	}
	const QList<unsigned char> keys = map->keys();
	const QList<unsigned char> values = map->values();
	int count = keys.count();
	for(int i = 0; i < count; i++){
		QString line = QString((char)keys[i]) + "=" + QString::number(values[i], 16) + "\n";
		map_file.write(line.toLatin1());
	}
}

void character_mapper::set_map(QMap<unsigned char, unsigned char> *dialog_mapper)
{
	if(map != nullptr && map != dialog_mapper){
		delete map;
	}
	map = dialog_mapper;
	map_state = true;
}

unsigned char character_mapper::decode(unsigned char input)
{
	if(map != nullptr && map->contains(input) && map_state){
		return map->value(input);
	}
	return input;
	
}

QByteArray character_mapper::decode(QByteArray input)
{
	if(map != nullptr && map_state){
		for(int i = input.length() - 1; i > -1; i--){
			unsigned char current = input.at(i);
			input[i] = map->contains(current) ? map->value(current) : current;
		}
	}
	return input;
}

unsigned char character_mapper::encode(unsigned char input)
{
	if(map != nullptr && map->key(input) && map_state){
		return map->key(input);
	}
	return input;
	
}

QByteArray character_mapper::encode(QByteArray input)
{
	if(map != nullptr && map_state){
		for(int i = input.length() - 1; i > -1; i--){
			unsigned char current = input.at(i);
			input[i] = map->key(current) ? map->key(current) : current;
		}
	}
	return input;
}

void character_mapper::delete_active_map()
{
	if(map != nullptr){
		delete map;
	}
}


QMap<unsigned char, unsigned char> *character_mapper::map = nullptr;
bool character_mapper::map_state = false;
