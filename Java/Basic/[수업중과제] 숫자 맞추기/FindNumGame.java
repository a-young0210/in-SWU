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
		System.out.println("발생된 숫자는?");
		putNum = scan.nextInt();
		if(putNum==ranNum) {
			System.out.println(count + "회수만에 정답을 맞추었습니다.");
			System.exit(0); }
		else if (putNum>ranNum) {
			System.out.println("입력된 숫자가 정답보다 큰 수 입니다.");
			if(count == 5){
				System.out.println("정답을 5번 시도에 맞추지 못했습니다.");}}
		else if (putNum<ranNum) {
			System.out.println("입력된 숫자가 정답보다 작은 수 입니다.");
			if(count == 5){
				System.out.println("정답을 5번 시도에 맞추지 못했습니다.");}}
		}
	}
}	