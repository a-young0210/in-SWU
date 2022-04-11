class BankAccountTest
{
	public static void main(String[] args)
	{
		System.out.println("BankAccountTest 클래스");
		BankAccount a1 = new BankAccount ();
		BankAccount a2 = new BankAccount ();

		a1.deposit(100);		//a1의 잔고를 100으로 한다.
		a2.deposit(50);		//a2의 잔고를 50으로 한다.
		a1.withdraw(60);		//a1에서 60을 인출한다.
		a2.withdraw(30);		//a2에서 30을 인출한다.
		
		System.out.println("a1의 잔고: " + a1.getbalance() );	//a1의 현재 잔고를 얻어서 화면에 출력한다.
		System.out.println("a2의 잔고: " + a2.getbalance() );	//a2의 현재 잔고를 얻어서 화면에 출력한다.

	}
}