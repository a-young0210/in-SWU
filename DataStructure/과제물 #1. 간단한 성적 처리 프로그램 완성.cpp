#include <iostream>
using namespace std;

int main() {

	double sum = 0;
	static const int NumberOfSubject = 1;
	static const int NumberOfStudent = 10;
	double ScoreStudent[NumberOfSubject][NumberOfStudent] = {{ 90, 100, 95, 60, 70, 50, 20, 100, 98, 100 }};

	for (int i = 0; i < NumberOfSubject; i++)
	{
		for (int j = 0; j < NumberOfStudent; j++)
		{
			sum += ScoreStudent[i][j];
		}

		ScoreStudent[i][NumberOfStudent];
		double avr = sum / NumberOfStudent;
		cout.precision(3); 
		cout << avr << endl;
		
	}

	return 0;
}