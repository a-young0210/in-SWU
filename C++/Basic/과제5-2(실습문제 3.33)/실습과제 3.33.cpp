#include "pch.h"
#include <iostream>
using namespace std;

int main()
{
	int y, m, q;
	cout << "Enter year: (e.g., 2012): ";
	cin >> y;
	
	cout << "Enter month: 1-12: ";
	cin >> m;
	
	cout << "Enter the day of the month: 1-31: ";
	cin >> q;

	switch (m)
	{
	case 1: m = 13, y = y - 1; break;
	case 2: m = 14, y = y - 1; break;
	}

	int j = y / 100;
	int k = y % 100;
	int h = (q + 26 * (m + 1) / 10 + k + k / 4 + j / 4 + 5 * j) % 7;

	switch (h)
	{
	case 0: cout << "Day of the week is " << "Saturday" << endl; break;
	case 1: cout << "Day of the week is " << "Sunday" << endl; break;
	case 2: cout << "Day of the week is " << "Monday" << endl; break;
	case 3: cout << "Day of the week is " << "Tuesday" << endl; break;
	case 4: cout << "Day of the week is " << "Wednesday" << endl; break;
	case 5: cout << "Day of the week is " << "Thursday" << endl; break;
	case 6: cout << "Day of the week is " << "Friday" << endl; break;

	}

	return 0;

}


