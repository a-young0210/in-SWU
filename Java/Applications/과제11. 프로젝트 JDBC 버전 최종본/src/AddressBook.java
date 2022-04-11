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

	public AddressBook() throws Exception {// UI���� ������ ����� �� �����ͼ� ��ü ����
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/addressbookdb", "root", "1234");
			stmt = conn.createStatement();
	}
	
	public int getCount() throws Exception {
		rs= stmt.executeQuery("select count(*)from addressbook;");
		rs.next();
		
		//�� ���� �о index ������ ����
		index = rs.getInt(1);

		rs.close();
		
		return index;
	}

	// �ּҷ� ��� �޼ҵ�
	public void add(Person P) throws Exception {
		stmt.executeUpdate(
				"insert into addressbook (num, name, phonenum,  address, email) values('" + getCount() + "' , '" +
						P.getName() + "', '" + P.getPhoneNum() + "', '" + P.getAddress() + "', '" + P.getEmail() + "');");

	}
	
	//�������� Ȯ�� �޼ҵ�
	public boolean checkName(String sname) throws SQLException {
       	//table�� name�� ���� ���� �ִ��� Ȯ��
		rs = stmt.executeQuery("select * from addressbook where name ='" + sname + "';");

		//�ش� ���̺��� ���ٸ�
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

	// ��ϵ� ��ȭ��ȣ�� �ִ��� Ȯ�� �޼ҵ�
	public boolean checkPhoneNum(String sphoneNum) throws Exception {
		//table�� phonenum�� ���� ���� �ִ��� Ȯ��
		rs = stmt.executeQuery("select * from addressbook where phonenum ='" + sphoneNum + "';");

		//�ش� ���̺��� ���ٸ�
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
	
	// �̸��� �̿��� �˻�
	public int searchName(String sname) throws Exception {
	      //sname ���� ������ �ִ� �� �ҷ���
	      rs= stmt.executeQuery("select * from addressbook where name like '%" + sname + "%';");

	      rs.next();

	      int sindex = rs.getInt("num");
	      
	      rs.close();
	      
	      return sindex;
	   }

	// �ּҷ� ���� �޼ҵ�
	public void modify(int sindex, Person p) throws Exception {
		stmt.executeUpdate("update addressbook set name:='" + p.getName() + "', phonenum:='" + p.getPhoneNum() + 
				"', address:='" + p.getAddress() + "', email:='" + p.getEmail() + "' where num = '" + sindex + "';");
	}

	// �ּҷ� ���� �޼ҵ�
	public void delete(int sindex) throws Exception {
		stmt.executeUpdate("delete from addressbook where num = '" + sindex + "';");
		for(int i = sindex; i < getCount(); i++)
		{
			//������ �� �� ����� num ��ĭ�� ������ ����
			int count = i + 1;
			stmt.executeUpdate ("update addressbook set num = '"+ i + "' where num = '"+ count +"';");
		
		}
	}

//	 Person ��ü �Ѱ��ִ� �޼ҵ�
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
			return p; // index�� �ش��ϴ� ��ü�� �����Ѵ�.
		} catch (SQLException se) {
			se.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		throw new Exception("��ϵ� name ����");
	}


	public void disconnect(ResultSet rs, Statement stmt, Connection conn) throws Exception {

		stmt.close(); // statement �ݱ� 
		conn.close(); // DB ���� ���� 
	}
}
