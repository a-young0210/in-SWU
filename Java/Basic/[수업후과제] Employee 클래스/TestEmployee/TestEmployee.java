import java.util.Scanner;

class TestEmployee
	{
		public static void main(String args[])
		{
			Scanner scan = new Scanner(System.in);
			// �迭 ���� ������ �����Ѵ�.
			Employee[] a;
			                               ;
			// �迭�� �����Ѵ�.
			a = new Employee[2];
			                               ;
			// ����ڷκ��� �����͸� �޾Ƽ� �迭�� �߰��Ͽ� ����.
			String name, address, phoneNum;
			int annualSalary;
			
			for(int i = 0; i < a.length; i++) {
				System.out.print("�̸��� �Է��ϼ��� [������ȣ" + (i+1) + "]: ");
				name = scan.next();
				
				System.out.print("�ּҸ� �Է��ϼ��� [������ȣ" + (i+1) + "]: ");
				address = scan.next();
				
				System.out.print("������ �Է��ϼ��� [������ȣ" + (i+1) + "]: ");
				annualSalary = scan.nextInt();
				
				System.out.print("��ȭ��ȣ�� �Է��ϼ��� [������ȣ" + (i+1) + "]: ");
				phoneNum = scan.next();
				
				a[i] = new Employee(name, address, annualSalary, phoneNum);
			}
			
			// �迭 ���� ���� �޴�
			System.out.println("�����Ͻðڽ��ϱ�?");
			String input = scan.next();
			
			if(input.equals("y")){				//y��� �Ѵٸ�
				System.out.println("�����ϰ� ���� ������ȣ�� �Է��ϼ��� : ");
				String employeeNumber = scan.next();
				int employeeNum = Integer.parseInt(employeeNumber);
				
				System.out.print("�̸��� �Է��ϼ��� [������ȣ" + employeeNum + "]: ");
				name = scan.next();
				
				System.out.print("�ּҸ� �Է��ϼ��� [������ȣ" + employeeNum + "]: ");
				address = scan.next();
				
				System.out.print("������ �Է��ϼ��� [������ȣ" + employeeNum + "]: ");
				annualSalary = scan.nextInt();
				
				System.out.print("��ȭ��ȣ�� �Է��ϼ��� [������ȣ" + employeeNum + "]: ");
				phoneNum = scan.next();
				
				a[employeeNum-1] = new Employee(name, address, annualSalary, phoneNum);
				//�ε����� -1�̱⿡ 1�� ���ش�.
			}
			
			else if(input.equals("n")) {		//n�̶�� �Ѵٸ�
				System.out.println("�������� �ʰ� ����մϴ�.");
			}
			
			
			else {					//y�� n�� �ƴ� �ٸ� ���ڸ� �Է��Ѵٸ�
				System.out.println("�߸� �Է��Ͽ����ϴ�. y �Ǵ� n���� �����ּ���.");
			}
			

			// �迭�� ����� ��� �����͸� ����Ѵ�.
			for(int i = 0; i < a.length; i++) {
				System.out.print("������ȣ[" + (i+1) + "]");
				System.out.println(a[i].toString());
			}
		}
	}