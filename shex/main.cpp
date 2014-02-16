#include <QApplication>
#include <QtDebug>
#include "main_window.h"
#include "debug.h"

#include <QFile>
#include <QTextStream>

void message_handler(QtMsgType type, const char *message)
{
	QString text;
	switch (type){
		case QtDebugMsg:
			text = QString("Debug: %1").arg(message);
		break;
		case QtWarningMsg:
			text = QString("Warning: %1").arg(message);
		break;
		case QtCriticalMsg:
			text = QString("Critical: %1").arg(message);
		break;
		case QtFatalMsg:
			text = QString("Fatal: %1").arg(message);
		break;
		default:
			text = QString("Unknown message type: %1").arg(message);
		break;
	}
	QFile log("debug.log");
	log.open(QIODevice::WriteOnly | QIODevice::Append);
	QTextStream log_stream(&log);
	log_stream << text << endl;
}

int main(int argc, char *argv[])
{
	QApplication a(argc, argv);
#ifdef LOG_TO_FILE
	qInstallMsgHandler(message_handler);
#endif
	main_window window;
	window.show();
	
	return a.exec();
}
