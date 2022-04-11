#include "Rectangle.h"

Rectangle::Rectangle()
{
	width = 1;
	height = 1;
}

Rectangle::Rectangle(double nW, double nH)
{
	width = nW;
	height = nH;
}

double Rectangle::getWidth()
{
	return width;
}

double Rectangle::getHeight()
{
	return height;
}

double Rectangle::getArea()
{
	return width * height;
}

double Rectangle::getPerimeter()
{
	return 2 * width + 2 * height;
}

void Rectangle::setWidth(double nW)
{
	width = (nW >= 0) ? nW : 0;
}

void Rectangle::setHeight(double nH)
{
	height = (nH >= 0) ? nH : 0;
}
