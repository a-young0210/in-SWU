import java.util.Scanner;
import java.io.*;
import java.util.InputMismatchException;


public class UserInterface {
	@SuppressWarnings("unused")
	public static void main(String args[]) throws Exception {
		
		@SuppressWarnings("resource")
		Scanner scan = new Scanner(System.in);
		Book m = new Book(100, null);// �ʱ�ȭ�� �迭�� ũ�⸦ 100���� ���Ѵ�
		Person[] personInfo = null; // �ּҷ��� ���ο� ���
		int menu; // ������ ������ �޴� ��� ����
		boolean run = true; // �ּҷ� ���� ���α׷� ���Ḧ ���� ����
		
		while (run){ // �ּҷ� ���� ���α׷� �ݺ�
			System.out.println("------------------------------------*********�ּҷ� ���� ���α׷�*********------------------------------------");
			System.out.println("1.�� �ּҷ� ����\n2.�ּҷ� �˻�\n3.��ü �ּҷ� ��ȸ\n4.�ּҷ� ����\n5.���� �ּҷ� ����\n6.���� ����\n7.���α׷�����");
			System.out.println("---------------------------------------------------------------------------------------------------------");
			System.out.print("�����ϰ� ���� ���� ��ȣ�� �Է��� �ּ��� : ");
			
			try {
				menu = scan.nextInt(); // �޴� ��ȣ�� �Է� �޴´�
				scan.nextLine();// ���� �����ϱ�
			} catch (InputMismatchException misExc) {
				System.out.println("�߸��� �Է��Դϴ�. 1,2�� ���� ������ �Է��� �ּ���");
				scan.nextLine(); // ���� �����ϱ�
				continue;
			}
			
			
			
			switch (menu){ // ��ȣ �׸� ���� �޴�
				case 1: // �� �ּҷ� ����
					
					//�ּҷ� ���� �޼ҵ� ȣ��+ó��
					System.out.println("�߰��ϰ� ���� ��ü�� �����͸� �Է��ϼ���.");
					System.out.println("�̸� : ");
					String newName = scan.nextLine();
					System.out.println("���� : ");
					String newMajor = scan.nextLine();
					System.out.println("�й� : ");
					String newClassNum = scan.nextLine();	
					System.out.println("���� : ");
					String newBirthday = scan.nextLine();
					System.out.println("�̸��� : ");
					String newEmail = scan.nextLine();
					System.out.println("�ּ� : ");
					String newAddress = scan.nextLine();
					
					Person p1 = new Person(newName, newMajor, newClassNum, newBirthday, newEmail, newAddress);
					
					try {
						
					m.addPerson(p1);
					
					} catch (Exception e) {
						
						System.out.println("��ȭ��ȣ�ΰ� ����á���ϴ�.");
						break;
						
					}
					
					break;
					
				case 2: // �ּҷ� �˻�

					//�ּҷ� �˻� �޼ҵ� ȣ��+ó��
					System.out.println("ã�� ���� ����� �̸��� �Է��ϼ��� : ");
					String s_Name = scan.nextLine();
					try {
						System.out.println(m.getAddressBook()[m.searchName(s_Name)]);
						
					} catch (Exception e) {
						System.out.println("�ش��ϴ� ����� �����ϴ�.");
						break;
					}
					System.out.println("�ش��ϴ� ����� ã�ҽ��ϴ�.");
					break;
					
				case 3: // ��ü �ּҷ� ��ȸ
					
					if (m.getIndex() == 0)
					{
						System.out.println("��ϵ� ����� �����ϴ�.");
					} else
					{
						System.out.println("��ü �ּҷ��� ����մϴ�.");
						for ( int i = 0; i < m.getIndex(); i++)
							System.out.println(m.getAddressBook()[i] + "\n");
					}
					
					break;
					
				case 4: // �ּҷ� ����
					
					//�ּҷ� ���� �޼ҵ� ȣ��+ó��
					System.out.println("�����ϰ� ���� ����� �̸��� �Է��ϼ��� : ");
					String m_Name = scan.nextLine();
					
					System.out.println("�����ϰ� ���� ��ü�� �����͸� �Է��ϼ���.");
					System.out.println("�̸� : ");
					String mName = scan.nextLine();
					System.out.println("���� : ");
					String mMajor = scan.nextLine();
					System.out.println("�й� : ");
					String mClassNum = scan.nextLine();	
					System.out.println("���� : ");
					String mBirthday = scan.nextLine();
					System.out.println("�̸��� : ");
					String mEmail = scan.nextLine();
					System.out.println("�ּ� : ");
					String mAddress = scan.nextLine();
					
					Person p2 = new Person(mName, mMajor, mClassNum, mBirthday, mEmail, mAddress);
					
					try {
						m.modifyPerson(m_Name, p2);
						
					} catch (Exception a) {
						System.out.println("�ش��ϴ� ����� �����ϴ�.");
						break;
					}
					
					System.out.println("���������� �����Ǿ����ϴ�.");
					break;
					
					
				case 5: // ���� �ּҷ� ����
					
					//�ּҷ� ���� �޼ҵ� ȣ��+ó��
					System.out.println("�����ϰ� ���� ����� �̸��� �Է��ϼ��� : ");
					String d_Name = scan.nextLine();
					try {
						m.deletePerson(d_Name);
					} catch (Exception e) {
						System.out.println("�ش��ϴ� ����� �����ϴ�.");
						break;
					}
					System.out.println("�ش��ϴ� ����� �����߽��ϴ�.");
					break;
					
					
				case 6 : // ���� ����
					DataOutputStream out = null;
					
					try
						{
							out = new DataOutputStream(new FileOutputStream("AddressBook.dat"));
							m.writeFile(out);
							System.out.println("���� ������ �Ϸ�Ǿ����ϴ�.");
						} catch(IOException ioe)
						{
							System.out.println("������ ����� �� �����ϴ�.");
						} finally
						{
							try
							{
								out.close(); 		//���� �ݱ�
							} catch(Exception e)
							{
								
							}
						}
						break;
						
						
				case 7: // ���α׷� ����
					System.out.println("���α׷��� �����մϴ�.");
					run = false; // �ּҷ� ���� ���α׷� ����������
					break;
					
				default:
					System.out.println("�߸� �Է��ϼ̽��ϴ�. �ٽ� �Է� ���ּ���.");
					break;
					
					
				
			
		}
	}
	}
}
