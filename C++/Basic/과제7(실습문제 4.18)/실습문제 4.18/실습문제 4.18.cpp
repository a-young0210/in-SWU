#include "pch.h"
#include <iostream>
#include <cstdlib>
#include <string>
#include <ctime>
using namespace std;


int main()
{
	srand(time(0));
	char n = static_cast<int>('A') + rand() % ((static_cast<int>('Z') - static_cast<int>('A') + 1));
	char s = static_cast<int>('A') + rand() % ((static_cast<int>('Z') - static_cast<int>('A') + 1));
	char t = static_cast<int>('A') + rand() % ((static_cast<int>('Z') - static_cast<int>('A') + 1));
	
	cout << n << s << t;
	
	return 0;
}

