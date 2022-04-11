#include <iostream>
using namespace std;

int main() {

	double sum = 0;
	int Stundent_lang[3][3][10] = { { { 75, 60, 88, 78, 90, 85, 63, 80, 67, 99 }, { 75, 60, 88, 78, 90, 85, 63, 80, 67, 99 },{ 75, 60, 88, 78, 90, 85, 63, 80, 67, 99 }},
		{{ 85, 80, 89, 95, 84, 97, 82, 77, 100, 100 },{ 85, 80, 89, 95, 84, 97, 82, 77, 100, 100 },{ 85, 80, 89, 95, 84, 97, 82, 77, 100, 100 }},
		{{ 70, 50, 80, 69, 70, 94, 82, 99, 79, 85 },{ 70, 50, 80, 69, 70, 94, 82, 99, 79, 85 },{ 70, 50, 80, 69, 70, 94, 82, 99, 79, 85 } } };
	int Stundent_math[3][3][10] = { { { 75, 67, 88, 88, 90, 85, 43, 80, 97, 100 }, { 75, 67, 88, 88, 90, 85, 43, 80, 97, 100 },{ 75, 67, 88, 88, 90, 85, 43, 80, 97, 100 }},
		{{ 85, 82, 89, 95, 87, 67, 82, 77, 35, 100 },{ 85, 82, 89, 95, 87, 67, 82, 77, 35, 100 },{  85, 82, 89, 95, 87, 67, 82, 77, 35, 100 }},
		{{ 71, 52, 49, 69, 70, 84, 82, 99, 89, 88 },{ 71, 52, 49, 69, 70, 84, 82, 99, 89, 88 },{ 71, 52, 49, 69, 70, 84, 82, 99, 89, 88 } } };
	int Stundent_eng[3][3][10] = { { { 72, 60, 66, 75, 90, 85, 73, 80, 64, 99 }, { 72, 60, 66, 75, 90, 85, 73, 80, 64, 99 },{ 72, 60, 66, 75, 90, 85, 73, 80, 64, 99 }},
		{{ 69, 80, 98, 95, 54, 97, 69, 77, 77, 100 },{ 69, 80, 98, 95, 54, 97, 69, 77, 77, 100 },{ 69, 80, 98, 95, 54, 97, 69, 77, 77, 100 }},
		{{ 70, 52, 86, 69, 92, 94, 82, 69, 79, 83 },{ 70, 52, 86, 69, 92, 94, 82, 69, 79, 83 },{ 70, 52, 86, 69, 92, 94, 82, 69, 79, 83 } } };

//반별 국어 평균

	for (int i = 0; i< 3; i++)
	{
		for (int j= 0;j < 3; j++)
		{
			for (int k = 0;k < 10; k++)
			{
				Stundent_lang[i][j][k];
				sum += Stundent_lang[i][j][k];
			}
			double avr = sum / 10;
			cout << i + 1 << "학년 " << j + 1 << "반의 국어 평균은 " << avr << endl;
			sum = 0;
		}
		cout << endl;

	}

//반별 수학 평균

	for (int i = 0; i < 3; i++)
	{
		for (int j = 0;j < 3; j++)
		{
			for (int k = 0;k < 10; k++)
			{
				Stundent_math[i][j][k];
				sum += Stundent_math[i][j][k];
			}
			double avr = sum / 10;
			cout << i + 1 << "학년 " << j + 1 << "반의 수학 평균은 " << avr << endl;
			sum = 0;
		}
		cout << endl;

	}
	
//반별 영어 평균

	for (int i = 0; i < 3; i++)
	{
		for (int j = 0;j < 3; j++)
		{
			for (int k = 0;k < 10; k++)
			{
				Stundent_eng[i][j][k];
				sum += Stundent_eng[i][j][k];
			}
			double avr = sum / 10;
			cout << i + 1 << "학년 " << j + 1 << "반의 영어 평균은 " << avr << endl;
			sum = 0;
		}
		cout << endl;

	}



//학년별 국어 평균

	for (int i = 0; i < 3; i++)
	{
		for (int j = 0;j < 3; j++)
		{
			for (int k = 0;k < 10; k++)
			{
				Stundent_lang[i][j][k];
				sum += Stundent_lang[i][j][k];
			}
		}
		double avr = sum / 30;
		cout << i + 1 << "학년의 국어 평균은 " << avr << endl;
		sum = 0;
		cout << endl;

	}

//학년별 수학 평균

	for (int i = 0; i < 3; i++)
	{
		for (int j = 0;j < 3; j++)
		{
			for (int k = 0;k < 10; k++)
			{
				Stundent_math[i][j][k];
				sum += Stundent_math[i][j][k];
			}
		}
		double avr = sum / 30;
		cout << i + 1 << "학년의 수학 평균은 " << avr << endl;
		sum = 0;
		cout << endl;

	}

//학년별 영어 평균

	for (int i = 0; i < 3; i++)
	{
		for (int j = 0;j < 3; j++)
		{
			for (int k = 0;k < 10; k++)
			{
				Stundent_eng[i][j][k];
				sum += Stundent_eng[i][j][k];
			}
		}
		double avr = sum / 30;
		cout << i + 1 << "학년의 영어 평균은 " << avr << endl;
		sum = 0;
		cout << endl;

	}
return 0;
}