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
		new_node->link = new_node;	//�ڽ��� ����Ŵ
		Head = new_node;
	}
	else {
		new_node->link = Head->link;
		Head->link = new_node;
		//Head = new_node; �ʿ� ����
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
		Head = new_node;	//head�� �׻� ������ ��带 ����Ŵ
	}

}
void delete_node(int key)
{
	if (Head == NULL) return;	//�� ����Ʈ
	else if (Head->link == Head && Head->data == key) Head = NULL;
	else	//�Ϲ����� ���,
	{
		CNode* pre = Head;
		do
		{
			if (pre->link->data == key) {
				CNode* removed = pre->link;
				pre->link = removed->link;		//pre->link = pre->link->link;
				if (Head == removed) Head = pre;	//�ص������� ����
				return;
			}
			pre = pre->link;
		} while (pre != Head);
	}
}

void print_list()	//��ü ��� ���
{
	cout << "�������Ḯ��Ʈ ���� ���" << endl;

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
	cout << "�Է� ������ ? ";
	cin >> num;

	for (int i = 0; i < num; i++) {
		// �Է°��� �޾� ���Ḯ��Ʈ�� �߰�

		CNode* new_node = new_node = new CNode;
		int data;

		cin >> data;
		new_node->data = data;
		new_node->link = NULL;


		insert_node_at_rear(new_node);	//��� �߰�
	}

	print_list();

	int del_data;

	cout << "������ ����";
	cin >> del_data;

	delete_node(del_data);

	print_list();

}