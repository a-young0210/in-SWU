#include <iostream>
using namespace std;

const int SIZE = 15;
int L[SIZE] = { 10, 4, 7, 1, -2, 12, 28, 66, 9, 3, 5, 7, 6, 21, 11 };


void print_data()
{
	for (int i = 0; i < SIZE; i++)
		cout << " " << L[i] << " ";
	cout << endl;
}

void sort()
{
	int i, j, max;
	int temp;

	for (i = (SIZE - 1); i > 0; i--)
	{
		//L[0] ~ L[i] 중 최대값의 인덱스 찾기
		max = 0;
		for (j = 1; j <= i; j++)
			if (L[j] > L[max]) max = j;
		 
		//L[i]와 L[max] 교환
		temp = L[max];
		L[max] = L[i];
		L[i] = temp;
	}




}

void main()
{
	cout << "Input Data : ";
	print_data();

	/* sort the elements of array L[] in ascending order */
	sort();

	cout << "\n\nSorted Data : ";
	print_data();

}
