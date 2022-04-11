public class Insert extends Thread {
	
	Queue queue;
	
	public Insert(Queue queue) {
		this.queue = queue;
	}
	
	public void run()
	{
		//1초 간격으로 임의의 정수갑을 큐에 삽입
		for(int i = 0; i < 100; i++) {	
			queue.enqueue(i);
			System.out.println(i + "를 삽입했습니다.");
			try {
				sleep(1000);
				queue.displayQueue();
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
	}

}
