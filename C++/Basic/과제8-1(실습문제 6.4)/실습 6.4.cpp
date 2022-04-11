#include "pch.h"
#include <iostream>
using namespace std;

void reverse(int number)
{
	int arr[100];
	int i = 0;
	int sum = 0;
	int mul = 1;
	while (number != 0)
	{
		arr[i++] = number % 10;
		number /= 10;
	}
	i--;
	while (i >= 0)
	{
		sum += arr[i--] * mul;
		mul *= 10;
	}
	cout << sum << endl;
}
int main()
{
	int number;
	cout << "정수 입력 : ";
	cin >> number;
	reverse(number);
	return 0;
}