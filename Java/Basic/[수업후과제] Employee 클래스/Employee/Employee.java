public class Employee
	{
		private String name;				// 직원이름
		private String address;				// 주소
		private int annualSalary;		// 연봉
		private String phoneNum;			// 전화번호

		public Employee(String name, String address, int annnualSalary, String phoneNum) {
			this.name = name;
			this.address = address;
			this.annualSalary = annnualSalary;
			this.phoneNum = phoneNum;
		}
		
		// 각각 필드에 대하여 getter와 setter 메소드를 작성하라.
		public   String getName( )			//name getter 메소드
		{
			return name;
		}

		public void  setName(String name)	//name setter 메소드
		{
			this.name = name;
		}
		
		public   String getAddress( )		//address getter 메소드
		{
			return address;
		}

		public void  setAddress(String address)		//address setter 메소드
		{
			this.address = address;
		}
		
		public   int getAnnualSalary( )			//annualSalary getter 메소드
		{
			return annualSalary;
		}

		public void  setAnnualSalary(int annualSalary)	//annualSalary setter 메소드
		{
			this.annualSalary = annualSalary;
		}
		
		public   String getPhoneNum( )			//phoneNum getter 메소드
		{
			return phoneNum;
		}

		public void  setPhoneNum(String phoneNum)	//phoneNum setter 메소드
		{
			this.phoneNum = phoneNum;
		}

		// toString()메소드를 작성하여 본다.
		public String toString() {

		    return  " name : " + name + " Address : " + address + " Annual_salary : " + annualSalary + " phone : " + phoneNum;

		}

	}