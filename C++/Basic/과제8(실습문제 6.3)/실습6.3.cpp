#include "pch.h"
#include <iostream>
using namespace std;

int reverse(int number)
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
	return sum;
}
bool isPalindrome(int number)
{
	if (number == reverse(number))
	{
		cout << "is a palindrome" << endl;
		return  true;
	}
	else
	{
		cout << "is not a palindrome" << endl;
		return  false;
	}
}
int main()
{
	int number;
	cout << "정수 입력 : ";
	cin >> number;
	isPalindrome(number);
	return 0;
}