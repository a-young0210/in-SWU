import java.util.Scanner;
import java.io.*;
import java.util.InputMismatchException;


public class UserInterface {
	@SuppressWarnings("unused")
	public static void main(String args[]) throws Exception {
		
		@SuppressWarnings("resource")
		Scanner scan = new Scanner(System.in);
		Book m = new Book(100, null);// 초기화시 배열의 크기를 100으로 정한다
		Person[] personInfo = null; // 주소록의 새로운 목록
		int menu; // 유저가 선택한 메뉴 담는 변수
		boolean run = true; // 주소록 관리 프로그램 종료를 위한 변수
		
		while (run){ // 주소록 관리 프로그램 반복
			System.out.println("------------------------------------*********주소록 관리 프로그램*********------------------------------------");
			System.out.println("1.새 주소록 생성\n2.주소록 검색\n3.전체 주소록 조회\n4.주소록 수정\n5.기존 주소록 삭제\n6.파일 저장\n7.프로그램종료");
			System.out.println("---------------------------------------------------------------------------------------------------------");
			System.out.print("수행하고 싶은 일의 번호를 입력해 주세요 : ");
			
			try {
				menu = scan.nextInt(); // 메뉴 번호를 입력 받는다
				scan.nextLine();// 버퍼 삭제하기
			} catch (InputMismatchException misExc) {
				System.out.println("잘못된 입력입니다. 1,2와 같은 정수를 입력해 주세요");
				scan.nextLine(); // 버퍼 삭제하기
				continue;
			}
			
			
			
			switch (menu){ // 번호 항목에 따른 메뉴
				case 1: // 새 주소록 생성
					
					//주소록 생성 메소드 호출+처리
					System.out.println("추가하고 싶은 객체의 데이터를 입력하세요.");
					System.out.println("이름 : ");
					String newName = scan.nextLine();
					System.out.println("전공 : ");
					String newMajor = scan.nextLine();
					System.out.println("학번 : ");
					String newClassNum = scan.nextLine();	
					System.out.println("생일 : ");
					String newBirthday = scan.nextLine();
					System.out.println("이메일 : ");
					String newEmail = scan.nextLine();
					System.out.println("주소 : ");
					String newAddress = scan.nextLine();
					
					Person p1 = new Person(newName, newMajor, newClassNum, newBirthday, newEmail, newAddress);
					
					try {
						
					m.addPerson(p1);
					
					} catch (Exception e) {
						
						System.out.println("전화번호부가 가득찼습니다.");
						break;
						
					}
					
					break;
					
				case 2: // 주소록 검색

					//주소록 검색 메소드 호출+처리
					System.out.println("찾고 싶은 사람의 이름을 입력하세요 : ");
					String s_Name = scan.nextLine();
					try {
						System.out.println(m.getAddressBook()[m.searchName(s_Name)]);
						
					} catch (Exception e) {
						System.out.println("해당하는 사람이 없습니다.");
						break;
					}
					System.out.println("해당하는 사람을 찾았습니다.");
					break;
					
				case 3: // 전체 주소록 조회
					
					if (m.getIndex() == 0)
					{
						System.out.println("등록된 사람이 없습니다.");
					} else
					{
						System.out.println("전체 주소록을 출력합니다.");
						for ( int i = 0; i < m.getIndex(); i++)
							System.out.println(m.getAddressBook()[i] + "\n");
					}
					
					break;
					
				case 4: // 주소록 수정
					
					//주소록 수정 메소드 호출+처리
					System.out.println("수정하고 싶은 사람의 이름을 입력하세요 : ");
					String m_Name = scan.nextLine();
					
					System.out.println("수정하고 싶은 객체의 데이터를 입력하세요.");
					System.out.println("이름 : ");
					String mName = scan.nextLine();
					System.out.println("전공 : ");
					String mMajor = scan.nextLine();
					System.out.println("학번 : ");
					String mClassNum = scan.nextLine();	
					System.out.println("생일 : ");
					String mBirthday = scan.nextLine();
					System.out.println("이메일 : ");
					String mEmail = scan.nextLine();
					System.out.println("주소 : ");
					String mAddress = scan.nextLine();
					
					Person p2 = new Person(mName, mMajor, mClassNum, mBirthday, mEmail, mAddress);
					
					try {
						m.modifyPerson(m_Name, p2);
						
					} catch (Exception a) {
						System.out.println("해당하는 사람이 없습니다.");
						break;
					}
					
					System.out.println("성공적으로 수정되었습니다.");
					break;
					
					
				case 5: // 기존 주소록 삭제
					
					//주소록 삭제 메소드 호출+처리
					System.out.println("삭제하고 싶은 사람의 이름을 입력하세요 : ");
					String d_Name = scan.nextLine();
					try {
						m.deletePerson(d_Name);
					} catch (Exception e) {
						System.out.println("해당하는 사람이 없습니다.");
						break;
					}
					System.out.println("해당하는 사람을 삭제했습니다.");
					break;
					
					
				case 6 : // 파일 저장
					DataOutputStream out = null;
					
					try
						{
							out = new DataOutputStream(new FileOutputStream("AddressBook.dat"));
							m.writeFile(out);
							System.out.println("파일 저장이 완료되었습니다.");
						} catch(IOException ioe)
						{
							System.out.println("파일을 출력할 수 없습니다.");
						} finally
						{
							try
							{
								out.close(); 		//파일 닫기
							} catch(Exception e)
							{
								
							}
						}
						break;
						
						
				case 7: // 프로그램 종료
					System.out.println("프로그램을 종료합니다.");
					run = false; // 주소록 관리 프로그램 빠져나가기
					break;
					
				default:
					System.out.println("잘못 입력하셨습니다. 다시 입력 해주세요.");
					break;
					
					
				
			
		}
	}
	}
}
