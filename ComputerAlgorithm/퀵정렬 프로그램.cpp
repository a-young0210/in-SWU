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
	/* �� ���� �˸��� ������ �߰��Ͻÿ�. partition ����� ���⿡ �ڵ带 ���� �ְų�, ���� �Լ��� ���� ���� */
	/* �Է� ����Ÿ�� L[]�� ��� ������, ��ü ���� ������ SIZE�̴�. */

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
