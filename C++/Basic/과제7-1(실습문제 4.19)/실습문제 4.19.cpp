#include "pch.h"
#include <iostream>
#include <string>
using namespace std;

int main()
{
	string city1, city2, city3, temp;
	cout << "Enter the first city: ";
	getline(cin, city1);
	cout << "Enter the second city: ";
	getline(cin, city2);
	cout << "Enter the third city: ";
	getline(cin, city3);

	cout << "The cities in alphabetical order are ";
	if (city1 > city2)
	{
		temp = city1;
		city1 = city2;
		city2 = temp;
	}

	if (city1 > city3)
	{
		temp = city1;
		city1 = city3;
		city3 = temp;
	}

	if (city2 > city3)
	{
		temp = city2;
		city2 = city3;
		city3 = temp;
	}

	cout << city1 << " " << city2 << " " << city3;

	return 0;
}