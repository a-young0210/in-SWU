#include "pch.h"
#include <iostream>
using namespace std;

int main()
{
	cout << "월 저축액을 입력하세요 : ";
	double savingmoney;
	cin >> savingmoney;

	double first = savingmoney * (1 + 0.00417);
	double second = (savingmoney + first) * (1 + 0.00417);
	double third = (savingmoney + second) * (1 + 0.00417);
	double forth = (savingmoney + third) * (1 + 0.00417);
	double fifth = (savingmoney + forth) * (1 + 0.00417);
	double sixth = (savingmoney + fifth) * (1 + 0.00417);

	cout << "1달 후 금액: " << first << endl
		<< "2달 후 금액: " << second << endl
		<< "3달 후 금액: " << third << endl
		<< "4달 후 금액: " << forth << endl
		<< "5달 후 금액: " << fifth << endl
		<< "6달 후 금액: " << sixth << endl;

	return 0;
    
}

