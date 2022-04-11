#include<iostream>
using namespace std;

//¿øÇü Å¥
const int MAX_SIZE = 6;
#define element int

element CQueue[MAX_SIZE];
int front = 0;
int rear = 0;

bool is_queue_empty() {
    return (front == rear);
}

bool is_queue_full() {
    return (front == (rear + 1) % MAX_SIZE);
}

void enQueue(char data) {
    if (is_queue_full()) {
        cout << "ERRPR : QUEUE FULL." << endl;
        return; //exit;
    }
    else {
        //Queue[++rear] = data;
        rear = (rear + 1) % MAX_SIZE; //*****
        CQueue[rear] = data;
    }
}

char deQueue() {
    if (is_queue_empty()) {
        cout << "ERROR : QUEUE EMPTY." << endl;
        exit(-1);
    }
    else {
        //return Queue[++fornt];
        front = (front + 1) % MAX_SIZE;
        return CQueue[front];
    }
}

void printQueue() {
    if (front <= rear) {
        for (int i = front + 1; i <= rear; i++)
            cout << CQueue[i] << " ";
    }
    else {
        for (int i = front + 1; i < MAX_SIZE; i++)
            cout << CQueue[i] << " ";

        for (int i = 0; i <= rear; i++)
            cout << CQueue[i] << " ";
    }
    cout << endl;
}

void main()
{
    enQueue(10);
    enQueue(20);
    enQueue(30);
    enQueue(40);
    enQueue(50);
    deQueue();
    deQueue();

    enQueue(60);
    enQueue(70);

    printQueue();

    deQueue();
    deQueue();
    printQueue();
}