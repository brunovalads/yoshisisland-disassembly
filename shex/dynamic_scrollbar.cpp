#include "dynamic_scrollbar.h"
#include "debug.h"

#include <QStyle>
#include <QStyleOptionSlider>

dynamic_scrollbar::dynamic_scrollbar(QWidget *parent) :
        QScrollBar(parent)
{
	setStyle(scroll_style);
	toggle_mode(false);
	connect(this, SIGNAL(sliderReleased()), this, SLOT(reset_slider()));
	connect(this, SIGNAL(sliderPressed()), this, SLOT(send_auto_scroll()));
}

void dynamic_scrollbar::set_range(int value)
{
	setRange(0, value);
	if(mode){
		setValue(height() / 2);
	}
}

void dynamic_scrollbar::toggle_mode(bool m)
{
	mode = m;
	scroll_style->toggle(mode);
	setPageStep(mode ? 0 : original_pagestep);
	if(mode){
		setRange(0, height());
		setValue(height() / 2);
	}
}

void dynamic_scrollbar::reset_slider()
{
	if(mode){
		setValue(height() / 2);
		emit auto_scroll_action(false);
	}
}

void dynamic_scrollbar::send_auto_scroll()
{
	if(mode){
		emit auto_scroll_action(true);
	}
}
