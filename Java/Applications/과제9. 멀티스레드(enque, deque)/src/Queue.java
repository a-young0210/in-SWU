public class Queue {
	
	static int MAX_SIZE = 10;

	int front = 0; 
	int rear = 0;
	int data;
	
	int[] queue = new int[MAX_SIZE];
	

	synchronized void enqueue(int data)
	{
		if((rear+1) == front)
			try {
				wait();
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		rear = (rear + 1) % MAX_SIZE;
		queue[rear] = data;
		notifyAll();
	}
	
	synchronized int dequeue()
	{
		if(rear == front)
			try {
				wait();
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		front = (front + 1) % MAX_SIZE;
		data = queue[front];
		notifyAll();
		
		return data;
	}
	
	public void displayQueue() 
	{
		System.out.print("{ ");
		for(int i = 0; i < MAX_SIZE; i++)
		{
			System.out.print(queue[i]+ " ");
		}
		System.out.println("}");
	}

}
