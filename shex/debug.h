#ifndef DEBUG_OPTIONS_H
#define DEBUG_OPTIONS_H

#if 1
	#include <QDebug>
#endif

#if 0
	#define LOG_TO_FILE
#endif

#if 1
	#define USE_DEFAULT_ROM
#endif

#if 1
#include <QMetaEnum>
#define ENUM_STRING(ENUM, VALUE) \
	staticMetaObject.enumerator(staticMetaObject.indexOfEnumerator(#ENUM)).valueToKey(VALUE)
#define ENUM_COUNT(ENUM) \
	staticMetaObject.enumerator(staticMetaObject.indexOfEnumerator(#ENUM)).keyCount()
#endif

#endif // DEBUG_OPTIONS_H
