/*
*체질량지수(body mass index, BMI)를 계산하여 이에 따라 비만 여부를 판별하는 프로그램
*/

import java.util.Scanner;

public class part03_BMI {
	public static void main(String[] args){
		float weight;		//몸무게 저장 변수 선언
		float height;		//키 저장 변수 선언	
		double bmi;		//bmi 저장 변수 선언

	Scanner scan = new Scanner(System.in); //키보드로부터 입력받기 위한 스캐너 객체를 생성
	System.out.println("몸무게를 입력하시오 : ");
	weight = scan.nextFloat(); 	//몸무게를 입력받는다.
	System.out.println("키를 입력하시오(미터 단위) : ");
	height = scan.nextFloat();
	bmi = weight / (height * height);
	System.out.println("당신의 몸무게는 " + weight + ", 키는 " + height + "이므로, BMI는 " + bmi + "입니다.");
	
	if(bmi >40.0)			//BMI가 40.0 초과이면
		System.out.println("**당신은 병적인 비만입니다 **");

	else if(bmi>27.5)			//BMI가 27.5초과 40.0 이하이면
		System.out.println("**당신은 비만입니다 **");

	else if(bmi >23.0)			//BMI가 23.0초과 27.5이하이면
		System.out.println("**당신은 과체중 입니다 **");

	else if(bmi >18.5)			//BMI가 18.5초과 23.0미만이면
		System.out.println("**당신은 정상체중 입니다 **");

	else if(bmi >15.0)			//BMI가 15.0초과 18.5미만이면
		System.out.println("**당신은 저체중 입니다 **");

	else
		System.out.println("**당신은 병벅인 저체중 입니다 **");

	

	
		}
	}
	