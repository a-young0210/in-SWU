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

void quick_sort(int O, int R)
{
	/* 이 곳에 알맞은 내용을 추가하시오. partition 기능은 여기에 코드를 직접 넣거나, 별도 함수로 구현 가능 */
	/* 입력 데이타는 L[]에 들어 있으며, 전체 원소 개수는 SIZE이다. */

	if (O >= R) return;
	int pivot = L[(O + R) / 2];
	int left = O;
	int right = R;

	while (left <= right)
	{
		while (L[left] < pivot) left++;
		while (L[right] > pivot) right--;
		if (left <= right)
		{
			swap(L[left], L[right]);
			left++; right--;
		}
	}
	quick_sort(O, right);
	quick_sort(left, R);


}

void main()
{
	cout << "Input Data : ";
	print_data();

	/* sort the elements of array L[] in ascending order */
	quick_sort(0, SIZE - 1);

	cout << "\n\nSorted Data : ";
	print_data();

}
