#include<iostream>
using namespace std;

class Node
{
public:
    int data;
    Node* next;
};

class Queue
{
    Node* front;
    Node* rear;
    Node* prev;
    Node* temp;
    bool is_empty()
    {
        return front == NULL;
    }
public:
    Queue()
    {
        front = NULL;
        rear = NULL;
    }

    void enQueue(int x)
    {
        temp = new Node;
        temp->data = x;
        temp->next = NULL;
        if (is_empty())
        {
            front = temp;
            rear = temp;
        }
        else
        {
            prev = rear;
            rear->next = temp;
            rear = temp;
        }
    }

    void deQueue()
    {
        temp = front;
        front = front->next;
        delete temp;
    }

    void print_Queue()
    {
        if (!is_empty())
        {
            cout << "Queue List" << endl;
            for (temp = front; temp != NULL; temp = temp->next)
                cout << temp->data << endl;
        }
        else
        {
            cout << "Queue is Empty" << endl;
        }
    }
};

void main()
{
    Queue q;
    q.enQueue(10);
    q.enQueue(20);
    q.enQueue(30);
    q.print_Queue();

    q.deQueue();
    q.deQueue();
    q.enQueue(40);
    q.print_Queue();
}