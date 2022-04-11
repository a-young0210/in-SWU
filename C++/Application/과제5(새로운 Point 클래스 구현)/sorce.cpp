#include <iostream>
#include "Point.h"
using namespace std;

int main()
{
	Point p1(1, 1);
	Point p2(3, 3);
	cout << "p1 : x = " << p1.x << " , y =" << p1.y << endl;
	cout << "p2 : x = " << p2.x << " , y =" << p2.y << endl;
	cout << "Distance = " << p1.distance(p2) << endl;
	Point p3 = p1.addNew(p2);
	p1.add(p2);
	cout << "Add&New : x = " << p1.x << " , y = " << p1.y << endl;
	cout << "Add : x = " << p3.x << " , y = " << p3.y << endl;
	Point p4 = p1.midPoint(p2);
	cout << "Dot product = " << p1.dotProduct(p2) << endl;
	cout << "Midpoint: x = " << p4.x << ", y = " << p4.y << endl;
}