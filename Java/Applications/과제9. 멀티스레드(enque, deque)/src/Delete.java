public class Delete extends Thread{
	
	Queue queue;
	
	public Delete(Queue queue) {
		this.queue = queue;
	}
	
	public void run()
	{
		//1�� �������� ť���� �׸� 100�� ����
		
		for(int i = 0; i < 100; i++) {
			queue.dequeue();
			System.out.println(i + "�� �����߽��ϴ�.");
			try {
				sleep(1000);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
	}
}
