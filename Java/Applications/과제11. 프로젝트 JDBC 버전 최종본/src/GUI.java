import javax.swing.*;
import javax.swing.event.*;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableModel;

import java.awt.*;
import java.awt.event.*;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;
import java.awt.Window.Type;
import java.awt.Dialog.ModalExclusionType;


	@SuppressWarnings("serial")
	public class GUI extends JFrame 
	{	
		Person p;
		static AddressBook ad = null;

		JButton addButton, searchNmodifyButton, deleteButton, searchButton, modify1Button, modify2Button, loadButton;
		static JTextField nameField;
		static JTextField phonenumField;
		static JTextField addressField;
		static JTextField emailField;
		JTextField smnameField;
		@SuppressWarnings("unused")
		private JPanel panel;
	
		
		//���̺��� ����� ���� �����͵�
		static String colNames[] = {"�̸�", "��ȭ��ȣ", "�ּ�", "�̸��� �ּ�"};
		static Object data[][] = {};
				
		//���̺� ����
		static DefaultTableModel model = new DefaultTableModel(data, colNames);
		
		@SuppressWarnings("unused")
		GUI() throws Exception {
			//������ ����
			JFrame frame = new JFrame("��ȭ��ȣ��");
			//x��ư ������ �� close �ǵ���
			frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
			//contentpane ����
			Container contentPane = frame.getContentPane();
			//������ ũ�� ����
			frame.setPreferredSize(new Dimension(850, 500));
			
			//��� ���̺� �÷��� �г� ����
			JPanel tablePanel = new JPanel();
			tablePanel.setLayout(new GridLayout(4,1));
			tablePanel.setSize(80, 120);
			tablePanel.setLocation(460, 150);
			
			//��� ���̺� ����
			JTable table = new JTable(model);
		    JScrollPane jsc = new JScrollPane(table);
		    contentPane.add(jsc,BorderLayout.CENTER);
		      
		    //inputPanel�� naviPanel �÷��� �г� ����
		    JPanel South = new JPanel();
		    frame.getContentPane().add(South, BorderLayout.SOUTH);
		    South.setLayout(new GridLayout(2, 0, 0, 0));
		      
		    //���� ���� �ּҷ� �Է��ϴ� �г� ����
		    JPanel inputPanel = new JPanel();
		    South.add(inputPanel, BorderLayout.NORTH);
		    inputPanel.setLayout(new GridLayout(4,1));
		      
		    //�Է� �տ� ���� ���̺� ����
		    JLabel nameLabel = new JLabel("��      ��");
		    nameLabel.setHorizontalAlignment(SwingConstants.CENTER);
		    JLabel phonenumLabel = new JLabel("��ȭ��ȣ");
		    phonenumLabel.setHorizontalAlignment(SwingConstants.CENTER);
		    JLabel addressLabel = new JLabel("��       ��");
		    addressLabel.setHorizontalAlignment(SwingConstants.CENTER);
		    JLabel emailLabel = new JLabel("��  ��  ��");
		    emailLabel.setHorizontalAlignment(SwingConstants.CENTER);
		      
		    //�Է��� �ؽ�Ʈ�ʵ� ����
		    nameField = new JTextField();
		    phonenumField = new JTextField();
		    addressField = new JTextField();
		    emailField = new JTextField();
		      
		    //jp2 �гο� ������ ���̺�� �ؽ�Ʈ�ʵ� add
		    inputPanel.add(nameLabel);
		    inputPanel.add(nameField);
		    inputPanel.add(phonenumLabel);
		    inputPanel.add(phonenumField);
		    inputPanel.add(addressLabel);
		    inputPanel.add(addressField);
		    inputPanel.add(emailLabel);
		    inputPanel.add(emailField);
		      
		    setSize(900, 350);
		    
		    //�׺���̼� �ø� �г� ����
		    JPanel naviPanel = new JPanel();
		    South.add(naviPanel, BorderLayout.SOUTH);
		    naviPanel.setLayout(new GridLayout(2,1));
		      
		    //�׺���̼� ��ư ����
		    addButton = new JButton("���");
		    searchNmodifyButton = new JButton("�˻�/����");
		    deleteButton = new JButton("����");
		    loadButton = new JButton("�ҷ�����");
		      
		    //jp1 �гο� ������ ��ư add
		    naviPanel.add(addButton);
		    naviPanel.add(searchNmodifyButton);
		    naviPanel.add(deleteButton);
		    naviPanel.add(loadButton);
		    
		 
		    //��� ��ư listener�� ����
		    addButton.addActionListener (new ActionListener() {
		    	 
		     @Override
		    	 public void actionPerformed(ActionEvent e) {
		    	 String name = nameField.getText();
		    	 do { //(do-while)�̸� ��ġ�� �ʰ� �Է��ϰ� �ϴ� �ڵ�
		    		 if(name.equals("")) {
		    			 JOptionPane.showMessageDialog(null, "�̸��� �Է����ּ���", "����",JOptionPane.WARNING_MESSAGE);
		    			 return;
		    		 }
		    		 try {
						if(ad.checkName(name)==true) {
							JOptionPane.showMessageDialog(null, "�̹� ��ϵ� �̸��Դϴ�. �̸� �ڿ� ���ڸ� �ٿ� �����ϼ���. (ex: ��ƿ�1, ��ƿ�2 , ��ƿ�3)", "����",JOptionPane.WARNING_MESSAGE);
							nameField.setText("");
							return;
						 }
						 else break;
					} catch (SQLException e1) {
						e1.printStackTrace();
					}
					}while(true);
		    	 
		    	 String phoneNum = phonenumField.getText();
		    	 do {
		    		 try {
						if(ad.checkPhoneNum(phoneNum)==true) { //���� ��ϵ� ��ȭ��ȣ�� ��� �޴��� ���ư��� ��
							JOptionPane.showMessageDialog(null, "�̹� ��ϵ� ��ȭ��ȣ �Դϴ�.", "����",JOptionPane.WARNING_MESSAGE);
							phonenumField.setText("");
							return;
						}
						else break;
					} catch (Exception e1) {
						e1.printStackTrace();
					}
		    	 	}while(true);

				 String address = addressField.getText();
			     String email = emailField.getText();	
			    	
			      //rows �迭�� name,phoneNum,address,email �Է�
			     String rows[] = {name, phoneNum, address, email};
			    	
			     //rows �迭�� ������ �� clear ���ֱ�
			     nameField.setText("");
			     phonenumField.setText("");
			     addressField.setText("");
			     emailField.setText("");
			     
				try { 
					ad.add(new Person(name, phoneNum,address,email));	//�ּҷ� ��� �޼ҵ�
				}catch (Exception e1) {
					JOptionPane.showMessageDialog(null, "��� ���� �ο� ���� �ʰ��Ͽ����ϴ�.", "����",JOptionPane.WARNING_MESSAGE);
					return;
				}
			model.addRow(rows);
					
		     }	
		    });
			
		    
		    //�˻�/���� ��ư listener�� ����
		    searchNmodifyButton.addActionListener (new ActionListener() {
		    	 
		     @Override
		    	public void actionPerformed(ActionEvent e) {
		    	//�˻� �г� ����
		    	//������ ����
				JFrame searchframe = new JFrame("�˻� �� ����");
				//x��ư ������ �� close �ǵ���
				searchframe.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
				//contentpane ����
				Container contentPane = searchframe.getContentPane();
					
				JPanel searchPanel = new JPanel();
				searchframe.getContentPane().add(searchPanel, BorderLayout.SOUTH);
				searchPanel.setLayout(new GridLayout(2, 0, 0, 0));
				 
		    	 JLabel nameLabel = new JLabel("��      ��");
		    	 nameLabel.setHorizontalAlignment(SwingConstants.CENTER);
		    	 smnameField = new JTextField();
		    	 JButton searchButton = new JButton("�˻�");
		    	 searchButton.setHorizontalAlignment(SwingConstants.CENTER);
		    	 JButton modify1Button = new JButton("����");
		    	 modify1Button.setHorizontalAlignment(SwingConstants.CENTER);
				    
		    	 searchPanel.add(nameLabel);
		    	 searchPanel.add(smnameField);
				 searchPanel.add(searchButton);
				 searchPanel.add(modify1Button);
				 
				 	//�˻� ��ư Ŭ�� ��
				 	searchButton.addActionListener (new ActionListener() {
				    	 
				 		@Override
				 		public void actionPerformed(ActionEvent e) {
				 			//������ ����
				 			JFrame resultframe = new JFrame("�˻�");
				 			//x��ư ������ �� close �ǵ���
				 			resultframe.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
				 			//contentpane ����
				 			Container contentPane = resultframe.getContentPane();	
								
				 			JPanel resultPanel = new JPanel();
				 			resultframe.getContentPane().add(resultPanel, BorderLayout.CENTER);
				 			resultPanel.setLayout(new GridLayout(4,0));
				
				 			String sname = smnameField.getText();
				 			if(sname.equals("")) {
				 				JOptionPane.showMessageDialog(null, "�̸��� �Է����ּ���", "����",JOptionPane.WARNING_MESSAGE);
				 				return;
				 			}
					    	 
				 			try {		
				 				int sindex=ad.searchName(sname);
				 				//���
				 				JLabel nameLabel = new JLabel("��      ��     :     " + ad.getPerson(sindex).getName());
				 				nameLabel.setHorizontalAlignment(SwingConstants.CENTER);
				 				JLabel phonenumLabel = new JLabel("��ȭ��ȣ     :     " + ad.getPerson(sindex).getPhoneNum());
				 				phonenumLabel.setHorizontalAlignment(SwingConstants.CENTER);
				 				JLabel addressLabel = new JLabel("��       ��     :     " + ad.getPerson(sindex).getAddress());
				 				addressLabel.setHorizontalAlignment(SwingConstants.CENTER);
				 				JLabel emailLabel = new JLabel("��  ��  ��     :    " + ad.getPerson(sindex).getEmail());
				 				emailLabel.setHorizontalAlignment(SwingConstants.CENTER);
				 				modify1Button.setHorizontalAlignment(SwingConstants.CENTER);
					    			
				 				resultPanel.add(nameLabel);
				 				resultPanel.add(phonenumLabel);
				 				resultPanel.add(addressLabel);
				 				resultPanel.add(emailLabel);
				 				resultPanel.add(modify1Button);
					    				  
				 			} catch (Exception e1) {
				 				JOptionPane.showMessageDialog(null, "��ϵ� �̸��� �����ϴ�. �ٽ� �Է��ϼ���.", "����",JOptionPane.WARNING_MESSAGE);
				 				nameField.setText("");
				 				return;
				 			}
					    	  
				 			resultframe.setVisible(true);
		
					
						//���� ��ư Ŭ�� ��
						modify1Button.addActionListener (new ActionListener() {
				    	 
					     @Override
					    	public void actionPerformed(ActionEvent e) {
					    	//������ ����
							JFrame modify1frame = new JFrame("����");
							//x��ư ������ �� close �ǵ���
							modify1frame.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
							//contentpane ����
							Container contentPane = modify1frame.getContentPane();
									
							JPanel modify1Panel = new JPanel();
							modify1frame.getContentPane().add(modify1Panel, BorderLayout.CENTER);
							modify1Panel.setLayout(new GridLayout(4,1));
					    	 
							//�Է� �տ� ���� ���̺� ����
				    		JLabel phonenumLabel = new JLabel("��ȭ��ȣ");
				    		phonenumLabel.setHorizontalAlignment(SwingConstants.CENTER);
				    		JLabel addressLabel = new JLabel("��       ��");
				    		addressLabel.setHorizontalAlignment(SwingConstants.CENTER);
				    		JLabel emailLabel = new JLabel("��  ��  ��");
				    		emailLabel.setHorizontalAlignment(SwingConstants.CENTER);
				    		JButton modify2Button = new JButton("����");
				    		modify2Button.setHorizontalAlignment(SwingConstants.CENTER);
				    		      
				    		//�Է��� �ؽ�Ʈ�ʵ� ����
				    		phonenumField = new JTextField();
				    		addressField = new JTextField();
				    		emailField = new JTextField();
				    		
				    		
				    		String sname = smnameField.getText();
				    		if(sname.equals("")) {
				    			 JOptionPane.showMessageDialog(null, "�̸��� �Է����ּ���", "����",JOptionPane.WARNING_MESSAGE);
				    			 return;
				    		 }
				    		      
				    		//modify �гο� ������ ���̺�� �ؽ�Ʈ�ʵ� add
				    		try {
				    		int sindex = ad.searchName(sname);
				    		modify1Panel.add(phonenumLabel);
				    		modify1Panel.add(phonenumField);
				    		modify1Panel.add(addressLabel);
				    		modify1Panel.add(addressField);
				    		modify1Panel.add(emailLabel);
				    		modify1Panel.add(emailField);
				    		modify1Panel.add(modify2Button, BorderLayout.EAST);
				    		} catch (Exception e1) {
								 JOptionPane.showMessageDialog(null, "��ϵ� �̸��� �����ϴ�. �ٽ� �Է��ϼ���.", "����",JOptionPane.WARNING_MESSAGE);
			    				 nameField.setText("");
			    				 return;
							 }
				    		
				    		modify1frame.setVisible(true);
				    		resultframe.setVisible(false);
				    		
				    		//���� ��ư Ŭ�� ��
							 modify2Button.addActionListener (new ActionListener() {
						    	 
							     @Override
							    	public void actionPerformed(ActionEvent e) {
							    	 	//������ ����
										JFrame modify2frame = new JFrame("����");
										//x��ư ������ �� close �ǵ���
										modify2frame.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
							    	 	//contentpane ����
										Container contentPane = modify2frame.getContentPane();	
										
										JPanel modify2Panel = new JPanel();
										modify2frame.getContentPane().add(modify2Panel, BorderLayout.CENTER);
										modify2Panel.setLayout(new GridLayout(4,2));
								
						    		    //�Է��� �ؽ�Ʈ�ʵ忡�� ���� �޾ƿ���
						    		    String newPhonenum = phonenumField.getText();
								    	 do {
								    		 try {
												if(ad.checkPhoneNum(newPhonenum)==true) { //���� ��ϵ� ��ȭ��ȣ�� ��� �޴��� ���ư��� ��
													JOptionPane.showMessageDialog(null, "�̹� ��ϵ� ��ȭ��ȣ �Դϴ�.", "����",JOptionPane.WARNING_MESSAGE);
													phonenumField.setText("");
													return;
												}
												else break;
											}  catch (SQLException e1) {
												e1.printStackTrace();
											} catch (Exception e1) {
												e1.printStackTrace();
											}
								    	 	}while(true);
								    	 
								    	 String newAddress = addressField.getText();
							    		 String newEmail = emailField.getText();	
							    		 
								    	 //rows �迭�� name,phoneNum,address,email �Է�
								    	String newRows[] = {smnameField.getText(), newPhonenum, newAddress, newEmail};
								    	
								    	 //rows �迭�� ������ �� clear ���ֱ�
								    	 nameField.setText("");
								    	 phonenumField.setText("");
								    	 addressField.setText("");
								    	 emailField.setText("");
								    	 
								    	 try {	
							    		  	int sindex = ad.searchName(smnameField.getText());
							    		  	p = new Person(smnameField.getText(), newPhonenum, newAddress, newEmail);
							    		  	model.removeRow(sindex);
								    		ad.modify(sindex,p); //�ּҷ� ����
								    		model.addRow(newRows);
								    		JOptionPane.showMessageDialog(null, "���������� �����Ǿ����ϴ�.", "�˸�",JOptionPane.WARNING_MESSAGE);
							    			 } catch (Exception e1) {
							    			 }
							    	  modify2frame.setVisible(false);
							    	  modify1frame.setVisible(false);
							    	  searchframe.setVisible(false);
							    	  return;
							     }
							 });
					     }
					 });
					
				}
		     });
				  searchframe.setVisible(true);	
		   }
		 });		
		    
		    //�ҷ����� ��ư listener�� ����
		    loadButton.addActionListener (new ActionListener() {			
		    	   
		   		public void actionPerformed(ActionEvent e) {

		   			//���̺� ����� �� ���� �ִٸ�?
		   			if(table.getRowCount()>0)
		   			{
		   				//�ش� ���̺� ������ ǥ�� ���� ��� �����
		   				model.setNumRows(0);
		   			}
		   			
		   			
		   			try {
		   			//��ü �� ��ŭ ���̺� �߰��ϱ�(��ü �������)
		   			for (int i = 0; i < ad.getCount(); i++) {
		   				String[] rows = {ad.getPerson(i).getName(), ad.getPerson(i).getPhoneNum(), ad.getPerson(i).getAddress(), ad.getPerson(i).getEmail()};
		   				model.addRow(rows);
		   			}
		   			}catch (Exception e1)
		   			{
		   				System.out.println("�����߻�!!!");
		   			}
		   		}
		       });

		    //���� ��ư listener�� ����
		    deleteButton.addActionListener (new ActionListener() {
		    	 
		     @Override
		    	 public void actionPerformed(ActionEvent e) {
		    	 
		    	 try {
					if(ad.getCount() == 0) {
						JOptionPane.showMessageDialog(null, "��ϵ� �ּҷ��� �����ϴ�.", "���",JOptionPane.WARNING_MESSAGE);
						}
				} catch (Exception e2) {
					e2.printStackTrace();
				}
		    	
		    	 //������ ���� ��ȣ �˾Ƴ���
		    	 int rowIndex = table.getSelectedRow();
		    	 int columnIndex = table.getSelectedColumn();
		    	 
		    	 String key = (String) table.getValueAt(rowIndex, columnIndex);
			        
		    	 int index = 0;
						try {
							if(ad.checkName(key))
								index = ad.searchName(key);
						} catch (SQLException e2) {
							e2.printStackTrace();
						} catch (Exception e2) {
							e2.printStackTrace();
						}
						
						//���� ���ϰ� ���� ��� ����
						if(rowIndex == -1)
						{
							JOptionPane.showMessageDialog(null, "������ �ּҷ��� �������ּ���.", "���",JOptionPane.WARNING_MESSAGE);
							return;
						}
						
						int exitOption = JOptionPane.showConfirmDialog(null, "�����Ͻðڽ��ϱ�?", "�����Ϸ�", JOptionPane.YES_NO_OPTION);						
						if (exitOption == JOptionPane.YES_OPTION) {
							try {
								//YES ������ ����
								ad.delete(index); 
								model.removeRow(rowIndex);
							} catch (Exception e1) {
						JOptionPane.showMessageDialog(null, "��ϵ� �ּҷ��� �����ϴ�.", "����",JOptionPane.WARNING_MESSAGE);	
							}
						}
						else if ((exitOption == JOptionPane.NO_OPTION) || (exitOption == JOptionPane.CLOSED_OPTION)) {
							return; 
					}
			JOptionPane.showMessageDialog(null, "�ش� �ּҷ��� ���������� �����Ǿ����ϴ�.", "�˸�",JOptionPane.WARNING_MESSAGE);
		    }
		   });
		    
		    //������ ���̵���
		    frame.setVisible(true);
		}
	//main
	public static void main(String[] args) throws Exception
	{
		ad = new AddressBook();
		new GUI();
		
	}
}
