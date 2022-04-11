import java.io.*;
import java.util.ArrayList;

@SuppressWarnings("unused")

/* 프로그램 이름 : AddressBook.java
프로그램 설명 : 클래스 AddressBook 정의 프로그램
작성일 : 2020-09-08
작성자 :  */

public class AddressBook {
	ObjectOutputStream fOut=null; //파일 관리 변수중 write에 쓰이는 변수 fOut
	private ArrayList<Person> people;	
	
	public AddressBook(int num) throws Exception {//UI에서 생성할 사람의 수 가져와서 객체 생성
		people=new ArrayList<Person>(num);
	}
	
	public AddressBook(int num, ObjectInputStream fn) throws Exception {//UI에서 생성할 사람의 수 가져와서 객체 생성
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

	public int getCount(){	//등록된 사람 수 접근자
		return people.size();
	}
	
	//동명이인 확인 메소드
	public boolean checkName(String name) {
		for (Person p : people) {
			if(name.equals(p.getName()))
				return true;
		}
		return false;
	}
	
	//등록된 전화번호가 있는지 확인 메소드
	public boolean checkPhoneNum(String phoneNum) {
		for (Person p : people) {
			if(phoneNum.equals(p.getPhoneNum())) 
				return true;
		}
		return false;
	}	
	
	//주소록 등록 메소드
	public void add(Person P)throws Exception{ 
		try{
			
			people.add(P);
			
		}catch (Exception e) {
			throw new ArrayIndexOutOfBoundsException("add 불가");
		}
	}	


	//이름으로 주소록 번호 검색 메소드, 등록된 이름 없을 경우 익셉션 
	public int searchName(String name) throws Exception{
		
		int count = people.size();
		
		for(int i=0;i<count;i++){
			if(name.equals(people.get(i).getName())){//등록된 이름 있을 때, 회원번호(인덱스 번호)리턴
				return i;
			}	
		}
		throw new Exception("등록된 name 없음");
		
	}	

	//전화번호로 주소록 번호 검색 메소드, 등록된 전화번호 없을 경우 익셉션 
	public int searchPhoneNum(String phoneNum)throws Exception{
		int count = people.size();
		
		for(int i=0;i<count;i++){
			if(phoneNum.equals(people.get(i).getPhoneNum())){//등록된 전화번호 있을 때, 회원번호(인덱스 번호)리턴
				return i;
			}	
		}
		throw new Exception("등록된 phoneNum 없음");
	}

	//주소록 수정 메소드
	public void modify(int index, Person P){
		people.set(index, P);
	}

	//주소록 삭제 메소드
	public void delete(int index){
		people.remove(index);
	}

	//Person 객체 넘겨주는 메소드
	public Person getPerson(int index){
		return people.get(index);
	}
	
	//데이터를 파일에 저장하는 메소드
	public void writeFile(ObjectOutputStream fn) throws Exception{
		try {
			int count = people.size();
			fn.writeInt(count); //등록된 사람 수 파일에 저장
			for(int i=0;i<count;i++){
				try {
				//파일에 write
					fn.writeObject(people);
				}catch(Exception e) {
					throw new Exception("writeFile Exception");
				}
			} 

		} catch (IOException ioe) {
			throw new IOException("IOException");
		}		
	}	
	
	//데이터를 파일에서 가져오는 메소드
	//자료형에 따라 read함수를 다르게 사용
	@SuppressWarnings("unchecked")
	public void readFile(ObjectInputStream fn) throws Exception{
		try {
			int count = fn.readInt(); //등록된 사람 수 가져와서 count 변수에 넣기
			for(int i = 0; i<count; i++) {
				//read한 정보를 저장할 Person객체 생성
				
				try { //people에 담기
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
