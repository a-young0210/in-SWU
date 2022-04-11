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
	if (Head == NULL) return;	// ������ ���� ����
	else if (Head->data == key)	// ã�� ���(���� ���)�� ù ����� ���
	{
		//delete list; free(list);
		Head = Head->link;
		return;
	}
	else						// ������ ���
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
	cout << "���� ����Ʈ ���� ���" << endl;
	for (Node* ptr = Head; ptr != NULL; ptr = ptr->link)
		cout << ptr->data << endl;

}

void main() {

	int num;

	cout << "�Է��� �������� ������ ? ";
	cin >> num;
	
	for (int i = 0; i < num; i++) {
		// ��� ����
		Node* new_node = new_node = new Node;

		// �Է��� ���� ���� ����
		cin >> new_node->data;
		new_node->link = NULL;

		//���� ���Ḯ��Ʈ�� �߰�
		insert_node_at_rear(new_node);
	}

	print_list();

	cout << "������ ����� ����?";
	int key;
	cin >> key;

	delete_node(key);

	print_list();

}