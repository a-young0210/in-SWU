class BankAccountTest
{
	public static void main(String[] args)
	{
		System.out.println("BankAccountTest Ŭ����");
		BankAccount a1 = new BankAccount ();
		BankAccount a2 = new BankAccount ();

		a1.deposit(100);		//a1�� �ܰ� 100���� �Ѵ�.
		a2.deposit(50);		//a2�� �ܰ� 50���� �Ѵ�.
		a1.withdraw(60);		//a1���� 60�� �����Ѵ�.
		a2.withdraw(30);		//a2���� 30�� �����Ѵ�.
		
		System.out.println("a1�� �ܰ�: " + a1.getbalance() );	//a1�� ���� �ܰ� �� ȭ�鿡 ����Ѵ�.
		System.out.println("a2�� �ܰ�: " + a2.getbalance() );	//a2�� ���� �ܰ� �� ȭ�鿡 ����Ѵ�.

	}
}