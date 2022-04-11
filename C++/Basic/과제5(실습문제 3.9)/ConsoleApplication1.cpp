#include "pch.h"
#include <iostream>
using namespace std;

int main()
{
	int month, year;
	cout << "연도를 입력하시오: ";
	cin >> year;
	cout << "달을 입력하시오 (예를들어, 1월은 1, 2월은 2, 등등): ";
	cin >> month;
	
	bool isLeapYear =
		(year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);

	switch (month)
{
	case 1: cout << year << "년 " << month << "월은 31일이다." << endl; break;
	case 2: if (isLeapYear && month == 2)
		      cout << year << "년 " << month << "월은 29일이다." << endl;
			else
		      cout << year << "년 " << month << "월은 28일이다." << endl; break;
	case 3: cout << year << "년 " << month << "월은 31일이다." << endl; break;
	case 4: cout << year << "년 " << month << "월은 30일이다." << endl; break;
	case 5: cout << year << "년 " << month << "월은 31일이다." << endl; break;
	case 6: cout << year << "년 " << month << "월은 30일이다." << endl; break;
	case 7: cout << year << "년 " << month << "월은 31일이다." << endl; break;
	case 8: cout << year << "년 " << month << "월은 31일이다." << endl; break;
	case 9: cout << year << "년 " << month << "월은 30일이다." << endl; break;
	case 10: cout << year << "년 " << month << "월은 31일이다." << endl; break;
	case 11: cout << year << "년 " << month << "월은 30일이다." << endl; break;
	case 12: cout << year << "년 " << month << "월은 31일이다." << endl; break;
}
	
	return 0;
}

