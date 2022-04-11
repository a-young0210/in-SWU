import java.util.Scanner;

class Gameplay // 클래스 선언
	{

		public static void main(String args[])

		{
			Scanner scan = new Scanner(System.in);
			
			String chulsu; // 문자열 철수 선언
			String younghee; // 문자열 영희 선언

			System.out.println("가위, 바위, 보 중에서 입력하세요.");

			System.out.print("철수 : "); // 철수 입력
			chulsu = scan.nextLine();

			System.out.print("영희 : "); // 영희 입력
			younghee = scan.nextLine();


			if(chulsu.equals("가위")) // 철수가 가위 일때

			{

				if(younghee.equals("가위")) // 영희가 가위이면
					System.out.println("비겼습니다.");

				else if(younghee.equals("바위")) // 영희가 바위이면
					System.out.println("영희가 이겼습니다.");

				else if(younghee.equals("보")) // 영희가 보이면
					System.out.println("철수가 이겼습니다.");

			}


			else if(chulsu.equals("바위")) // 철수가 바위 일때

			{

				if(younghee.equals("가위")) // 영희가 가위이면
					System.out.println("철수가 이겼습니다.");

				else if(younghee.equals("바위")) // 영희가 바위이면
					System.out.println("비겼습니다.");
				
				else if(younghee.equals("보")) // 영희가 보이면
					System.out.println("영희가 이겼습니다.");

			}


			else // 철수가 보 일때

			{

				if(younghee.equals("가위")) // 영희가 가위이면
					System.out.println("영희가 이겼습니다.");

				else if(younghee.equals("바위")) // 영희 바위이면
					System.out.println("철수가 이겼습니다.");

				else if(younghee.equals("보")) // 영희가 보이면
					System.out.println("비겼습니다.");

			}

		}

}