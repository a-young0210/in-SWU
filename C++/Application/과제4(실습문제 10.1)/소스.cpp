#include<iostream>
#include<string>
#include<algorithm>
using namespace std;

void stringSort(string & s) {
	char temp;

	for (int min = 0; min < s.length(); min++) {
		for (int j = min;j < s.length();j++) {
			if (s[min] > s[j]) {
				temp = s[min];
				s[min] = s[j];
				s[j] = temp;
				
			}
		}
	}
}

bool isAnagram(const string & s1, const string & s2) {
	
	string ss1 = s1;
	string ss2 = s2;

	stringSort(ss1);
	stringSort(ss2);


	if (ss1 == ss2) 
		return true;
	else
		return false;
}

int main() {
	bool isAna;
	string anagram;

	string s1 = "silent";
	string s2 = "listen";

	isAna=isAnagram(s1,s2);


	if (isAna == true)
		anagram = "anagrams";
	else
		anagram = "not anagrams";


	cout << s1 << " and " << s2 << " are " << anagram << endl;


	s1 = "split";
	s2 = "lisp";
	isAna = isAnagram(s1, s2);


	if (isAna == true)
		anagram = "anagrams";
	else
		anagram = "not anagrams";


	cout << s1 << " and " << s2 << " are " << anagram << endl;

	cout << "Enter a string s1 : ";
	cin >> s1;
	cout << "Enter a string s2 : ";
	cin >> s2;
	isAna = isAnagram(s1, s2);


	if (isAna == true)
		anagram = "anagrams";
	else
		anagram = "not anagrams";

	cout << s1 << " and " << s2 << " are " << anagram << endl;

}



