#include <iostream>
#include <algorithm>
using namespace std;

void printArray(const int* list, int size)
{
	for (int i = 0; i < size; i++)
	{
		cout << list[i] << " ";
	}
}
int main()
{
	cout << "=====================================" << endl;
	cout << "<Exercise 11-01>" << endl;

	int size, count = 0;
	double sum = 0, average;
	cout << "Enter array size : " ;
	cin >> size;
	int* list = new int[size];

	for (int i = 0; i < size; i++)
	{
		double num;
		cout << "Enter a number : ";
		cin >> num;
		sum += num;
		list[i] = num;
	}

	average = sum / size;

	cout << "Average = " << average << endl;

for (int i = 0; i < size; i++)
{
	if (list[i] >= average)
		count++;
}

cout << "The number of values greater than the average is " << count << endl;

	cout << "=====================================" << endl;
	cout << "<Exercise 11-02>" << endl;

	int nsize, turn = 0;
	cout << "Enter array size : ";
	cin >> nsize;
	int* nlist = new int[nsize];

	for (int i = 0; i < nsize; i++)
	{
		int num;
		cout << "Enter an integer : ";
		cin >> num;

		int* p = find(nlist, nlist + nsize, num);
		if (p != nlist + nsize)
			continue;
		else
			nlist[turn] = num;
			turn++;
	}

	cout << "Distinct numbers : ";
	printArray(nlist, turn);
}