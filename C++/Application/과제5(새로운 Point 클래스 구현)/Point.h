#pragma once
class Point
{
public:
	double x;
	double y;

	Point();
	Point(double x, double y);
	double distance(Point p2);
	Point addNew(Point p2);
	void add(Point p2);
	double dotProduct(Point p2);
	Point midPoint(Point p2);
};
