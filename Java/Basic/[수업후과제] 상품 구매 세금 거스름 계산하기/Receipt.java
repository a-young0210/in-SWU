import java.util.Scanner;

public class Receipt {
	public static void main(String[] args) {

		int product_price;
		int get_money;
		int surtax;
		int change;
		Scanner input = new Scanner(System.in);

		System.out.print("������ ��ǰ�� ������ �Է��Ͻÿ�: ");
		product_price = input.nextInt();

		System.out.print("���� �ݾ��� �Է��Ͻÿ�: ");
		get_money = input.nextInt();

		
		surtax = product_price * 1/10;
		change = get_money - product_price;

		System.out.printf("������: %d\n", get_money);
		System.out.printf("��ǰ�� �Ѿ�: %d\n", product_price);
		System.out.printf("�ΰ���: %d\n", surtax);
		System.out.printf("�ܵ�: %d\n", change);
	}
}