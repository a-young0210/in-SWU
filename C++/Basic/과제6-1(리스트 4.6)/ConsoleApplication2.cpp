#include "pch.h"
#include <iostream>
using namespace std;

int main()
{
	cout << "Enter a hex digit: ";
	char hexDigit;
	cin >> hexDigit;

	hexDigit = toupper(hexDigit);
	if (hexDigit <= 'F' && hexDigit >= 'A')
	{
		int value = 10 + hexDigit - 'A';
		cout << "The decimal vaule for hex digit "
			<< hexDigit << " is " << value << endl;
	}
	else if (isdigit(hexDigit))
	{
		cout << "The decimal value ofr hex digit "
			<< hexDigit << " is " << hexDigit << endl;
	}
	else
	{
		cout << hexDigit << " is and invalid input" << endl;
	}
	
	return 0;
}

