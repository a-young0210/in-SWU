#include<iostream>
#define MAX_Q_SIZE 100
using namespace std;

class Queue {
public:

	Queue()
	{
		front = -1;
		rear = -1;
	}

	int front, rear;
	int queue_array[MAX_Q_SIZE];

	bool is_Queue_Empty()
	{
		return front == -1;
	}
	bool is_Queue_Full()
	{
		return front == MAX_Q_SIZE - 1;
	}


	void enQueue(int x)
	{
		if (!is_Queue_Full())
		{
			queue_array[++front] = x;
			if (rear == -1)
				rear = 0;
		}
		else
			cout << "Queue is Full!" << endl;
	}

	void deQueue()
	{
		if (!is_Queue_Empty())
		{
			if (rear == front)
				rear = front = -1;
			else
				rear++;
		}
		else
			cout << "Queue is Empty!" << endl;
	}

	void print_Queue()
	{
		if (!is_Queue_Empty())
		{
			cout << "Queue Array" << endl;
			for (int i = rear; i <= front; i++) {
				cout << queue_array[i] << endl;
			}
		}
		else
			cout << "Queue is Empty!" << endl;
	}
};

int main()
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