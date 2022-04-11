#include "pch.h"
#include <iostream>
using namespace std;

int main()
{
	int day = 0;
	char answer;

	cout << "Is your birthday in Set1?" << endl;
	cout << " 1  3  5  7\n" <<
		" 9 11 13 15\n" <<
		"17 19 21 23\n" <<
		"25 27 29 31" << endl;
	cout << "Enter N/n for No and Y/y for Yes: ";
	cin >> answer;

	if (answer == 'Y' || answer == 'y')
		day += 1;

	cout << "\nIs your birthday in Set2?" << endl;
	cout << " 2  3  6  7\n" <<
		"10 11 14 15\n" <<
		"18 19 22 23\n" <<
		"26 27 30 31" << endl;
	cout << "Enter N/n for No and Y/y for Yes: ";
	cin >> answer;

	if (answer == 'Y' || answer == 'y')
		day += 2;

	cout << "\nIs your birthday in Set3?" << endl;
	cout << " 4  5  6  7\n" <<
		"12 13 14 15\n" <<
		"20 21 22 23\n" <<
		"28 29 30 31" << endl;
	cout << "Enter N/n for No and Y/y for Yes: ";
	cin >> answer;

	if (answer == 'Y' || answer == 'y')
		day += 4;

	cout << "\nIs your birthday in Set4?" << endl;
	cout << " 8  9  10  11\n" <<
		"12 13 14 15\n" <<
		"24 25 26 27\n" <<
		"28 29 30 31" << endl;
	cout << "Enter N/n for No and Y/y for Yes: ";
	cin >> answer;

	if (answer == 'Y' || answer == 'y')
		day += 8;

	cout << "\nIs your birthday in Set5?" << endl;
	cout << "16 17 18 19\n" <<
		"20 21 22 23\n" <<
		"24 25 26 27\n" <<
		"28 29 30 31" << endl;
	cout << "Enter N/n for No and Y/y for Yes: ";
	cin >> answer;
	
	if (answer == 'Y' || answer == 'y')
		day += 16;

	cout << "Your birthday is" << day << endl;

	return 0;
}

