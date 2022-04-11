public class Student extends Human {	//Student 클래스에 Human 상속
	
	String major;			//major 필드 정의


	public Student(String name, int age, String major) {	//생성자 정의
		super(name, age);
		this.major=major;
	}
	
	public void setMajor(String major) {
		this.major = major;			//major 접근자
	}
	
	public String getMajor() {
		return major;		//major 설정자
	}
	
	//toString() 
	public String toString() {
		return "이름 : " + name + " 나이 : " + age + " 전공 : " + major;
	}
}