import java.awt.BorderLayout;

import java.awt.event.ActionEvent;

import java.awt.event.ActionListener;

import java.awt.event.KeyAdapter;

import java.awt.event.KeyEvent;

import java.awt.event.WindowAdapter;

import java.awt.event.WindowEvent;
import java.io.BufferedReader;
import java.io.DataInputStream;

import java.io.DataOutputStream;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.ServerSocket;

import java.net.Socket;
import java.net.UnknownHostException;

import javax.swing.JButton;

import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JPanel;

import javax.swing.JScrollPane;

import javax.swing.JTextArea;

import javax.swing.JTextField;

@SuppressWarnings({ "serial", "unused" })
//���� ������ ����
public class ServerFrame extends JFrame {

	JTextArea textArea; //��� ��������
	JTextField tfMsg;
	JButton btnSend, btnExit;
	ServerSocket serverSocket;
	Socket socket;
	BufferedReader in;
	OutputStream out;
	DataInputStream dis;
	DataOutputStream dos;
	
	int port;
	String clientname;
	String servername;
	
	//portnum �Ķ���ͷ� �ޱ�
	public ServerFrame(String port) {
		
		this.port = Integer.parseInt(port);
		
		//���� ����
		setTitle("Server");
		setBounds(450, 50, 500, 350);

		textArea = new JTextArea();		
		textArea.setEditable(false); //���� ����

		JScrollPane scrollPane = new JScrollPane(textArea);
		add(scrollPane,BorderLayout.CENTER);

		//�г� ����
		JPanel msgPanel = new JPanel();
		JPanel msgPanel_btn = new JPanel();
		msgPanel.setLayout(new BorderLayout());

		tfMsg = new JTextField();
		
		//������, ���� ��ư ����
		btnSend = new JButton("send");
		btnExit	= new JButton("exit");
		
		//�гο� ��ư �ø���
		msgPanel_btn.add(btnSend, BorderLayout.WEST);
		msgPanel_btn.add(btnExit, BorderLayout.EAST);
		
		msgPanel.add(tfMsg, BorderLayout.CENTER);
		msgPanel.add(msgPanel_btn, BorderLayout.EAST);
		
		add(msgPanel,BorderLayout.SOUTH);
		
		

		//send ��ư Ŭ���� �����ϴ� ������ �߰�
		btnSend.addActionListener(new ActionListener() {			

			@Override
			public void actionPerformed(ActionEvent e) {
				//sendmessage �Լ� ����
				sendMessage();
			}

		});
		
		//exit ��ư Ŭ���� �����ϴ� ������ �߰�
		btnExit.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				//���� �� �� �� �� �����
				int exitOption = JOptionPane.showConfirmDialog(null, "������ �����ðڽ��ϱ�?", "���� ����", JOptionPane.YES_NO_OPTION);						
				if (exitOption == JOptionPane.YES_OPTION) {//yes��ư Ŭ���� ����
					try {
						//dis, dos, socket �ݾƼ� ���� ����
						dis.close();
						dos.close();
						socket.close();
					} catch (Exception e1) {
						textArea.append("���� ���ῡ �����߽��ϴ�.\n");
					}
				}
				else if ((exitOption == JOptionPane.NO_OPTION) || (exitOption == JOptionPane.CLOSED_OPTION)) //no��ư Ŭ���ϰų� â�� ���� ��� return
					return; 
				//â �ݱ�
				dispose();
				}
		});

		//����Ű ������ �� �����ϱ�
		tfMsg.addKeyListener(new KeyAdapter() {

			//Ű���忡�� Ű �ϳ��� �������� �ڵ����� ����Ǵ� �޼ҵ�..: �ݹ� �޼ҵ�
			@Override
			public void keyPressed(KeyEvent e) {				
				super.keyPressed(e);

			//�Է¹��� Ű�� �������� �˾Ƴ���, KeyEvent ��ü�� Ű������ ���� ��������
			int keyCode = e.getKeyCode();
			switch(keyCode) {
			case KeyEvent.VK_ENTER:
				sendMessage();
				break;
			}

		}

	});		
		setVisible(true);
		tfMsg.requestFocus();
		
		//������ �����ϴ� ��Ʈ��ũ �۾� : Ŭ���̾�Ʈ ������ ��ü ���� �� ����
		ServerThread serverThread = new ServerThread();
		serverThread.setDaemon(true); //���� ������ ���� ����
		serverThread.start();

		//Ŭ���̾�Ʈ �����ӿ� window(â) ���� ������ �߰�
		addWindowListener(new WindowAdapter() {			
			@Override 
			public void windowClosing(WindowEvent e) {				
				super.windowClosing(e);
				try {
					if(dos != null) dos.close();
					if(dis != null) dis.close();
					if(socket != null) socket.close();
					if(serverSocket != null) serverSocket.close();
				} catch (IOException e1) {		
					textArea.append("������ �߻��߽��ϴ�.\n");
				}
			}			
		});
	}
	
		//����������
		class ServerThread extends Thread {
			public void run() {			
				try { 
					//�г��� �Է� �ޱ�
					servername = JOptionPane.showInputDialog("�г����� �Է����ּ���.\n", JOptionPane.INFORMATION_MESSAGE);
					//�Է¹��� portnum���� socket ����
					serverSocket = new ServerSocket(port); 
					textArea.append("���������� �غ�ƽ��ϴ�.\n");
					textArea.append("Ŭ���̾�Ʈ�� ������ ��ٸ��ϴ�.\n");	
					
					//Ŭ���̾�Ʈ�� �����Ҷ����� Ŀ��(������)�� ���
					socket = serverSocket.accept();
					
					//����� ���� ��Ʈ�� ����
					dis = new DataInputStream(socket.getInputStream());
					dos = new DataOutputStream(socket.getOutputStream());

					//�Է¹��� �г��� write
					dos.writeUTF(servername);
					//client���� �Է¹޴� �г��� read
					clientname = dis.readUTF();

					//ip�ּҿ� Ŭ���̾�Ʈ �г��� ȭ��â�� ������ֱ�
					textArea.append( "ip �ּ� : " + socket.getInetAddress().getHostAddress() + "\n �г��� : " + clientname + "���� �����ϼ̽��ϴ�.\n");


					while(true) {//������ ������ �����͸� �б�
						
						//������ ���������� ���
						String msg = dis.readUTF();
						//TextArea�� ǥ��
						textArea.append(" [" + clientname + "] : " + msg + "\n");
						textArea.setCaretPosition(textArea.getText().length());
					}					
				} catch (IOException e) {
					textArea.append("Ŭ���̾�Ʈ�� �������ϴ�.\n");
				}
			}
		}
		
		//�޽��� �����ϴ� ��� �޼ҵ�
		void sendMessage() {	
			String msg = tfMsg.getText(); //TextField�� ���ִ� �۾��� ������
			tfMsg.setText(""); //�Է� �� ��ĭ����
			
			//TextArea�� ǥ��
			textArea.append(" [" + servername + "] : " + msg + "\n");
			//��ũ�� ���󰡰�
			textArea.setCaretPosition(textArea.getText().length()); 
			
			//Client�� �޽��� �����ϱ�
			Thread t = new Thread() {
				@Override
				public void run() {
					try {
						dos.writeUTF(msg);
						dos.flush();
					} catch (IOException e) {
						textArea.append("������ �߻��߽��ϴ�.\n");
					}
				}
			};		
			t.start();
		}	
	
}
