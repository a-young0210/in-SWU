#include <iostream> 
using namespace std;

int main() {
	cout << "���������������� �մϴ�." << endl;

	string R;
	cout << "�ι̿�>>";
	getline(cin, R);

	string J;
	cout << "�ٸ���>>";
	getline(cin, J);

	if (R == "����") {
		if (J == "����")
			cout << "���" << endl;
		else if (J == "����")
			cout << "�ٸ����� �̱�" << endl;
		else
			cout << "�ι̿��� �̱�" << endl;
	}
	else if (R == "����") {
		if (J == "����")
			cout << "�ι̿��� �̱�" << endl;
		else if (J == "����")
			cout << "���" << endl;
		else
			cout << "�ٸ����� �̱�" << endl;
	}
	else {
		if (J == "����")
			cout << "�ٸ����� �̱�" << endl;
		else if (J == "����")
			cout << "�ι̿��� �̱�" << endl;
		else
			cout << "���" << endl;
	}
	return 0;
}
