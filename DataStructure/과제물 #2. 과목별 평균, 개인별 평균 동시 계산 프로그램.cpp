#include <iostream>
using namespace std;

int main() {

	double lang_sum = 0;
	double eng_sum = 0;
	double math_sum = 0;
	static const int NumberOfStudent = 10;
	int lang_scores[NumberOfStudent] = { 75, 60, 88, 78, 90, 85, 63, 80, 67, 99 };
	int eng_scores[NumberOfStudent] = { 85, 80, 89, 95, 84, 97, 82, 77, 100, 100 };
	int math_scores[NumberOfStudent] = { 70, 50, 80, 69, 70, 94, 82, 99, 79, 85 };
	
	for (int i = 0; i < NumberOfStudent; i++)
	{
		lang_sum += lang_scores[i];

	}

	double lang_avr = lang_sum / NumberOfStudent;

	for (int i = 0; i < NumberOfStudent; i++)
	{
		eng_sum += eng_scores[i];

	}

	double eng_avr = eng_sum / NumberOfStudent;


	for (int i = 0; i < NumberOfStudent; i++)
	{
		math_sum += math_scores[i];

	}

	double math_avr = math_sum / NumberOfStudent;

	cout << "�л����� ���� ����� " << lang_avr << "�̰�,";
	cout << "�л����� ���� ����� " << eng_avr << "�̰�,";
	cout << "�л����� ���� ����� " << math_avr << "�Դϴ�." << endl;
	cout << "�л� ���κ� ����� " << endl;

	for (int i = 0; i < NumberOfStudent; i++)
	{
		double per_sum = lang_scores[i] + eng_scores[i] + math_scores[i];
		double per_avr = per_sum / 3;

		cout << per_avr << endl;
	}

	cout << "�Դϴ�." << endl;

	return 0;
}