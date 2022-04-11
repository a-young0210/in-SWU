public class QueueTest{
	public static void main(String args[])
	{
		Queue queue = new Queue();
		Insert Insertthread = new Insert(queue);
		Delete Deletethread = new Delete(queue);
		Insertthread.start();
		Deletethread.start();
	}
}