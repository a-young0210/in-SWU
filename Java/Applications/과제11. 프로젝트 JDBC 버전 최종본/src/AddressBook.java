import java.awt.Component;
import java.io.*;
import java.sql.*;
import java.util.ArrayList;

import javax.swing.JOptionPane;

@SuppressWarnings("unused")

public class AddressBook {
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	int index = 0;

	public AddressBook() throws Exception {// UI에서 생성할 사람의 수 가져와서 객체 생성
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/addressbookdb", "root", "1234");
			stmt = conn.createStatement();
	}
	
	public int getCount() throws Exception {
		rs= stmt.executeQuery("select count(*)from addressbook;");
		rs.next();
		
		//행 개수 읽어서 index 변수에 저장
		index = rs.getInt(1);

		rs.close();
		
		return index;
	}

	// 주소록 등록 메소드
	public void add(Person P) throws Exception {
		stmt.executeUpdate(
				"insert into addressbook (num, name, phonenum,  address, email) values('" + getCount() + "' , '" +
						P.getName() + "', '" + P.getPhoneNum() + "', '" + P.getAddress() + "', '" + P.getEmail() + "');");

	}
	
	//동명이인 확인 메소드
	public boolean checkName(String sname) throws SQLException {
       	//table의 name과 같은 값이 있는지 확인
		rs = stmt.executeQuery("select * from addressbook where name ='" + sname + "';");

		//해당 테이블이 없다면
		if(!rs.next())
		{
			rs.close();
			return false;
		}
		else {
			rs.close();
			return true;
		}
		
		
	}

	// 등록된 전화번호가 있는지 확인 메소드
	public boolean checkPhoneNum(String sphoneNum) throws Exception {
		//table의 phonenum과 같은 값이 있는지 확인
		rs = stmt.executeQuery("select * from addressbook where phonenum ='" + sphoneNum + "';");

		//해당 테이블이 없다면
		if(!rs.next())
		{
			rs.close();
			return false;
		}
		else {
			rs.close();
			return true;
		}
	}
	
	// 이름을 이용한 검색
	public int searchName(String sname) throws Exception {
	      //sname 값을 가지고 있는 행 불러옴
	      rs= stmt.executeQuery("select * from addressbook where name like '%" + sname + "%';");

	      rs.next();

	      int sindex = rs.getInt("num");
	      
	      rs.close();
	      
	      return sindex;
	   }

	// 주소록 수정 메소드
	public void modify(int sindex, Person p) throws Exception {
		stmt.executeUpdate("update addressbook set name:='" + p.getName() + "', phonenum:='" + p.getPhoneNum() + 
				"', address:='" + p.getAddress() + "', email:='" + p.getEmail() + "' where num = '" + sindex + "';");
	}

	// 주소록 삭제 메소드
	public void delete(int sindex) throws Exception {
		stmt.executeUpdate("delete from addressbook where num = '" + sindex + "';");
		for(int i = sindex; i < getCount(); i++)
		{
			//삭제한 행 의 행들의 num 한칸씩 앞으로 당기기
			int count = i + 1;
			stmt.executeUpdate ("update addressbook set num = '"+ i + "' where num = '"+ count +"';");
		
		}
	}

//	 Person 객체 넘겨주는 메소드
	public Person getPerson(int sindex) throws Exception {
		int i = -1;
		String name = null, phoneNumber = null, address = null, email = null;
		try {
			rs = stmt.executeQuery("select * from addressbook where num='" + sindex + "'");

			while (rs.next()) {
				i = rs.getInt("num");
				name = rs.getString("name");
				phoneNumber = rs.getString("phoneNum");
				address = rs.getString("address");
				email = rs.getString("email");
			}
			Person p = new Person(name, phoneNumber, address, email);
			return p; // index에 해당하는 객체를 리턴한다.
		} catch (SQLException se) {
			se.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		throw new Exception("등록된 name 없음");
	}


	public void disconnect(ResultSet rs, Statement stmt, Connection conn) throws Exception {

		stmt.close(); // statement 닫기 
		conn.close(); // DB 연결 끊기 
	}
}
