#include "pch.h"
#include <iostream>
#include <cmath>
using namespace std;

int main()
{
	cout << "Enter the radius of the bounding circle: ";
	double r, a, b, c, d;
	const double PI = 3.14159;
	cin >> r;

	a = (r * cos((PI / 180) * 18));
	b =	(r * sin((PI / 180) * 18));
	c = (r * cos((PI / 180) * 54));
	d = (r * sin((PI / 180) * 54));

	cout << "The coordinates of five points on the pentagon are " << endl
		<< "(0, " << "" << r << ")" << endl
		<< "(" << a << "," << "" << b << ")" << endl
		<< "(" << c << "," << "" << -d << ")" << endl
		<< "(" << -a << "," << "" << b << ")" << endl
		<< "(" << -c << "," << "" << -d << ")" << endl;
		
	return 0;
}

