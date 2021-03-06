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
import java.util.*;
import java.awt.Window.Type;
import java.awt.Dialog.ModalExclusionType;


	@SuppressWarnings("serial")
	public class GUI extends JFrame 
	{	
		Person p;
		static AddressBook ad = null;
		
		ObjectInputStream in = null;
		ObjectOutputStream out = null;
		
		JButton addButton, searchNmodifyButton, deleteButton, saveButton, searchButton, modify1Button, modify2Button;
		static JTextField nameField;
		static JTextField phonenumField;
		static JTextField addressField;
		static JTextField emailField;
		JTextField smnameField;
		@SuppressWarnings("unused")
		private JPanel panel;
	
		
		//테이블을 만들기 위한 데이터들
		static String colNames[] = {"이름", "전화번호", "주소", "이메일 주소"};
		static Object data[][] = {};
		
		//테이블 구성
		static DefaultTableModel model = new DefaultTableModel(data, colNames);
		
		@SuppressWarnings("unused")
		GUI() throws Exception {
			//프레임 생성
			JFrame frame = new JFrame("전화번호부");
			//x버튼 눌렀을 때 close 되도록
			frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
			//contentpane 생성
			Container contentPane = frame.getContentPane();
			//프레임 크기 지정
			frame.setPreferredSize(new Dimension(850, 500));
			
			//기존의 데이터 읽어와서 테이블에 출력하기
			//파일 read
			try {
				 in = new ObjectInputStream(new FileInputStream("addressbook.dat"));
				 ad = new AddressBook(100, in);
				 for(int i = 0; i<ad.getCount(); i++) { 
					 String name = ad.getPerson(i).getName(); 
					 String phoneNum = ad.getPerson(i).getPhoneNum(); 
					 String address = ad.getPerson(i).getAddress(); 
					 String email = ad.getPerson(i).getEmail(); 
					 
					 Object [] addrow = {name, phoneNum, address, email}; 
					 model.addRow(addrow); 
					 } 

		         in.close(); //in 닫기
		         
			}catch (FileNotFoundException fnfe) {
			    ad = new AddressBook(100);
				
			}catch (Exception ex) {
				JOptionPane.showMessageDialog(null, "등록 가능 인원 수가 초과하였습니다.", "오류",JOptionPane.WARNING_MESSAGE);
			}
 
			
			//결과 테이블 올려둘 패널 생성
			JPanel tablePanel = new JPanel();
			tablePanel.setLayout(new GridLayout(4,1));
			tablePanel.setSize(80, 120);
			tablePanel.setLocation(460, 150);
			
			//결과 테이블 생성
			JTable table = new JTable(model);
		    JScrollPane jsc = new JScrollPane(table);
		    contentPane.add(jsc,BorderLayout.CENTER);
		      
		    //inputPanel과 naviPanel 올려둘 패널 생성
		    JPanel South = new JPanel();
		    frame.getContentPane().add(South, BorderLayout.SOUTH);
		    South.setLayout(new GridLayout(2, 0, 0, 0));
		      
		    //새로 만들 주소록 입력하는 패널 생성
		    JPanel inputPanel = new JPanel();
		    South.add(inputPanel, BorderLayout.NORTH);
		    inputPanel.setLayout(new GridLayout(4,1));
		      
		    //입력 앞에 적힐 레이블 생성
		    JLabel nameLabel = new JLabel("이      름");
		    nameLabel.setHorizontalAlignment(SwingConstants.CENTER);
		    JLabel phonenumLabel = new JLabel("전화번호");
		    phonenumLabel.setHorizontalAlignment(SwingConstants.CENTER);
		    JLabel addressLabel = new JLabel("주       소");
		    addressLabel.setHorizontalAlignment(SwingConstants.CENTER);
		    JLabel emailLabel = new JLabel("이  메  일");
		    emailLabel.setHorizontalAlignment(SwingConstants.CENTER);
		      
		    //입력할 텍스트필드 생성
		    nameField = new JTextField();
		    phonenumField = new JTextField();
		    addressField = new JTextField();
		    emailField = new JTextField();
		      
		    //jp2 패널에 생성한 레이블과 텍스트필드 add
		    inputPanel.add(nameLabel);
		    inputPanel.add(nameField);
		    inputPanel.add(phonenumLabel);
		    inputPanel.add(phonenumField);
		    inputPanel.add(addressLabel);
		    inputPanel.add(addressField);
		    inputPanel.add(emailLabel);
		    inputPanel.add(emailField);
		      
		    setSize(900, 350);
		    
		    //네비게이션 올릴 패널 생성
		    JPanel naviPanel = new JPanel();
		    South.add(naviPanel, BorderLayout.SOUTH);
		    naviPanel.setLayout(new GridLayout(2,2));
		      
		    //네비게이션 버튼 생성
		    addButton = new JButton("등록");
		    searchNmodifyButton = new JButton("검색/수정");
		    deleteButton = new JButton("삭제");
		    saveButton = new JButton("저장");
		      
		    //jp1 패널에 생성한 버튼 add
		    naviPanel.add(addButton);
		    naviPanel.add(searchNmodifyButton);
		    naviPanel.add(deleteButton);
		    naviPanel.add(saveButton);
		    
		 
		    //등록 버튼 listener로 연결
		    addButton.addActionListener (new ActionListener() {
		    	 
		     @Override
		    	 public void actionPerformed(ActionEvent e) {
		    	 String name = nameField.getText();
		    	 do { //(do-while)이름 겹치지 않게 입력하게 하는 코드
		    		 if(name.equals("")) {
		    			 JOptionPane.showMessageDialog(null, "이름을 입력해주세요", "주의",JOptionPane.WARNING_MESSAGE);
		    			 return;
		    		 }
		    		 if(ad.checkName(name)==true) {
						JOptionPane.showMessageDialog(null, "이미 등록된 이름입니다. 이름 뒤에 숫자를 붙여 저장하세요. (ex:김덕선1, 김덕선2 ,김덕선3)", "주의",JOptionPane.WARNING_MESSAGE);
						nameField.setText("");
						return;
		    		 }
		    		 else break;
					}while(true);
					
		    	 String phoneNum = phonenumField.getText();
		    	 do {
		    		 if(ad.checkPhoneNum(phoneNum)==true) { //만약 등록된 전화번호일 경우 메뉴로 돌아가게 함
						JOptionPane.showMessageDialog(null, "이미 등록된 전화번호 입니다.", "주의",JOptionPane.WARNING_MESSAGE);
						return;
					}
					else break;
		    	 	}while(true);
					
					//입력한 텍스트필드에서 각각 받아오기
					String address = addressField.getText();
			    	String email = emailField.getText();	
			    	
			    	 //rows 배열에 name,phoneNum,address,email 입력
			    	String rows[] = {name, phoneNum, address, email};
			    	
			    	 //rows 배열에 저장한 후 clear 해주기
			    	 nameField.setText("");
			    	 phonenumField.setText("");
			    	 addressField.setText("");
			    	 emailField.setText("");
	
					try {
						ad.add(new Person(name, phoneNum,address,email));	//주소록 등록 메소드
					} catch (Exception e1) {
						JOptionPane.showMessageDialog(null, "등록 가능 인원 수가 초과하였습니다.", "주의",JOptionPane.WARNING_MESSAGE);
						return;
					}
					
					 model.addRow(rows);
					
		     }
		    });
			
		    
		    //검색/수정 버튼 listener로 연결
		    searchNmodifyButton.addActionListener (new ActionListener() {
		    	 
		     @Override
		    	public void actionPerformed(ActionEvent e) {
		    	//검색 패널 생성
		    	//프레임 생성
				JFrame searchframe = new JFrame("검색 및 수정");
				//x버튼 눌렀을 때 close 되도록
				searchframe.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
				//contentpane 생성
				Container contentPane = searchframe.getContentPane();
					
				JPanel searchPanel = new JPanel();
				searchframe.getContentPane().add(searchPanel, BorderLayout.SOUTH);
				searchPanel.setLayout(new GridLayout(2, 0, 0, 0));
				 
		    	 JLabel nameLabel = new JLabel("이      름");
		    	 nameLabel.setHorizontalAlignment(SwingConstants.CENTER);
		    	 smnameField = new JTextField();
		    	 JButton searchButton = new JButton("검색");
		    	 searchButton.setHorizontalAlignment(SwingConstants.CENTER);
		    	 JButton modify1Button = new JButton("수정");
		    	 modify1Button.setHorizontalAlignment(SwingConstants.CENTER);
				    
		    	 searchPanel.add(nameLabel);
		    	 searchPanel.add(smnameField);
				 searchPanel.add(searchButton);
				 searchPanel.add(modify1Button);
				 
				 	//검색 버튼 클릭 시
					searchButton.addActionListener (new ActionListener() {
				    	 
					     @Override
					    	public void actionPerformed(ActionEvent e) {
					    	//프레임 생성
							 JFrame resultframe = new JFrame("검색");
							 //x버튼 눌렀을 때 close 되도록
							 resultframe.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
							 //contentpane 생성
							 Container contentPane = resultframe.getContentPane();	
								
							 JPanel resultPanel = new JPanel();
							 resultframe.getContentPane().add(resultPanel, BorderLayout.CENTER);
							 resultPanel.setLayout(new GridLayout(4,0));
							 
							 String sname = smnameField.getText();
							 if(sname.equals("")) {
					    		 JOptionPane.showMessageDialog(null, "이름을 입력해주세요", "주의",JOptionPane.WARNING_MESSAGE);
					    			return;
					    		}
					    	 
					    	  try {		
					    		  	int sindex=ad.searchName(sname);
					    			//결과
					    			JLabel nameLabel = new JLabel("이      름     :     " + ad.getPerson(sindex).getName());
					    			nameLabel.setHorizontalAlignment(SwingConstants.CENTER);
					    			JLabel phonenumLabel = new JLabel("전화번호     :     " + ad.getPerson(sindex).getPhoneNum());
					    			phonenumLabel.setHorizontalAlignment(SwingConstants.CENTER);
					    			JLabel addressLabel = new JLabel("주       소     :     " + ad.getPerson(sindex).getAddress());
					    			addressLabel.setHorizontalAlignment(SwingConstants.CENTER);
					    			JLabel emailLabel = new JLabel("이  메  일     :    " + ad.getPerson(sindex).getEmail());
					    			emailLabel.setHorizontalAlignment(SwingConstants.CENTER);
					    			JButton modify2Button = new JButton("수정");
					    			modify2Button.setHorizontalAlignment(SwingConstants.CENTER);
					    			
					    			resultPanel.add(nameLabel);
							    	resultPanel.add(phonenumLabel);
									resultPanel.add(addressLabel);
									resultPanel.add(emailLabel);
									resultPanel.add(modify1Button);
					    				  
					    			 } catch (Exception e1) {
					    				 JOptionPane.showMessageDialog(null, "등록된 이름이 없습니다. 다시 입력하세요.", "오류",JOptionPane.WARNING_MESSAGE);
					    				 nameField.setText("");
					    				 return;
					    			 }
					    	  
					    	  resultframe.setVisible(true);
					     }
					 });
	
					//수정 버튼 클릭 시
					modify1Button.addActionListener (new ActionListener() {
				    	 
					     @Override
					    	public void actionPerformed(ActionEvent e) {
					    	//프레임 생성
							JFrame modify1frame = new JFrame("수정");
							//x버튼 눌렀을 때 close 되도록
							modify1frame.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
							//contentpane 생성
							Container contentPane = modify1frame.getContentPane();
									
							JPanel modify1Panel = new JPanel();
							modify1frame.getContentPane().add(modify1Panel, BorderLayout.CENTER);
							modify1Panel.setLayout(new GridLayout(4,1));
					    	 
							//입력 앞에 적힐 레이블 생성
				    		JLabel phonenumLabel = new JLabel("전화번호");
				    		phonenumLabel.setHorizontalAlignment(SwingConstants.CENTER);
				    		JLabel addressLabel = new JLabel("주       소");
				    		addressLabel.setHorizontalAlignment(SwingConstants.CENTER);
				    		JLabel emailLabel = new JLabel("이  메  일");
				    		emailLabel.setHorizontalAlignment(SwingConstants.CENTER);
				    		JButton modify2Button = new JButton("수정");
				    		modify2Button.setHorizontalAlignment(SwingConstants.CENTER);
				    		      
				    		//입력할 텍스트필드 생성
				    		phonenumField = new JTextField();
				    		addressField = new JTextField();
				    		emailField = new JTextField();
				    		
				    		
				    		String sname = smnameField.getText();
				    		if(sname.equals("")) {
				    			 JOptionPane.showMessageDialog(null, "이름을 입력해주세요", "주의",JOptionPane.WARNING_MESSAGE);
				    			 return;
				    		 }
				    		      
				    		//modify 패널에 생성한 레이블과 텍스트필드 add
				    		try {
				    		int sindex=ad.searchName(sname);
				    		modify1Panel.add(phonenumLabel);
				    		modify1Panel.add(phonenumField);
				    		modify1Panel.add(addressLabel);
				    		modify1Panel.add(addressField);
				    		modify1Panel.add(emailLabel);
				    		modify1Panel.add(emailField);
				    		modify1Panel.add(modify2Button, BorderLayout.EAST);
				    		} catch (Exception e1) {
								 JOptionPane.showMessageDialog(null, "등록된 이름이 없습니다. 다시 입력하세요.", "오류",JOptionPane.WARNING_MESSAGE);
			    				 nameField.setText("");
			    				 return;
							 }
				    		modify1frame.setVisible(true);
				    		
				    		//수정 버튼 클릭 시
							 modify2Button.addActionListener (new ActionListener() {
						    	 
							     @Override
							    	public void actionPerformed(ActionEvent e) {
							    	 	//프레임 생성
										JFrame modify2frame = new JFrame("수정");
										//x버튼 눌렀을 때 close 되도록
										modify2frame.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
							    	 	//contentpane 생성
										Container contentPane = modify2frame.getContentPane();	
										
										JPanel modify2Panel = new JPanel();
										modify2frame.getContentPane().add(modify2Panel, BorderLayout.CENTER);
										modify2Panel.setLayout(new GridLayout(4,2));
								
						    		    //입력한 텍스트필드에서 각각 받아오기
						    		    String newPhonenum = phonenumField.getText();
								    	 do {
								    		 if(ad.checkPhoneNum(newPhonenum)==true) { //만약 등록된 전화번호일 경우 메뉴로 돌아가게 함
												JOptionPane.showMessageDialog(null, "이미 등록된 전화번호 입니다.", "주의",JOptionPane.WARNING_MESSAGE);
												phonenumField.setText("");
												return;
											}
											else break;
								    	 	}while(true);
								    	 
								    	 String newAddress = addressField.getText();
							    		 String newEmail = emailField.getText();	
							    		 
								    	 //rows 배열에 name,phoneNum,address,email 입력
								    	String newRows[] = {smnameField.getText(), newPhonenum, newAddress, newEmail};
								    	
								    	 //rows 배열에 저장한 후 clear 해주기
								    	 nameField.setText("");
								    	 phonenumField.setText("");
								    	 addressField.setText("");
								    	 emailField.setText("");
								    	 
								    	 try {	
							    		  	int sindex = ad.searchName(smnameField.getText());
							    		  	p=new Person(smnameField.getText(), newPhonenum, newAddress, newEmail);
							    		  	model.removeRow(sindex);
								    		ad.modify(sindex,p); //주소록 수정
								    		model.addRow(newRows);
								    		JOptionPane.showMessageDialog(null, "성공적으로 수정되었습니다.", "알림",JOptionPane.WARNING_MESSAGE);
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
					
				  searchframe.setVisible(true);	
		     }
		    });
		    
		     
		    //삭제 버튼 listener로 연결
		    deleteButton.addActionListener (new ActionListener() {
		    	 
		     @Override
		    	 public void actionPerformed(ActionEvent e) {
		    	 
		    	 if(ad.getCount() == 0) {
		    		 JOptionPane.showMessageDialog(null, "등록된 주소록이 없습니다.", "경고",JOptionPane.WARNING_MESSAGE);
					}
					
		    	 //선택한 줄의 번호 알아내기
		    	 int rowIndex = table.getSelectedRow();
		    	 //선택 안하고 누를 경우 오류
		    	 if(rowIndex == -1)
		    	 {
		    		 JOptionPane.showMessageDialog(null, "삭제할 주소록을 선택해주세요.", "경고",JOptionPane.WARNING_MESSAGE);
		    		 return;
		    	 }
		    	 try {	
						model.removeRow(rowIndex);
						ad.delete(rowIndex);
							
					}catch (Exception e1) {
						JOptionPane.showMessageDialog(null, "등록된 주소록이 없습니다.", "오류",JOptionPane.WARNING_MESSAGE);		
						return;
					}
		    	
		    	 JOptionPane.showMessageDialog(null, "해당 주소록이 성공적으로 삭제되었습니다.", "알림",JOptionPane.WARNING_MESSAGE);
		     }
		    });
		    
		    
		    
		  //저장 버튼 listener로 연결
		    saveButton.addActionListener (new ActionListener() {
		    	 
		     @Override
		    	 public void actionPerformed(ActionEvent e) {
		    	 try {
						out = new ObjectOutputStream(new FileOutputStream("addressbook.dat"));
					} catch (Exception ex) {

					}
					try {
						ad.writeFile(out);
						JOptionPane.showMessageDialog(null, "성공적으로 저장되었습니다.", "알림",JOptionPane.WARNING_MESSAGE);
					} catch (FileNotFoundException fnfe) {

					} catch(IOException ioe) {
						JOptionPane.showMessageDialog(null, "저장에 실패했습니다.", "오류",JOptionPane.WARNING_MESSAGE);
					} catch (Exception ex) {

					}
					
					finally {
						//close()이용해 out에 연결된 참조값을 끊기
						try {
							out.close();
						} catch (IOException ex) {

						} catch(Exception ex) {

						}
					}

		    	
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
