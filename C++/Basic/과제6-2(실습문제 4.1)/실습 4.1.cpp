#include "pch.h"
#include <iostream>
#include <cmath>
using namespace std;

int main()
{
	cout << "Enter the length from the center to a vertex: ";
	double r, s, a, b;
	const double PI = 3.14159;
	cin >> r;

	b = (PI / 180) * 36;
	s = 2 * (r * sin(b));
	
	a = (5 * (s * s)) / (4 * tan(PI / 5));

	cout << "The area of the pentagon is " << a << endl;

	return 0;
   
}


