public class Human {		//Ŭ���� Human ����
	String name;			//�ʵ� ����
	int age;
	
	Human(String name, int age) {	//������ �ۼ�
		this.name = name;			//�Է� ������ �ʵ� �� �ʱ�ȭ
		this.age = age;
	}
	
	public void  setName(String name)		//name ������
	{
		this.name = name;
	}
	
	public void  setAge(int age)			//age ������
	{
		this.age = age;
	}
	
	public   String getName( )			//name ������
	{
		return name;
	}
	
	public   int getAge( )				//age ������
	{
		return age;
	}
	
	//toString()�޼ҵ� ������
	public String toString() {
	
		 return  " �̸� : " + name + " ���� : " + age;
	
	}
}