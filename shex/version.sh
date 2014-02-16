#!/bin/sh
last_commit=$(git rev-parse HEAD)
commit_count=$(git log --pretty=format:'' | wc -l)
version_number=$((commit_count + 1))
git_branch=$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')
gcc_version=$(gcc --version | head -1)

if (($(git status 2> /dev/null | wc -l) == 8)); then
	if git status 2> /dev/null | grep version\.h > /dev/null; then
		wip_build=""
	else
		wip_build="-WIP"
	fi
elif (($(git status 2> /dev/null | wc -l) != 2)); then
	wip_build="-WIP"
else
	wip_build=""
fi

echo "#include <QMessageBox>
#include <QSysInfo>

void display_version_dialog()
{
	QString OS;
	#if defined(Q_OS_LINUX)
		OS = \"Operating system: Linux\";
	#elif defined(Q_OS_WIN32)
		OS = \"Operating system: Window\";
	#elif defined(Q_OS_MAC)
		OS = \"Operating system: Mac\";
	#else
		OS = \"Operating system: Unknown or unsupported\";
	#endif
	QMessageBox version_info;
	version_info.setText(QString(\"The current version is: v${version_number}${wip_build}\").leftJustified(100));
	version_info.setWindowTitle(\"Version info\");
	version_info.setDetailedText(
				     \"The current build branch is: ${git_branch}\\n\"
				     \"The current commit sha1 is: ${last_commit}\\n\"
				     \"Compiled with: ${gcc_version}\\n\" + OS
				     );
	version_info.setWindowFlags(version_info.windowFlags() ^ Qt::WindowCloseButtonHint);
	version_info.exec();
}" > version.h
