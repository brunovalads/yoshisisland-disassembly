#ifndef DYNAMIC_SCROLLBAR_H
#define DYNAMIC_SCROLLBAR_H

#include <QScrollBar>
#include <QProxyStyle>

class scrollbar_style : public QProxyStyle
{
	public:
		virtual int pixelMetric(PixelMetric metric, const QStyleOption *option, const QWidget *widget) const
		{
			if(metric == PM_ScrollBarSliderMin && mode){
				return 100;
			}
			return QCommonStyle::pixelMetric(metric, option, widget);
		}
		void toggle(bool m){ mode = m; }
	private:
		bool mode;
};

class dynamic_scrollbar : public QScrollBar
{
		Q_OBJECT
	public:
		explicit dynamic_scrollbar(QWidget *parent = 0);
		
	signals:
		void auto_scroll_action(bool);
		
	public slots:
		void set_range(int value);
		void toggle_mode(bool m);
		void reset_slider();
		void send_auto_scroll();
		
	private:
		bool mode;
		int original_pagestep = pageStep();
		scrollbar_style *scroll_style = new scrollbar_style();
		
};

#endif // DYNAMIC_SCROLLBAR_H
