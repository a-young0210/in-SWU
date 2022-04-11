#include "pch.h"
#include <iostream>
using namespace std;

int main()
{
	const double PI = 3.14159;

	//1단계 : 반지름 읽기
	double radius;
	cout << "반지름을 입력하시오:";
	cin >> radius;

	//2단계 : 면적, 원주 계산
	double area = radius * radius * PI;
	double length = 2 * radius * PI;

	//3단계 : 면적, 원주 출력
	cout << "원의 면적: ";
	cout << area << endl;
	cout << "원의 둘레: ";
	cout << length << endl;

	return 0;
}