public class Employee
	{
		private String name;				// �����̸�
		private String address;				// �ּ�
		private int annualSalary;		// ����
		private String phoneNum;			// ��ȭ��ȣ

		public Employee(String name, String address, int annnualSalary, String phoneNum) {
			this.name = name;
			this.address = address;
			this.annualSalary = annnualSalary;
			this.phoneNum = phoneNum;
		}
		
		// ���� �ʵ忡 ���Ͽ� getter�� setter �޼ҵ带 �ۼ��϶�.
		public   String getName( )			//name getter �޼ҵ�
		{
			return name;
		}

		public void  setName(String name)	//name setter �޼ҵ�
		{
			this.name = name;
		}
		
		public   String getAddress( )		//address getter �޼ҵ�
		{
			return address;
		}

		public void  setAddress(String address)		//address setter �޼ҵ�
		{
			this.address = address;
		}
		
		public   int getAnnualSalary( )			//annualSalary getter �޼ҵ�
		{
			return annualSalary;
		}

		public void  setAnnualSalary(int annualSalary)	//annualSalary setter �޼ҵ�
		{
			this.annualSalary = annualSalary;
		}
		
		public   String getPhoneNum( )			//phoneNum getter �޼ҵ�
		{
			return phoneNum;
		}

		public void  setPhoneNum(String phoneNum)	//phoneNum setter �޼ҵ�
		{
			this.phoneNum = phoneNum;
		}

		// toString()�޼ҵ带 �ۼ��Ͽ� ����.
		public String toString() {

		    return  " name : " + name + " Address : " + address + " Annual_salary : " + annualSalary + " phone : " + phoneNum;

		}

	}