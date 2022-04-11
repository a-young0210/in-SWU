#include "pch.h"
#include <iostream>
#include <iomanip>
using namespace std;

void m(int i) {
	double c = 1;
	double s = 0;
	while (c <= i) {
		s += c / (c + 1);
		cout << fixed << setprecision(0) << c;
		cout << fixed << setw(14) << setprecision(4) << s << endl;

		c++;
	}

}

int main() {
	int i;
	cin >> i;
	cout << "i              m(i)" << endl;
	m(i);
}