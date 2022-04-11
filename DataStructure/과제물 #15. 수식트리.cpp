#include <iostream>
using namespace std;

#define element int

class TreeNode {
public :
	element data;
	TreeNode* left, * right;

	TreeNode(element value) {
		data = value;
		left = right = NULL;
	}

};

element evaluate(TreeNode* node) {

	//if (node == NULL) return 0;
	if (node->left == NULL && node->right == NULL) //leaf node, 숫자 노드이면
		return node->data;
	else
	{
		//연산자 노드이면,
		element opr1 = evaluate(node->left);
		element opr2 = evaluate(node->right);
		if (node->data == '+') return opr1 + opr2;
		else if (node->data == '-') return opr1 - opr2;
		else if (node->data == '*') return opr1 * opr2;
		//else if (node->data == 'x') return opr1 * opr2;
		else if (node->data == '/') return opr1 / opr2;
	}
}

void main()
{
	// Expression Tree 구성
	// 노드 7개 생성( 그리기)
	TreeNode* n1 = new TreeNode(3);
	TreeNode* n2 = new TreeNode(2);
	TreeNode* n3 = new TreeNode('*');
	TreeNode* n4 = new TreeNode(5);
	TreeNode* n5 = new TreeNode(6);
	TreeNode* n6 = new TreeNode('+');
	TreeNode* root = new TreeNode('+');

	// 6개 가지, 연결하기
	n3->left = n1;
	n3->right = n2;
	n6->left = n4;
	n6->right = n5;
	root->left = n3;
	root->right = n6;

	cout << "수식트리의 값은 = " << evaluate(root) << endl;
}