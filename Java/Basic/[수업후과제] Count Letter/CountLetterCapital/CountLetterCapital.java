import java.util.Scanner;

class CountLetterCapital
	{	
		public static void main(String args[])
		{
			Scanner scan = new Scanner(System.in);
			
			// 26���� ����(�ҹ���)�� ������ �� �ִ� �迭 count�� �����ϰ� �����϶�.
			int count1[] = new int[26];
			// 26���� ����(�ҹ���)�� ������ �� �ִ� �迭 count�� �����ϰ� �����϶�.
			int count2[] = new int[26];
			
			//���ڿ� �Է�
			System.out.println("���ڿ��� �Է��Ͻÿ� : ");
			String buffer = scan.nextLine();

			// �� ���ڰ� �����ϴ� ȸ���� ����Ѵ�.
			for(int i=0; i< buffer.length();i++)
			{
				char ch = buffer.charAt(i);
				if (ch == ' ')   
					continue; //���� �����̽��̸� �ݺ��� ����Ѵ�.
				
				if(ch>='a') 		
					count1[ch-'a']++;
		
				else
					count2[ch-'A']++;
			}

			// �迭�� ����� Ƚ���� ����ϴ� �ݺ�����(�빮��)
			for (int i = 0; i <26; i++) {
				System.out.println((char)('A'+i) + "�� ���� : " + count2[i]);
			}      
			
			// �迭�� ����� Ƚ���� ����ϴ� �ݺ�����(�ҹ���)
			for (int i = 0; i <26; i++) {
				System.out.println((char)('a'+i) + "�� ���� : " + count1[i]);
			}                     
	}
}