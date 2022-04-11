#include <iostream>
using namespace std;

//스택의 기본 함수 구현, 몇가지 간이 테스트
#define element int
//define MAX_SIZE 100;
const int MAX_SIZE = 100;

element Stack[MAX_SIZE];
int top = -1;	//초기화 sp = -1

bool is_stack_empty() {
	//if (top == -1) return true;
	//else return false;
	return(top == -1);	// ***
}

bool is_stack_full() {
	//if (top == MAX_SIZE - 1) return true;
	//else return false;
	return (top == MAX_SIZE - 1);
}

void push(element data) {
	if (is_stack_full()) {
		cout << "ERROR: Stack Full" << endl;
		return;
	}
	else {
		//top++;
		//Stack[top] = data;
		Stack[++top] = data;
	}
}

element pop() {
	if (is_stack_empty()) {
		cout << "ERROR: Stack Empty" << endl;
		return -1;	//exit();
	}
	else {
		//element x = Stack[top];
		//top--;
		//return x;
		return Stack[top--];	//***
	}
	
}

element peek() {
	if (is_stack_empty()) {
		cout << "ERROR: Stack Empty" << endl;
		return -1;
	}
	else {
		return Stack[top]; //***
	}
}

void print_stack() {
	cout << "STACK STATUS(top = " << top << ")" << endl;

	if (is_stack_empty()) return;
	else {
		for (int i = top; i >= 0; i--)
			cout << Stack[i] << endl;
	}
}

void main() {

	push(10);
	push(20);
	push(30);
	pop();
	print_stack();
	
	push(40);
	push(50);
	pop();
	push(60);

	print_stack();
}