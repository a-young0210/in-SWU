import java.util.Random;
import java.util.Scanner;

public class FindNumGame {
	public static void main(String[] args) {
	
	Random ranGen = new Random(); 
	Scanner scan = new Scanner(System.in); 

	int ranNum;
	int putNum;
	int count = 0;


	ranNum = ranGen.nextInt(100) + 1;		//0 ~ 99 , 1 ~ 100
	while(count<5) {
		count++;
		System.out.println("�߻��� ���ڴ�?");
		putNum = scan.nextInt();
		if(putNum==ranNum) {
			System.out.println(count + "ȸ������ ������ ���߾����ϴ�.");
			System.exit(0); }
		else if (putNum>ranNum) {
			System.out.println("�Էµ� ���ڰ� ���亸�� ū �� �Դϴ�.");
			if(count == 5){
				System.out.println("������ 5�� �õ��� ������ ���߽��ϴ�.");}}
		else if (putNum<ranNum) {
			System.out.println("�Էµ� ���ڰ� ���亸�� ���� �� �Դϴ�.");
			if(count == 5){
				System.out.println("������ 5�� �õ��� ������ ���߽��ϴ�.");}}
		}
	}
}	