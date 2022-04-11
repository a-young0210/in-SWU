import java.util.Scanner;

public class Receipt {
	public static void main(String[] args) {

		int product_price;
		int get_money;
		int surtax;
		int change;
		Scanner input = new Scanner(System.in);

		System.out.print("구입한 상품의 가격을 입력하시오: ");
		product_price = input.nextInt();

		System.out.print("받은 금액을 입력하시오: ");
		get_money = input.nextInt();

		
		surtax = product_price * 1/10;
		change = get_money - product_price;

		System.out.printf("받은돈: %d\n", get_money);
		System.out.printf("상품의 총액: %d\n", product_price);
		System.out.printf("부가세: %d\n", surtax);
		System.out.printf("잔돈: %d\n", change);
	}
}