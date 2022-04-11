#include "Point.h"
#include <cmath>

Point::Point()
{
	x = 0;
	y = 0;
}
Point::Point(double x2, double y2)
{
	x = x2;
	y = y2;
}
double Point::distance(Point p2)
{
	return pow(pow(p2.x - x, 2) + pow(p2.y - y, 2), 0.5);
}
Point Point:: addNew(Point p2)
{
	Point p3(x + p2.x, y + p2.y);

	return p3;
}
void Point::add(Point p2)
{
	x += p2.x;
	y += p2.y;

}
double Point::dotProduct(Point p2)
{
	x = (x * p2.x);
	y = (y * p2.y);

	double dotpoint = x + y;

	return dotpoint;
}
Point Point::midPoint(Point p2)
{
	Point midpoint(((x + p2.x) / 2), ((y + p2.y) / 2));

	return midpoint;
}