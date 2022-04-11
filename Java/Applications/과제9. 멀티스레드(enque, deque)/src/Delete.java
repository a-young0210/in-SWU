public class Delete extends Thread{
	
	Queue queue;
	
	public Delete(Queue queue) {
		this.queue = queue;
	}
	
	public void run()
	{
		//1초 간격으로 큐에서 항목 100번 삭제
		
		for(int i = 0; i < 100; i++) {
			queue.dequeue();
			System.out.println(i + "를 삭제했습니다.");
			try {
				sleep(1000);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
	}
}
