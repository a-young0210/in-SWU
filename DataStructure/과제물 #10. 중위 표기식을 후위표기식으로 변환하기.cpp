#include <iostream>
using namespace std;

#define element char
const int MAX_SIZE = 1000;

class Stack {
public:
	char mystack[MAX_SIZE];
	int top;

	Stack() { top = -1; }

	bool is_stack_empty() {
		return (top == -1);
	}

	bool is_stack_full() {
		return (top == MAX_SIZE - 1);
	}

	void push(char data) {
		if (is_stack_full()) {
			cout << "ERROR : STACK FULL." << endl;
			return; //exit;
		}
		else {
			mystack[++top] = data;
		}
	}

	element pop() {
		if (is_stack_empty()) {
			cout << "ERROR : STACK EMPTY." << endl;
			exit(-1);
		}
		else {
			return mystack[top--];
		}
	}


	void print_stack() {
		cout << "STACK STATUS" << endl;
		for (int i = top; i >= 0; i--)
			cout << mystack[i] << endl;
	}

};

void postfix(char expr[]) {
	Stack MyStack;

	cout << "입력 수식 = " << expr << endl;
	cout << "후위 수식 = ";

//convert to postfix *가정 소괄호만, 사칙연산, 피연산자는 한자리
	for (int i = 0; i < strlen(expr); i++) {
		if (expr[i] == '(') //왼쪽 괄호면 
		{
			continue;
		}
		else if (expr[i] == '+' || expr[i] == '-' || expr[i] == '*' || expr[i] == '/') //연산자면
		{
			MyStack.push(expr[i]);
		}
		else if (expr[i] == ')')//오른쪽 괄호면
		{
			cout << MyStack.pop();
		}
		else if (expr[i] == ' ') 
		{
			continue;
		}
		else  //피연산자면
		{
			cout << expr[i];
		}
	}
	cout << endl << endl;
}

void main() {

	char string[100];
	cout << "수식을 입력하세요 :";
	cin.getline(string, 100);

	postfix(string);

}