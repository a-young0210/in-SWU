#include <iostream>
using namespace std;

//객체 선언 방식 스택의 기본 함수 구현, 몇가지 간이 테스트
#define element int
const int MAX_SIZE = 100;

class Stack {
public:
	element MyStack[MAX_SIZE];
	int top;
	
	Stack() {
		top = -1;
	}

	bool is_stack_empty() {
		return(top == -1);
	}

	bool is_stack_full() {
		return (top == MAX_SIZE - 1);
	}

	void push(element data) {
		if (is_stack_full()) {
			cout << "ERROR: Stack Full" << endl;
			return;
		}
		else {

			MyStack[++top] = data;
		}
	}

	element pop() {
		if (is_stack_empty()) {
			cout << "ERROR: Stack Empty" << endl;
			return -1;
		}
		else {
			return MyStack[top--];	
		}

	}

	element peek() {
		if (is_stack_empty()) {
			cout << "ERROR: Stack Empty" << endl;
			return -1;
		}
		else {
			return MyStack[top]; //***
		}
	}

	void print_stack() {
		cout << "STACK STATUS(top = " << top << ")" << endl;

		if (is_stack_empty()) return;
		else {
			for (int i = top; i >= 0; i--)
				cout << MyStack[i] << endl;
		}
	}
};


void main() {

	Stack MyTT;

	MyTT.push(10);
	MyTT.push(20);
	MyTT.push(30);
	MyTT.pop();
	MyTT.print_stack();
	
	MyTT.push(40);
	MyTT.push(50);
	MyTT.pop();
	MyTT.push(60);

	MyTT.print_stack();
}