public class BankAccount
{
	public static void main(String[] args)
	{
		System.out.println("BankAccount Ŭ����");
	}

	double balance;

	public void deposit(double amount)
	{
		balance += amount;
		System.out.println(amount + "���� ���ݵǾ����ϴ�.");
	}

	void withdraw(double amount)
	{
		if(balance <= 0)
			System.out.println("�ܰ� �����ϴ�. ���� ����!");			//5��, ���� �ܰ� �����̸� ���� ���� �Ұ�
		
		else if(balance < amount)
			System.out.println("�ܾ��� ���ڶ��ϴ�. ���� ����!");		// ������ �����Ϸ��� �ݾ׺��� �۾Ƶ� �Ұ�

		else
		{
			balance -= amount;
			System.out.println(amount + "���� ����Ǿ����ϴ�.");
		}

	}

	
	double getbalance()
	{
		return balance;
	}
	
	void printBalance()
	{
		System.out.println("���� �ܾ�: " + getbalance() );		//3��, ���� �ܾ��� ���
	}

	double addInterest()
	{
		double interest = balance * 0.075;				//4��, ���� �ܾ׿� ���� �� 7.5%�� ���ڸ� ����Ͽ� �߰�
		return interest;
	}
}