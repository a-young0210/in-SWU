import java.util.Scanner;

class Gameplay // Ŭ���� ����
	{

		public static void main(String args[])

		{
			Scanner scan = new Scanner(System.in);
			
			String chulsu; // ���ڿ� ö�� ����
			String younghee; // ���ڿ� ���� ����

			System.out.println("����, ����, �� �߿��� �Է��ϼ���.");

			System.out.print("ö�� : "); // ö�� �Է�
			chulsu = scan.nextLine();

			System.out.print("���� : "); // ���� �Է�
			younghee = scan.nextLine();


			if(chulsu.equals("����")) // ö���� ���� �϶�

			{

				if(younghee.equals("����")) // ���� �����̸�
					System.out.println("�����ϴ�.");

				else if(younghee.equals("����")) // ���� �����̸�
					System.out.println("���� �̰���ϴ�.");

				else if(younghee.equals("��")) // ���� ���̸�
					System.out.println("ö���� �̰���ϴ�.");

			}


			else if(chulsu.equals("����")) // ö���� ���� �϶�

			{

				if(younghee.equals("����")) // ���� �����̸�
					System.out.println("ö���� �̰���ϴ�.");

				else if(younghee.equals("����")) // ���� �����̸�
					System.out.println("�����ϴ�.");
				
				else if(younghee.equals("��")) // ���� ���̸�
					System.out.println("���� �̰���ϴ�.");

			}


			else // ö���� �� �϶�

			{

				if(younghee.equals("����")) // ���� �����̸�
					System.out.println("���� �̰���ϴ�.");

				else if(younghee.equals("����")) // ���� �����̸�
					System.out.println("ö���� �̰���ϴ�.");

				else if(younghee.equals("��")) // ���� ���̸�
					System.out.println("�����ϴ�.");

			}

		}

}