import java.io.*;

public class Person {		//클래스 Person 정의
	private String name;			//필드 선언
	private String major;
	private String classNum;		//학번
	private String birthday;
	private String email;
	private String address;
	
	public Person() {

	}
	
	Person(String name, String major, String classNum, String birthday, String email, String address) {	//생성자 작성
		this.name = name;			//입력 값으로 필드 값 초기화
		this.major = major;
		this.classNum = classNum;
		this.birthday = birthday;
		this.email = email;
		this.address = address;
	}
	


	public void  setName(String name)		//name 접근자
	{
		this.name = name;
	}
	
	public void  setMajor(String major)			//major 접근자
	{
		this.major = major;
	}
	
	public void  setClassNum(String classNum)			//classNum 접근자
	{
		this.classNum = classNum;
	}
	
	public void  setBirthday(String birthday)			//birthday 접근자
	{
		this.birthday = birthday;
	}
	
	public void  setEmail(String email)			//email 접근자
	{
		this.email = email;
	}
	
	public void  setAddress(String address)			//address 접근자
	{
		this.address = address;
	}
	
	
	public   String getName( )			//name 변경자
	{
		return name;
	}
	
	public   String getMajor( )				//major 변경자
	{
		return major;
	}
	
	public   String getClassNum( )				//classNum 변경자
	{
		return classNum;
	}
	
	public   String getBirthday( )				//birthday 변경자
	{
		return birthday;
	}
	
	public   String getEmail( )				//email 변경자
	{
		return email;
	}
	
	public   String getAddress( )				//address 변경자
	{
		return address;
	}
	
	public void writeMyField(DataOutputStream out) throws IOException	//이름, 전공, 학번, 생일, 이메일, 주소  쓰기
	{
		out.writeUTF(name);
		out.writeUTF(major);
		out.writeUTF(classNum);
		out.writeUTF(birthday);
		out.writeUTF(email);
		out.writeUTF(address);
	}
	
	public void readMyField(DataInputStream in) throws IOException	//이름, 전공, 학번, 생일, 이메일, 주소 읽기
	{
		name = in.readUTF();
		major = in.readUTF();
		classNum = in.readUTF();
		birthday = in.readUTF();
		email = in.readUTF();
		address = in.readUTF();
		
	}
	
	
	@Override
	//toString 메소드 재정의
	public String toString() {
		return "이름 : " + name + "전공 : " + major + "학번 : " + classNum + "생일 : " + birthday + "이메일 : " +
			       email + "주소 : " + address;
	}

}