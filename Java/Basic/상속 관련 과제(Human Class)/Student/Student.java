public class Student extends Human {	//Student Ŭ������ Human ���
	
	String major;			//major �ʵ� ����


	public Student(String name, int age, String major) {	//������ ����
		super(name, age);
		this.major=major;
	}
	
	public void setMajor(String major) {
		this.major = major;			//major ������
	}
	
	public String getMajor() {
		return major;		//major ������
	}
	
	//toString() 
	public String toString() {
		return "�̸� : " + name + " ���� : " + age + " ���� : " + major;
	}
}