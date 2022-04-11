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
		
		//��� â ���̺� �� �з� ����
		static String colNames[] = {"�̸�", "��ȭ��ȣ", "�ּ�", "�̸��� �ּ�"};
		static Object data[][] = {};
		
		//���̺� ����
		static DefaultTableModel model = new DefaultTableModel(data, colNames);
		
		
		@SuppressWarnings("unused")
		GUI() {
			//������ ����
			JFrame frame = new JFrame("��ȭ��ȣ��");
			//x��ư ������ �� close �ǵ���
			frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
			//contentpane ����
			Container contentPane = frame.getContentPane();
			//������ ũ�� ����
			frame.setPreferredSize(new Dimension(850, 500));
			
			//��� ���̺� �÷��� �г� ����
			JPanel jp3 = new JPanel();
			jp3.setLayout(new GridLayout(4,1));
			jp3.setSize(80, 120);
			jp3.setLocation(460, 150);
			
			//��� ���̺� ����
			JTable table = new JTable(model);
		    JScrollPane jsc = new JScrollPane(table);
		    contentPane.add(jsc,BorderLayout.CENTER);
		      
		    //jp2�� jp1 �÷��� �г� ����
		    JPanel Right = new JPanel();
		    frame.getContentPane().add(Right, BorderLayout.SOUTH);
		    Right.setLayout(new GridLayout(2, 0, 0, 0));
		      
		    //���� ���� �ּҷ� �Է��ϴ� �г� ����
		    JPanel jp2 = new JPanel();
		    Right.add(jp2, BorderLayout.NORTH);
		    jp2.setLayout(new GridLayout(4,1));
		      
		    //�Է� �տ� ���� ���̺� ����
		    JLabel jl1 = new JLabel("��      ��");
		    jl1.setHorizontalAlignment(SwingConstants.CENTER);
		    JLabel jl2 = new JLabel("��ȭ��ȣ");
		    jl2.setHorizontalAlignment(SwingConstants.CENTER);
		    JLabel jl3 = new JLabel("��       ��");
		    jl3.setHorizontalAlignment(SwingConstants.CENTER);
		    JLabel jl4 = new JLabel("��  ��  ��");
		    jl4.setHorizontalAlignment(SwingConstants.CENTER);
		      
		    //�Է��� �ؽ�Ʈ�ʵ� ����
		    jf1 = new JTextField();
		    jf2 = new JTextField();
		    jf3 = new JTextField();
		    jf4 = new JTextField();
		      
		    //jp2 �гο� ������ ���̺�� �ؽ�Ʈ�ʵ� add
		    jp2.add(jl1);
		    jp2.add(jf1);
		    jp2.add(jl2);
		    jp2.add(jf2);
		    jp2.add(jl3);
		    jp2.add(jf3);
		    jp2.add(jl4);
		    jp2.add(jf4);
		      
		    setSize(900, 350);
		    
		    //�׺���̼� �ø� �г� ����
		    JPanel jp1 = new JPanel();
		    Right.add(jp1, BorderLayout.SOUTH);
		    jp1.setLayout(new GridLayout(2,4));
		      
		    //�׺���̼� ��ư ����
		    jb1 = new JButton("���");
		    jb2 = new JButton("�˻�");
		    jb3 = new JButton("����");
		    jb4 = new JButton("����");
		    jb5 = new JButton("��ȸ");
		    jb6 = new JButton("����");
		    jb7 = new JButton("����");
		    jb8 = new JButton("���� �� ����");
		      
		    //jp1 �гο� ������ ��ư add
		    jp1.add(jb1);
		    jp1.add(jb2);
		    jp1.add(jb3);
		    jp1.add(jb4);
		    jp1.add(jb5);
		    jp1.add(jb6);
		    jp1.add(jb7);
		    jp1.add(jb8);
		    
		 
		    //��� ��ư listener�� ����
		    jb1.addActionListener (new ActionListener() {
		    	 
		     @Override
		    	 public void actionPerformed(ActionEvent e) {
		    	 
		    	 //�Է��� �ؽ�Ʈ�ʵ忡�� ���� �޾ƿ���
		    	 String name = jf1.getText();
		    	 String phoneNum = jf2.getText();
		    	 String address = jf3.getText();
		    	 String email = jf4.getText();	
		    	 
		    	 //rows �迭�� name,phoneNum,address,email �Է�
		    	 String rows[] = {name, phoneNum, address, email};
		    		 
		    	 //rows �迭�� ������ �� clear ���ֱ�
		    	 jf1.setText("");
		    	 jf2.setText("");
		    	 jf3.setText("");
		    	 jf4.setText("");
		    		 

		    	 try {
		    		 ad.add(new Person(name,phoneNum,address,email));	//�ּҷ� ��� �޼ҵ�
		    	 } catch (Exception e1) {
		    		 System.out.println("��� ���� �ο� ���� �ʰ��Ǿ����ϴ�.");			
		    	 }
			
		    	 model.addRow(rows);
		     }
		    });
		    //������ ���̵���
		    frame.setVisible(true);
	}

	//main
	public static void main(String[] args) throws Exception
	{
		ad = new AddressBook(100);
		new GUI();
		
	}
}
