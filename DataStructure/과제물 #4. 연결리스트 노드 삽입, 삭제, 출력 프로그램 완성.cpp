#include<iostream>
using namespace std;

class Node {
public:
	int data;
	Node* link;
};

Node* Head = NULL;

void insert_node_at_front(Node *new_node)
{
	new_node->link = Head;
	Head = new_node;
}

void insert_node_at_rear(Node* new_node)
{
	if (Head == NULL) {
		Head = new_node;
	}
	else {
		Node* list = Head;

		while (list->link != NULL)
			list = list->link;		
		list->link = new_node;
	}

}
void delete_node(int key) 
{	
	if (Head == NULL) return;	// 삭제할 것이 없음
	else if (Head->data == key)	// 찾는 노드(삭제 노드)가 첫 노드인 경우
	{
		//delete list; free(list);
		Head = Head->link;
		return;
	}
	else						// 나머지 경우
	{		
		Node* list = Head;  

		while (list->link != NULL)
		{
			if (list->link->data == key)
			{
				list->link = list->link->link;
				//delete list; free(list->link);
				return;
			}
			list = list->link;
		}
	}
}

void print_list()
{
	cout << "현재 리스트 저장 결과" << endl;
	for (Node* ptr = Head; ptr != NULL; ptr = ptr->link)
		cout << ptr->data << endl;

}

void main() {

	int num;

	cout << "입력할 데이터의 개수는 ? ";
	cin >> num;
	
	for (int i = 0; i < num; i++) {
		// 노드 생성
		Node* new_node = new_node = new Node;

		// 입력을 받은 값을 저장
		cin >> new_node->data;
		new_node->link = NULL;

		//기존 연결리스트에 추가
		insert_node_at_rear(new_node);
	}

	print_list();

	cout << "삭제할 노드의 값은?";
	int key;
	cin >> key;

	delete_node(key);

	print_list();

}