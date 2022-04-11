#include <iostream>
using namespace std;

//이중연결리스트 (원형리스트 + 헤드노드)

class DNode {
public:
	int data;
	DNode* llink;
	DNode* rlink;

	DNode() {
		llink = rlink = NULL;
	}

	DNode(int value) {
		data = value;
		llink = rlink = NULL;
	}
};

DNode* Head = NULL;

void insert_node(DNode *new_node)	//리스트 뒤에 새로운 노드 추가
{
	new_node->rlink = Head;
	new_node->llink = Head->llink;
	Head->llink->rlink = new_node;
	Head->llink = new_node;
}

void delete_node(int key)
{
	for (DNode* list = Head->rlink; list != Head; list = list->rlink)
		if (list->data == key) {
			list->llink->rlink = list->rlink;
			list->rlink->llink = list->llink;
			break;
		}
}

void print_list()
{
	cout << "리스트 내용 출력" << endl;
	for (DNode* list = Head->rlink; list != Head; list = list->rlink)
	//for (DNode* list = Head->llink; list != Head; list->llink)

		cout << list->data << endl;
}

void main()
{
	//헤드노드 생성
	Head = new DNode;
	Head->llink = Head;
	Head->rlink = Head;

	int num, data;
	DNode* new_node;

	cout << "입력할 노드의 개수는 ? ";
	cin >> num;

	for (int i = 0; i < num; i++)
	{
		//노드 값 입력
		cin >> data;

		DNode* new_node = new DNode(data);
		//new_node->data = data;
		//new_node->llink = NULL;
		//new_node->rlink = NULL;

		//노드를 리스트에 추가
		insert_node(new_node);

	}

	print_list();

	cout << "삭제할 값은 ?";
	cin >> data;

	delete_node(data);

	print_list();


}