/*
*ü��������(body mass index, BMI)�� ����Ͽ� �̿� ���� �� ���θ� �Ǻ��ϴ� ���α׷�
*/

import java.util.Scanner;

public class part03_BMI {
	public static void main(String[] args){
		float weight;		//������ ���� ���� ����
		float height;		//Ű ���� ���� ����	
		double bmi;		//bmi ���� ���� ����

	Scanner scan = new Scanner(System.in); //Ű����κ��� �Է¹ޱ� ���� ��ĳ�� ��ü�� ����
	System.out.println("�����Ը� �Է��Ͻÿ� : ");
	weight = scan.nextFloat(); 	//�����Ը� �Է¹޴´�.
	System.out.println("Ű�� �Է��Ͻÿ�(���� ����) : ");
	height = scan.nextFloat();
	bmi = weight / (height * height);
	System.out.println("����� �����Դ� " + weight + ", Ű�� " + height + "�̹Ƿ�, BMI�� " + bmi + "�Դϴ�.");
	
	if(bmi >40.0)			//BMI�� 40.0 �ʰ��̸�
		System.out.println("**����� ������ ���Դϴ� **");

	else if(bmi>27.5)			//BMI�� 27.5�ʰ� 40.0 �����̸�
		System.out.println("**����� ���Դϴ� **");

	else if(bmi >23.0)			//BMI�� 23.0�ʰ� 27.5�����̸�
		System.out.println("**����� ��ü�� �Դϴ� **");

	else if(bmi >18.5)			//BMI�� 18.5�ʰ� 23.0�̸��̸�
		System.out.println("**����� ����ü�� �Դϴ� **");

	else if(bmi >15.0)			//BMI�� 15.0�ʰ� 18.5�̸��̸�
		System.out.println("**����� ��ü�� �Դϴ� **");

	else
		System.out.println("**����� ������ ��ü�� �Դϴ� **");

	

	
		}
	}
	