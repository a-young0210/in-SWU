#include "pch.h"
#include <iostream>
using namespace std;

int main()
{ 
	int n1, n2, n3, temp;
	cout << "3개의 정수를 입력해주세요: " << endl;
	cin >> n1 >> n2 >> n3;

	if (n1 > n2)
	{
		temp = n1;
		n1 = n2;
		n2 = temp;
	}
	
	if (n1 > n3)
	{
		temp = n1;
		n1 = n3;
		n3 = temp;
	}
	
	if (n2 > n3)
	{
		temp = n2;
		n2 = n3;
		n3 = temp;
	}
	

	
	cout << n1 << n2 << n3;

	return 0;

}

