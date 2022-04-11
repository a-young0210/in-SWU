import java.io.*;
import java.util.ArrayList;

@SuppressWarnings("unused")

/* ���α׷� �̸� : AddressBook.java
���α׷� ���� : Ŭ���� AddressBook ���� ���α׷�
�ۼ��� : 2020-09-08
�ۼ��� :  */

public class AddressBook {
	ObjectOutputStream fOut=null; //���� ���� ������ write�� ���̴� ���� fOut
	private ArrayList<Person> people;	
	
	public AddressBook(int num) throws Exception {//UI���� ������ ����� �� �����ͼ� ��ü ����
		people=new ArrayList<Person>(num);
	}
	
	public AddressBook(int num, ObjectInputStream fn) throws Exception {//UI���� ������ ����� �� �����ͼ� ��ü ����
		people=new ArrayList<Person>(num);
		
		try {
			readFile(fn);
		}
		catch (IOException e) {
			throw new IOException("IOException");
		}catch(NullPointerException e) {
			throw new IOException("NullPointerException");
		}
	}

	public int getCount(){	//��ϵ� ��� �� ������
		return people.size();
	}
	
	//�������� Ȯ�� �޼ҵ�
	public boolean checkName(String name) {
		for (Person p : people) {
			if(name.equals(p.getName()))
				return true;
		}
		return false;
	}
	
	//��ϵ� ��ȭ��ȣ�� �ִ��� Ȯ�� �޼ҵ�
	public boolean checkPhoneNum(String phoneNum) {
		for (Person p : people) {
			if(phoneNum.equals(p.getPhoneNum())) 
				return true;
		}
		return false;
	}	
	
	//�ּҷ� ��� �޼ҵ�
	public void add(Person P)throws Exception{ 
		try{
			
			people.add(P);
			
		}catch (Exception e) {
			throw new ArrayIndexOutOfBoundsException("add �Ұ�");
		}
	}	


	//�̸����� �ּҷ� ��ȣ �˻� �޼ҵ�, ��ϵ� �̸� ���� ��� �ͼ��� 
	public int searchName(String name) throws Exception{
		
		int count = people.size();
		
		for(int i=0;i<count;i++){
			if(name.equals(people.get(i).getName())){//��ϵ� �̸� ���� ��, ȸ����ȣ(�ε��� ��ȣ)����
				return i;
			}	
		}
		throw new Exception("��ϵ� name ����");
		
	}	

	//��ȭ��ȣ�� �ּҷ� ��ȣ �˻� �޼ҵ�, ��ϵ� ��ȭ��ȣ ���� ��� �ͼ��� 
	public int searchPhoneNum(String phoneNum)throws Exception{
		int count = people.size();
		
		for(int i=0;i<count;i++){
			if(phoneNum.equals(people.get(i).getPhoneNum())){//��ϵ� ��ȭ��ȣ ���� ��, ȸ����ȣ(�ε��� ��ȣ)����
				return i;
			}	
		}
		throw new Exception("��ϵ� phoneNum ����");
	}

	//�ּҷ� ���� �޼ҵ�
	public void modify(int index, Person P){
		people.set(index, P);
	}

	//�ּҷ� ���� �޼ҵ�
	public void delete(int index){
		people.remove(index);
	}

	//Person ��ü �Ѱ��ִ� �޼ҵ�
	public Person getPerson(int index){
		return people.get(index);
	}
	
	//�����͸� ���Ͽ� �����ϴ� �޼ҵ�
	public void writeFile(ObjectOutputStream fn) throws Exception{
		try {
			int count = people.size();
			fn.writeInt(count); //��ϵ� ��� �� ���Ͽ� ����
			for(int i=0;i<count;i++){
				try {
				//���Ͽ� write
					fn.writeObject(people);
				}catch(Exception e) {
					throw new Exception("writeFile Exception");
				}
			} 

		} catch (IOException ioe) {
			throw new IOException("IOException");
		}		
	}	
	
	//�����͸� ���Ͽ��� �������� �޼ҵ�
	//�ڷ����� ���� read�Լ��� �ٸ��� ���
	@SuppressWarnings("unchecked")
	public void readFile(ObjectInputStream fn) throws Exception{
		try {
			int count = fn.readInt(); //��ϵ� ��� �� �����ͼ� count ������ �ֱ�
			for(int i = 0; i<count; i++) {
				//read�� ������ ������ Person��ü ����
				
				try { //people�� ���
					people = (ArrayList<Person>)fn.readObject();
					
				}catch(Exception e) {
					throw new Exception("readFile Exception");
				} 
			} fn.close();
		}catch (EOFException eofe) {
			throw new Exception("EOFException");
		}catch (IOException ioe) {
			throw new IOException("IOException");
		}
	}
}
