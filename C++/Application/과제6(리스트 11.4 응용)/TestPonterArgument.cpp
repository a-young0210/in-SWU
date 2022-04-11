#include <iostream>
using namespace std;

void swap1(int n1, int n2)
{
	int temp = n1;
	n1 = n2;
	n2 = temp;
}

void swap2(int&n1, int&n2)
{
	int temp = n1;
	n1 = n2;
	n2 = temp;
}

void swap3c(int*q1, int*q2)
{
	int temp = *q1;
	*q1 = *q2;
	*q2 = temp;
}
void swap3p(int*q1, int*q2)
{
	int *temp = q1;
	q1 = q2;
	q2 = temp;
}

void swap4c(int* &q1, int* &q2)
{
	int temp = *q1;
	*q1 = *q2;
	*q2 = temp;
}

void swap4p(int* &q1, int* &q2)
{
	int *temp = q1;
	q1 = q2;
	q2 = temp;
}



int main()
{
	int num1 = 1;
	int num2 = 2;

	cout << "Before invoking the swap1 function, num1 is "
		<< num1 << " and num2 is " << num2 << endl;

	swap1(num1, num2);

	cout << "After invoking the swap1 function, num1 is " << num1 <<
		" and num2 is " << num2 << endl;

	cout << endl;

	num1 = 1;
	num2 = 2;

	cout << "After invoking the swap2 function, num1 is " << num1 <<
		" and num2 is " << num2 << endl;

	swap2(num1, num2);

	cout << "After invoking the swap2 function, num1 is " << num1 <<
		" and num2 is " << num2 << endl;

	cout << endl;

	num1 = 1;
	num2 = 2;

	int* p1 = &num1;
	int* p2 = &num2;

	cout << "Before invoking the swap3c function, num1 is "
		<< num1 << " and num2 is " << num2 << endl;
	cout << "Before invoking the swap3c function, p1 is "
		<< p1 << " and p2 is " << p2 << endl;

	swap3c(p1, p2);

	cout << "After invoking the swap3c function, num1 is " << num1 <<
		" and num2 is " << num2 << endl;
	cout << "After invoking the swap3c function, p1 is " << p1 <<
		" and p2 is " << p2 << endl;

	cout << endl;

	num1 = 1;
	num2 = 2;

	cout << "Before invoking the swap3p function, num1 is "
		<< num1 << " and num2 is " << num2 << endl;
	cout << "Before invoking the swap3p function, p1 is "
		<< p1 << " and p2 is " << p2 << endl;

	swap3p(p1, p2);

	cout << "After invoking the swap3p function, num1 is " << num1 <<
		" and num2 is " << num2 << endl;
	cout << "After invoking the swap3p function, p1 is " << p1 <<
		" and p2 is " << p2 << endl;

	cout << endl;

	num1 = 1;
	num2 = 2;

	int* p3 = &num1;
	int* p4 = &num2;

	cout << "Before invoking the swap4c function, num1 is "
		<< num1 << " and num2 is " << num2 << endl;
	cout << "Before invoking the swap4c function, p3 is "
		<< p3 << " and p4 is " << p4 << endl;
	cout << "Before invoking the swap4c function, *p3 is "
		<< *p3 << " and *p4 is " << *p4 << endl;

	swap4c(p3, p4);

	cout << "After invoking the swap4c function, num1 is " << num1 <<
		" and num2 is " << num2 << endl;
	cout << "After invoking the swap4c function, p3 is " << p3 <<
		" and p4 is " << p4 << endl;
	cout << "Before invoking the swap4c function, *p3 is "
		<< *p3 << " and *p4 is " << *p4 << endl;
	
	cout << endl;

	num1 = 1;
	num2 = 2;


	cout << "Before invoking the swap4p function, num1 is "
		<< num1 << " and num2 is " << num2 << endl;
	cout << "Before invoking the swap4p function, p3 is "
		<< p3 << " and p4 is " << p4 << endl;
	cout << "Before invoking the swap4p function, *p3 is "
		<< *p3 << " and *p4 is " << *p4 << endl;

	swap4p(p3, p4);

	cout << "After invoking the swap4p function, num1 is " << num1 <<
		" and num2 is " << num2 << endl;
	cout << "After invoking the swap4p function, p3 is " << p3 <<
		" and p4 is " << p4 << endl;
	cout << "Before invoking the swap4p function, *p3 is "
		<< *p3 << " and *p4 is " << *p4 << endl;
}