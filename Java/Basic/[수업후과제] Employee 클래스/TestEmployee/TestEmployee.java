import java.util.Scanner;

class TestEmployee
	{
		public static void main(String args[])
		{
			Scanner scan = new Scanner(System.in);
			// 배열 참조 변수를 선언한다.
			Employee[] a;
			                               ;
			// 배열을 생성한다.
			a = new Employee[2];
			                               ;
			// 사용자로부터 데이터를 받아서 배열에 추가하여 본다.
			String name, address, phoneNum;
			int annualSalary;
			
			for(int i = 0; i < a.length; i++) {
				System.out.print("이름을 입력하세요 [직원번호" + (i+1) + "]: ");
				name = scan.next();
				
				System.out.print("주소를 입력하세요 [직원번호" + (i+1) + "]: ");
				address = scan.next();
				
				System.out.print("연봉을 입력하세요 [직원번호" + (i+1) + "]: ");
				annualSalary = scan.nextInt();
				
				System.out.print("전화번호를 입력하세요 [직원번호" + (i+1) + "]: ");
				phoneNum = scan.next();
				
				a[i] = new Employee(name, address, annualSalary, phoneNum);
			}
			
			// 배열 내용 수정 메뉴
			System.out.println("수정하시겠습니까?");
			String input = scan.next();
			
			if(input.equals("y")){				//y라고 한다면
				System.out.println("수정하고 싶은 직원번호를 입력하세요 : ");
				String employeeNumber = scan.next();
				int employeeNum = Integer.parseInt(employeeNumber);
				
				System.out.print("이름을 입력하세요 [직원번호" + employeeNum + "]: ");
				name = scan.next();
				
				System.out.print("주소를 입력하세요 [직원번호" + employeeNum + "]: ");
				address = scan.next();
				
				System.out.print("연봉을 입력하세요 [직원번호" + employeeNum + "]: ");
				annualSalary = scan.nextInt();
				
				System.out.print("전화번호를 입력하세요 [직원번호" + employeeNum + "]: ");
				phoneNum = scan.next();
				
				a[employeeNum-1] = new Employee(name, address, annualSalary, phoneNum);
				//인덱스는 -1이기에 1를 빼준다.
			}
			
			else if(input.equals("n")) {		//n이라고 한다면
				System.out.println("수정하지 않고 출력합니다.");
			}
			
			
			else {					//y와 n이 아닌 다른 글자를 입력한다면
				System.out.println("잘못 입력하였습니다. y 또는 n으로 답해주세요.");
			}
			

			// 배열에 저장된 모든 데이터를 출력한다.
			for(int i = 0; i < a.length; i++) {
				System.out.print("직원번호[" + (i+1) + "]");
				System.out.println(a[i].toString());
			}
		}
	}