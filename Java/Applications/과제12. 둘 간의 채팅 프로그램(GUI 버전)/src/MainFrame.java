import java.awt.BorderLayout;

import java.awt.event.ActionEvent;

import java.awt.event.ActionListener;
import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import javax.swing.JButton;

import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTextField;
import javax.swing.SwingConstants;

@SuppressWarnings("serial")
public class MainFrame extends JFrame {
	static Socket socket = null;
	static ServerSocket serversocket = null;

	//mainframe 생성
	public MainFrame() {

		//제목 정해주기
		setTitle("Chatting Program");

		setBounds(10, 50, 400, 250);

		//x버튼 클릭시 종료
		setDefaultCloseOperation(EXIT_ON_CLOSE);

		//패널 생성
		JPanel panel = new JPanel();

		//서버와 클라이언트, 종료 선택할 수 있는 버튼 생성
		JButton btnServer = new JButton("Server");
		btnServer.setBounds(10, 84, 362, 32);
		JButton btnClient = new JButton("Client");
		btnClient.setBounds(10, 126, 362, 32);
		JButton btnExit = new JButton("Exit");
		btnExit.setBounds(10, 168, 362, 32);
		
		//ip주소와 portnum 받아올 textfield생성
		JTextField ipField;
		JTextField portField;

		//textfield 앞에 적어줄 라벨 생성
		JLabel ipLabel = new JLabel("ip 주소");
		ipLabel.setBounds(0, 0, 190, 30);
		ipLabel.setHorizontalAlignment(SwingConstants.CENTER);
		JLabel portLabel = new JLabel("port num");
		portLabel.setBounds(0, 42, 190, 30);
		portLabel.setHorizontalAlignment(SwingConstants.CENTER);
		
		ipField = new JTextField();
		ipField.setBounds(182, 1, 190, 30);
		portField = new JTextField();
		portField.setBounds(182, 43, 190, 30);
		panel.setLayout(null);

		//패널에 각 라벨과 텍스트필드, 버튼들 올리기
		panel.add(ipLabel);
		panel.add(ipField);
		panel.add(portLabel);
		panel.add(portField);
		panel.add(btnServer);
		panel.add(btnClient);
		panel.add(btnExit);

		getContentPane().add(panel, BorderLayout.CENTER);

		//서버 버튼 클릭 시 실행될 리스너 객체 생성 및 추가
		btnServer.addActionListener(new ActionListener() {			

			@Override
			public void actionPerformed(ActionEvent e) {
				//portfield에서 port 받아오기
				String port = portField.getText();
				 do { //(do-while) port num 공백 시 주의 창 뜨도록
			    		if(port.equals("")) {
							JOptionPane.showMessageDialog(null, "port num을 입력해주세요", "주의",JOptionPane.WARNING_MESSAGE);
							return;
			    		} else break;
			    	}while(true);
				@SuppressWarnings("unused")
				ServerFrame frame = new ServerFrame(port);

			}

		});

		//클라이언트 버튼 클릭 시 실행될 리스너 객체 생성 및 추가
		btnClient.addActionListener(new ActionListener() {			

			@Override

			public void actionPerformed(ActionEvent e) {
				//portfield에서 port 받아오기
				String port = portField.getText();
				//ipfield에서 ip 받아오기
				String ipAdress = ipField.getText();
				 do { //(do-while) port num과 ip주소 공백 없도록
			    		if(port.equals("")) {
							JOptionPane.showMessageDialog(null, "port num을 입력해주세요", "주의",JOptionPane.WARNING_MESSAGE);
							return;
			    		} else if(ipAdress.equals("")) {
			    			JOptionPane.showMessageDialog(null, "ip 주소를 입력해주세요", "주의",JOptionPane.WARNING_MESSAGE);
			    			return;
			    		} else break;
			    	}while(true);
				@SuppressWarnings("unused")
				ClientFrame frame = new ClientFrame(ipAdress, port);

			}

		});
		
		//종료 버튼 클릭 시 실행될 리스너 객체 생성 및 추가
		btnExit.addActionListener(new ActionListener() {			

			@Override

			public void actionPerformed(ActionEvent e) {
				//종료하기 전 한 번 더 물어보기
				int exitOption = JOptionPane.showConfirmDialog(null, "창을 닫으시겠습니까?", "종료", JOptionPane.YES_NO_OPTION);			
				
				if (exitOption == JOptionPane.YES_OPTION) {//yes버튼 클릭시 종료
					try {
						System.exit(0);
					} catch (Exception e1) {
						JOptionPane.showMessageDialog(null, "종료에 실패했습니다.", "오류",JOptionPane.WARNING_MESSAGE);
					}
				}
				else if ((exitOption == JOptionPane.NO_OPTION) || (exitOption == JOptionPane.CLOSED_OPTION)) //no버튼 클릭하거나 창을 닫을 경우 return
					return; 
			}

		});
		setVisible(true);

	}


	//main함수
	public static void main(String[] args) throws IOException {

		new MainFrame();
		
	}

}
