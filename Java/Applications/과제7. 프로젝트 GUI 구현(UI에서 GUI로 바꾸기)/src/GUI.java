import javax.swing.*;
import javax.swing.event.*;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableModel;

import java.awt.*;
import java.awt.event.*;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.*;
import java.awt.Window.Type;
import java.awt.Dialog.ModalExclusionType;


	@SuppressWarnings("serial")
	public class GUI extends JFrame 
	{	
		Person p;
		static AddressBook ad = null;
		
		
		JButton jb1, jb2, jb3, jb4, jb5, jb6, jb7, jb8;
		static JTextField jf1;
		static JTextField jf2;
		static JTextField jf3;
		static JTextField jf4;
		@SuppressWarnings("unused")
		private JPanel panel;
		
		//결과 창 테이블 위 분류 기준
		static String colNames[] = {"이름", "전화번호", "주소", "이메일 주소"};
		static Object data[][] = {};
		
		//테이블 구성
		static DefaultTableModel model = new DefaultTableModel(data, colNames);
		
		
		@SuppressWarnings("unused")
		GUI() {
			//프레임 생성
			JFrame frame = new JFrame("전화번호부");
			//x버튼 눌렀을 때 close 되도록
			frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
			//contentpane 생성
			Container contentPane = frame.getContentPane();
			//프레임 크기 지정
			frame.setPreferredSize(new Dimension(850, 500));
			
			//결과 테이블 올려둘 패널 생성
			JPanel jp3 = new JPanel();
			jp3.setLayout(new GridLayout(4,1));
			jp3.setSize(80, 120);
			jp3.setLocation(460, 150);
			
			//결과 테이블 생성
			JTable table = new JTable(model);
		    JScrollPane jsc = new JScrollPane(table);
		    contentPane.add(jsc,BorderLayout.CENTER);
		      
		    //jp2와 jp1 올려둘 패널 생성
		    JPanel Right = new JPanel();
		    frame.getContentPane().add(Right, BorderLayout.SOUTH);
		    Right.setLayout(new GridLayout(2, 0, 0, 0));
		      
		    //새로 만들 주소록 입력하는 패널 생성
		    JPanel jp2 = new JPanel();
		    Right.add(jp2, BorderLayout.NORTH);
		    jp2.setLayout(new GridLayout(4,1));
		      
		    //입력 앞에 적힐 레이블 생성
		    JLabel jl1 = new JLabel("이      름");
		    jl1.setHorizontalAlignment(SwingConstants.CENTER);
		    JLabel jl2 = new JLabel("전화번호");
		    jl2.setHorizontalAlignment(SwingConstants.CENTER);
		    JLabel jl3 = new JLabel("주       소");
		    jl3.setHorizontalAlignment(SwingConstants.CENTER);
		    JLabel jl4 = new JLabel("이  메  일");
		    jl4.setHorizontalAlignment(SwingConstants.CENTER);
		      
		    //입력할 텍스트필드 생성
		    jf1 = new JTextField();
		    jf2 = new JTextField();
		    jf3 = new JTextField();
		    jf4 = new JTextField();
		      
		    //jp2 패널에 생성한 레이블과 텍스트필드 add
		    jp2.add(jl1);
		    jp2.add(jf1);
		    jp2.add(jl2);
		    jp2.add(jf2);
		    jp2.add(jl3);
		    jp2.add(jf3);
		    jp2.add(jl4);
		    jp2.add(jf4);
		      
		    setSize(900, 350);
		    
		    //네비게이션 올릴 패널 생성
		    JPanel jp1 = new JPanel();
		    Right.add(jp1, BorderLayout.SOUTH);
		    jp1.setLayout(new GridLayout(2,4));
		      
		    //네비게이션 버튼 생성
		    jb1 = new JButton("등록");
		    jb2 = new JButton("검색");
		    jb3 = new JButton("수정");
		    jb4 = new JButton("삭제");
		    jb5 = new JButton("조회");
		    jb6 = new JButton("저장");
		    jb7 = new JButton("종료");
		    jb8 = new JButton("저장 후 종료");
		      
		    //jp1 패널에 생성한 버튼 add
		    jp1.add(jb1);
		    jp1.add(jb2);
		    jp1.add(jb3);
		    jp1.add(jb4);
		    jp1.add(jb5);
		    jp1.add(jb6);
		    jp1.add(jb7);
		    jp1.add(jb8);
		    
		 
		    //등록 버튼 listener로 연결
		    jb1.addActionListener (new ActionListener() {
		    	 
		     @Override
		    	 public void actionPerformed(ActionEvent e) {
		    	 
		    	 //입력한 텍스트필드에서 각각 받아오기
		    	 String name = jf1.getText();
		    	 String phoneNum = jf2.getText();
		    	 String address = jf3.getText();
		    	 String email = jf4.getText();	
		    	 
		    	 //rows 배열에 name,phoneNum,address,email 입력
		    	 String rows[] = {name, phoneNum, address, email};
		    		 
		    	 //rows 배열에 저장한 후 clear 해주기
		    	 jf1.setText("");
		    	 jf2.setText("");
		    	 jf3.setText("");
		    	 jf4.setText("");
		    		 

		    	 try {
		    		 ad.add(new Person(name,phoneNum,address,email));	//주소록 등록 메소드
		    	 } catch (Exception e1) {
		    		 System.out.println("등록 가능 인원 수가 초과되었습니다.");			
		    	 }
			
		    	 model.addRow(rows);
		     }
		    });
		    //프레임 보이도록
		    frame.setVisible(true);
	}

	//main
	public static void main(String[] args) throws Exception
	{
		ad = new AddressBook(100);
		new GUI();
		
	}
}
