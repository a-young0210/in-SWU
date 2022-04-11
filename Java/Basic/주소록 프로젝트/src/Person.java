import java.io.*;

public class Person {		//Ŭ���� Person ����
	private String name;			//�ʵ� ����
	private String major;
	private String classNum;		//�й�
	private String birthday;
	private String email;
	private String address;
	
	public Person() {

	}
	
	Person(String name, String major, String classNum, String birthday, String email, String address) {	//������ �ۼ�
		this.name = name;			//�Է� ������ �ʵ� �� �ʱ�ȭ
		this.major = major;
		this.classNum = classNum;
		this.birthday = birthday;
		this.email = email;
		this.address = address;
	}
	


	public void  setName(String name)		//name ������
	{
		this.name = name;
	}
	
	public void  setMajor(String major)			//major ������
	{
		this.major = major;
	}
	
	public void  setClassNum(String classNum)			//classNum ������
	{
		this.classNum = classNum;
	}
	
	public void  setBirthday(String birthday)			//birthday ������
	{
		this.birthday = birthday;
	}
	
	public void  setEmail(String email)			//email ������
	{
		this.email = email;
	}
	
	public void  setAddress(String address)			//address ������
	{
		this.address = address;
	}
	
	
	public   String getName( )			//name ������
	{
		return name;
	}
	
	public   String getMajor( )				//major ������
	{
		return major;
	}
	
	public   String getClassNum( )				//classNum ������
	{
		return classNum;
	}
	
	public   String getBirthday( )				//birthday ������
	{
		return birthday;
	}
	
	public   String getEmail( )				//email ������
	{
		return email;
	}
	
	public   String getAddress( )				//address ������
	{
		return address;
	}
	
	public void writeMyField(DataOutputStream out) throws IOException	//�̸�, ����, �й�, ����, �̸���, �ּ�  ����
	{
		out.writeUTF(name);
		out.writeUTF(major);
		out.writeUTF(classNum);
		out.writeUTF(birthday);
		out.writeUTF(email);
		out.writeUTF(address);
	}
	
	public void readMyField(DataInputStream in) throws IOException	//�̸�, ����, �й�, ����, �̸���, �ּ� �б�
	{
		name = in.readUTF();
		major = in.readUTF();
		classNum = in.readUTF();
		birthday = in.readUTF();
		email = in.readUTF();
		address = in.readUTF();
		
	}
	
	
	@Override
	//toString �޼ҵ� ������
	public String toString() {
		return "�̸� : " + name + "���� : " + major + "�й� : " + classNum + "���� : " + birthday + "�̸��� : " +
			       email + "�ּ� : " + address;
	}

}