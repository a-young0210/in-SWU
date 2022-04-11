#include <iostream>
using namespace std;

//연결리스트를 이용한 스택의 기본 함수 구현, 몇가지 간이 테스트
#define element int

class Node {
public :
	element data;
	Node* link;
};

Node* SP = NULL; //Stack Pointer

bool is_stack_empty() {
	return(SP == NULL);
}

//연결리스트는 full이 될 수 없음

void push(element data) {
	//새로운 노드를 첫 노드로 추가
	Node* new_node = new Node;
	new_node->data = data;
	//new_node->link = NULL;

	new_node->link = SP;
	SP = new_node;
}

element pop() {
	if (is_stack_empty()) {
		cout << "ERROR: Stack Empty" << endl;
		return -1; //exit();
	}
	else {
		element item = SP->data;
		SP = SP->link;
		return item;
	}
}

element peek() {
	if (is_stack_empty()) {
		cout << "ERROR: Stack Empty" << endl;
		return -1; // exit();
	}
	else {
		return SP->data;
	}
}

void print_stack() {
	cout << "STACK STATUS" << endl;
	if (is_stack_empty()) return;
	else {
		for (Node* ptr = SP; ptr != NULL; ptr = ptr->link)
			cout << ptr->data << endl;
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