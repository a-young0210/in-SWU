import java.util.Scanner;

class CountLetterCapital
	{	
		public static void main(String args[])
		{
			Scanner scan = new Scanner(System.in);
			
			// 26개의 정수(소문자)를 저장할 수 있는 배열 count를 선언하고 생성하라.
			int count1[] = new int[26];
			// 26개의 정수(소문자)를 저장할 수 있는 배열 count를 선언하고 생성하라.
			int count2[] = new int[26];
			
			//문자열 입력
			System.out.println("문자열을 입력하시오 : ");
			String buffer = scan.nextLine();

			// 각 문자가 등장하는 회수를 계산한다.
			for(int i=0; i< buffer.length();i++)
			{
				char ch = buffer.charAt(i);
				if (ch == ' ')   
					continue; //만약 스페이스이면 반복을 계속한다.
				
				if(ch>='a') 		
					count1[ch-'a']++;
		
				else
					count2[ch-'A']++;
			}

			// 배열에 저장된 횟수를 출력하는 반복루프(대문자)
			for (int i = 0; i <26; i++) {
				System.out.println((char)('A'+i) + "의 개수 : " + count2[i]);
			}      
			
			// 배열에 저장된 횟수를 출력하는 반복루프(소문자)
			for (int i = 0; i <26; i++) {
				System.out.println((char)('a'+i) + "의 개수 : " + count1[i]);
			}                     
	}
}