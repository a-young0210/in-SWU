public class BankAccount
{
	public static void main(String[] args)
	{
		System.out.println("BankAccount 클래스");
	}

	double balance;

	public void deposit(double amount)
	{
		balance += amount;
		System.out.println(amount + "원이 예금되었습니다.");
	}

	void withdraw(double amount)
	{
		if(balance <= 0)
			System.out.println("잔고가 없습니다. 인출 실패!");			//5번, 현재 잔고가 음수이면 예금 인출 불가
		
		else if(balance < amount)
			System.out.println("잔액이 모자랍니다. 인출 실패!");		// 예금이 인출하려는 금액보다 작아도 불가

		else
		{
			balance -= amount;
			System.out.println(amount + "원이 인출되었습니다.");
		}

	}

	
	double getbalance()
	{
		return balance;
	}
	
	void printBalance()
	{
		System.out.println("현재 잔액: " + getbalance() );		//3번, 현재 잔액을 출력
	}

	double addInterest()
	{
		double interest = balance * 0.075;				//4번, 현재 잔액에 대한 연 7.5%의 이자를 계산하여 추가
		return interest;
	}
}