#include "pch.h"
#include <iostream>
using namespace std;

int main()
{
	double n1, n2, n3;
	cout << "3변의 길이를 입력하시오: ";
	cin >> n1 >> n2 >> n3;

	if (n1 + n2 > n3 && n1 + n3 > n2 && n2 + n3 > n1)
		cout << "삼각형 둘레는 " << n1 + n2 + n3 << endl;

	else
		cout << "삼각형을 구성하지 못합니다!!!" << endl;


	return 0;
}

