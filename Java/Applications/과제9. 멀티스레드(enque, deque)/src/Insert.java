public class Insert extends Thread {
	
	Queue queue;
	
	public Insert(Queue queue) {
		this.queue = queue;
	}
	
	public void run()
	{
		//1�� �������� ������ �������� ť�� ����
		for(int i = 0; i < 100; i++) {	
			queue.enqueue(i);
			System.out.println(i + "�� �����߽��ϴ�.");
			try {
				sleep(1000);
				queue.displayQueue();
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
	}

}
