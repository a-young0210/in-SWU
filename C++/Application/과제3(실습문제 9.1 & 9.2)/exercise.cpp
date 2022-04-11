#include <iostream>
#include "Fan.h"
#include "Rectangle.h"
using namespace std;

int main()
{
	Rectangle rectangle1(4, 40);
	Rectangle rectangle2(3.5, 35.9);

	cout << "========================================================" << endl;
	cout << "<Exercise 09-01>" << endl;
	cout << "The first rectangle: width = "
		<< rectangle1.getWidth() << ", height = " 
		<< rectangle1.getHeight() << endl;
	cout << "Area = " << rectangle1.getArea() << endl;
	cout << "Perimeter = " << rectangle1.getPerimeter() << endl;
	cout << endl;
	cout << "The second rectangle: width = "
		<< rectangle2.getWidth() << ", height = "
		<< rectangle2.getHeight() << endl;
	cout << "Area = " << rectangle2.getArea() << endl;
	cout << "Perimeter = " << rectangle2.getPerimeter() << endl;
	cout << endl;
	cout << "========================================================="<< endl;

	Fan fan1;
	fan1.setSpeed(3);
	fan1.setRadius(10);
	fan1.setOn(true);
	fan1.setColor("yellow");
	Fan fan2;
	fan2.setSpeed(2);
	fan2.setRadius(5);

	cout << "<Exercise 09-02>" << endl;
	cout << "First fan properties: " << endl;
	cout << "Fan speed: " << fan1.getSpeed() << endl;
	cout << "Fan radius: " << fan1.getRadius() << endl;
	cout << "Fan on? "; fan1.isOn();
	cout << "Fan color: " << fan1.getColor() << endl;
	cout << endl;
	cout << "Second fan properties: " << endl;
	cout << "Fan speed: " << fan2.getSpeed() << endl;
	cout << "Fan radius: " << fan2.getRadius() << endl;
	cout << "Fan on? "; fan2.isOn();
	cout << "Fan color: " << fan2.getColor() << endl;

	return 0;
}