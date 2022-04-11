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

import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;

import java.net.Socket;

import java.net.UnknownHostException;
import java.sql.SQLException;

import javax.swing.JButton;

import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JPanel;

import javax.swing.JScrollPane;

import javax.swing.JTextArea;

import javax.swing.JTextField;


@SuppressWarnings({ "serial", "unused" })
//Ŭ���̾�Ʈ ������ ����
public class ClientFrame extends JFrame{

	JTextArea textArea; 
	JTextField tfMsg;
	JButton btnSend, btnExit;


	Socket socket;
	BufferedReader in;
	OutputStream out;
	DataInputStream dis;
	DataOutputStream dos;	

	String ip;
	int port;
	String servername;
	String clientname;
	
	//ip�ּҿ� portnum �Ķ���ͷ� �ޱ�
	public ClientFrame(String ip, String port) {
		this.ip = ip;
		this.port = Integer.parseInt(port);
		
		//���� ����
		setTitle("Client");
		setBounds(450, 400, 500, 350);

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
				if (exitOption == JOptionPane.YES_OPTION) { //yes��ư Ŭ���� ����
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

			//Ű���忡�� Ű �ϳ��� �������� �ڵ����� ����Ǵ� �޼ҵ� : �ݹ� �޼ҵ�
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
		ClientThread clientThread = new ClientThread();
		clientThread.setDaemon(true); //���� ������ ���� ����
		clientThread.start();
		
		//Ŭ���̾�Ʈ �����ӿ� window(â) ���� ������ �߰�
		addWindowListener(new WindowAdapter() {			
			@Override 
			public void windowClosing(WindowEvent e) {				
				super.windowClosing(e);

				try {
					if(dos != null) dos.close();
					if(dis != null) dis.close();
					if(socket != null) socket.close();
				} catch (IOException e1) {					
					textArea.append("������ �߻��߽��ϴ�.\n");
				}
			}			
		});
	}
		
		//Ŭ���̾�Ʈ������
		class ClientThread extends Thread {
			public void run() {
				try { 
					//�г��� �Է� �ޱ�
					clientname = JOptionPane.showInputDialog("�г����� �Է����ּ���.\n", JOptionPane.INFORMATION_MESSAGE);		
					//�Է¹��� ip�ּҿ� portnum���� socket ����
					socket = new Socket(ip, port); 
					textArea.append("������ ���ӵƽ��ϴ�.\n");

					//������ ������ ���� ��Ʈ�� ����
					InputStream is = socket.getInputStream();
					OutputStream os = socket.getOutputStream();

					//������Ʈ������ ���� ���������� �۾� ���ϰ� 
					dis = new DataInputStream(is);
					dos = new DataOutputStream(os);	

					//�Է¹��� �г��� write
					dos.writeUTF(clientname);
					//server���� �Է¹޴� �г��� read
					servername = dis.readUTF();

					while(true) {//���� �޽��� �ޱ�
						String msg = dis.readUTF();
						//TextArea�� ǥ��
						textArea.append(" [" + servername + "] : " + msg + "\n");
						textArea.setCaretPosition(textArea.getText().length());
					}

				} catch (UnknownHostException e) {
					textArea.append("���� �ּҰ� �̻��մϴ�.\n");
				} catch (IOException e) {
					textArea.append("������ ������ ������ϴ�.\n");
				}
			}
		}
		

		//�޽��� �����ϴ� ��� �Լ�
		void sendMessage() {	
		String msg = tfMsg.getText(); //TextField�� ���ִ� �۾��� ������
		tfMsg.setText(""); //�Է� �� ��ĭ����
		
		//TextArea�� ǥ��
		textArea.append(" [" + clientname + "] : " + msg + "\n");
		//��ũ�� ���󰡰� �ϱ�
		textArea.setCaretPosition(textArea.getText().length()); 
		
		//Server�� �޽��� �����ϱ�
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
