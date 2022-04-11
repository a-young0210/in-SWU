public class Human {		//클래스 Human 정의
	String name;			//필드 선언
	int age;
	
	Human(String name, int age) {	//생성자 작성
		this.name = name;			//입력 값으로 필드 값 초기화
		this.age = age;
	}
	
	public void  setName(String name)		//name 접근자
	{
		this.name = name;
	}
	
	public void  setAge(int age)			//age 접근자
	{
		this.age = age;
	}
	
	public   String getName( )			//name 변경자
	{
		return name;
	}
	
	public   int getAge( )				//age 변경자
	{
		return age;
	}
	
	//toString()메소드 재정의
	public String toString() {
	
		 return  " 이름 : " + name + " 나이 : " + age;
	
	}
}