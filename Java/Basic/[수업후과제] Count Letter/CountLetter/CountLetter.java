import java.util.Scanner;

class CountLetter
	{	
		public static void main(String args[])
		{
			Scanner scan = new Scanner(System.in);
			
			// 26���� ������ ������ �� �ִ� �迭 count�� �����ϰ� �����϶�.
			int count[] = new int[26];
			
			//���ڿ� �Է�
			System.out.println("���ڿ��� �Է��Ͻÿ� : ");
			String buffer = scan.nextLine();

			// �� ���ڰ� �����ϴ� ȸ���� ����Ѵ�.
			for(int i=0; i< buffer.length();i++)
			{
				char ch = buffer.charAt(i);
				if (ch == ' ')   
					continue; //���� �����̽��̸� �ݺ��� ����Ѵ�

				count[ch-'a']++;
			}

			// �迭�� ����� Ƚ���� ����ϴ� �ݺ�����
			for (int i = 0; i <26; i++) {
				System.out.println((char)(97+i) + "�� ���� : " + count[i]);
			}                    
	}
}