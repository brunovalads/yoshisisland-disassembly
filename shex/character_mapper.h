#ifndef CHARACTER_MAPPER_H
#define CHARACTER_MAPPER_H
#include <QMap>
class character_mapper
{
	public:
		static bool load_map(QString map_file_path);
		static void save_map(QString map_file_path);
		static void set_map(QMap<unsigned char, unsigned char> *dialog_mapper);
		static QMap<unsigned char, unsigned char> *get_map(){ return map; }
		static unsigned char decode(unsigned char input);
		static QByteArray decode(QByteArray input);
		static unsigned char encode(unsigned char input);
		static QByteArray encode(QByteArray input);
		static void delete_active_map();
	private:
		static QMap<unsigned char, unsigned char> *map;
		static bool map_state;
};

#endif // CHARACTER_MAPPER_H
