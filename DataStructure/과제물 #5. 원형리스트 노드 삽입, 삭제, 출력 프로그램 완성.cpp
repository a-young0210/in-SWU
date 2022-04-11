#include<iostream>
using namespace std;

class CNode {
public:
	int data;
	CNode* link;
};

CNode* Head = NULL;

void insert_node_at_front(CNode* new_node)
{
	if (Head == NULL) {
		new_node->link = new_node;	//자신을 가리킴
		Head = new_node;
	}
	else {
		new_node->link = Head->link;
		Head->link = new_node;
		//Head = new_node; 필요 없음
	}
}

void insert_node_at_rear(CNode* new_node)
{
	if (Head == NULL) {
		new_node->link = new_node;
		Head = new_node;
	}
	else {
		new_node->link = Head->link;
		Head->link = new_node;
		Head = new_node;	//head는 항상 마지막 노드를 가리킴
	}

}
void delete_node(int key)
{
	if (Head == NULL) return;	//빈 리스트
	else if (Head->link == Head && Head->data == key) Head = NULL;
	else	//일반적인 경우,
	{
		CNode* pre = Head;
		do
		{
			if (pre->link->data == key) {
				CNode* removed = pre->link;
				pre->link = removed->link;		//pre->link = pre->link->link;
				if (Head == removed) Head = pre;	//해드포인터 유지
				return;
			}
			pre = pre->link;
		} while (pre != Head);
	}
}

void print_list()	//전체 목록 출력
{
	cout << "원형연결리스트 저장 결과" << endl;

	if (Head == NULL) return;
	else
	{
		CNode* ptr = Head;

		do
		{
			cout << ptr->link->data << endl;
			ptr = ptr->link;
		} while (ptr != Head);
	}
}

void main() {

	int num;
	cout << "입력 개수는 ? ";
	cin >> num;

	for (int i = 0; i < num; i++) {
		// 입력값을 받아 연결리스트에 추가

		CNode* new_node = new_node = new CNode;
		int data;

		cin >> data;
		new_node->data = data;
		new_node->link = NULL;


		insert_node_at_rear(new_node);	//노드 추가
	}

	print_list();

	int del_data;

	cout << "삭제할 값은";
	cin >> del_data;

	delete_node(del_data);

	print_list();

}