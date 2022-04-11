import java.io.*;
import java.sql.*;
import java.util.ArrayList;

import javax.swing.JOptionPane;

@SuppressWarnings("unused")

public class AddressBook {
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;

	int count;	


	public AddressBook() throws Exception {// UI에서 생성할 사람의 수 가져와서 객체 생성
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/addressbookdb", "root", "1234");
			stmt = conn.createStatement();
		} catch (SQLException se) {
		}
	}

	public int getCount() throws Exception { 
		try {
			rs = stmt.executeQuery("select * from addressbook;");
			rs.last(); 
			count = rs.getRow(); 
		} catch (SQLException se) {
			
		}
		return count;
	}

	// 주소록 등록 메소드
	public void add(Person P) throws Exception {
		try {
			
			stmt.executeQuery("insert into addressbook(name,phoneNum,address,email) values('"
					+ P.getName() + "','" + P.getPhoneNum() + "','" + P.getAddress() + "','" + P.getEmail() + "');");

		} catch (SQLException e) {
			e.printStackTrace();
		}
		disconnect(rs, stmt, conn);

	}
	// 등록된 전화번호가 있는지 확인 메소드
		public boolean checkPhoneNum(String phoneNum) throws Exception {

			try {

				rs = stmt.executeQuery("select * from addressbook where phoneNum='" + phoneNum + "'");

				if (rs.next()) {
					return true;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}

			return false;
		}
		
	// 이름으로 주소록 번호 검색 메소드
	public int searchName(String name) throws Exception {
		try {

			int i = -1;
			String name1 = null, phoneNumber = null, address = null, email = null;
			rs = stmt.executeQuery("select * from addressbook where name='" + name + "'");
			while (rs.next()) {
				i = rs.getInt("num");
			}
			return i;
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}

		disconnect(rs, stmt, conn);
		throw new Exception("등록된 name 없음");
	}


	// 주소록 수정 메소드
	public void modify(int index, Person p) throws Exception {
		try {

			rs = stmt.executeQuery("update addressbook set name='" + p.getName() + "' where num='" + index + "'");
			rs = stmt.executeQuery("update addressbook set phoneNum='" + p.getPhoneNum() + "' where num='" + index + "'");
			rs = stmt.executeQuery("update addressbook set address='" + p.getAddress() + "' where num='" + index + "'");
			rs = stmt.executeQuery("update addressbook set email='" + p.getEmail() + "' where num='" + index + "'");

		} finally {
			disconnect(rs, stmt, conn);
		}
	}

	// 주소록 삭제 메소드
	public void delete(int index) throws Exception {
		try {

			rs = stmt.executeQuery("delete from addressbook where num='" + index + "'");		
			rs.last();
			int count = getCount();
		for(int i= count; count >= index; count--) {	
			rs = stmt.executeQuery("update addressbook set num='" + count + "' where num='" + (count+1) + "'" );
		}
		 
		} finally {
			disconnect(rs, stmt, conn);
		}
	}

//	 Person 객체 넘겨주는 메소드
	public Person getPerson(int index) throws Exception {
		int i = -1;
		String name = null, phoneNumber = null, address = null, email = null;
		try {
			rs = stmt.executeQuery("select * from addressbook where num='" + index + "'");

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

		if (rs != null)
			try {
				rs.close();
			} catch (SQLException sqle) {
			}
		if (stmt != null)
			try {
				stmt.close();
			} catch (SQLException sqle) {
			}
		// 커넥션 풀로 반납
		if (conn != null)
			try {
				conn.close();
			} catch (SQLException sqle) {
			}
	}

}
