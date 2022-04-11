#include <iostream> 
using namespace std;

int main() {
	cout << "가위바위보게임을 합니다." << endl;

	string R;
	cout << "로미오>>";
	getline(cin, R);

	string J;
	cout << "줄리엣>>";
	getline(cin, J);

	if (R == "가위") {
		if (J == "가위")
			cout << "비김" << endl;
		else if (J == "바위")
			cout << "줄리엣이 이김" << endl;
		else
			cout << "로미오가 이김" << endl;
	}
	else if (R == "바위") {
		if (J == "가위")
			cout << "로미오가 이김" << endl;
		else if (J == "바위")
			cout << "비김" << endl;
		else
			cout << "줄리엣이 이김" << endl;
	}
	else {
		if (J == "가위")
			cout << "줄리엣이 이김" << endl;
		else if (J == "바위")
			cout << "로미오가 이김" << endl;
		else
			cout << "비김" << endl;
	}
	return 0;
}
