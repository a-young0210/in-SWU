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

	//mainframe ����
	public MainFrame() {

		//���� �����ֱ�
		setTitle("Chatting Program");

		setBounds(10, 50, 400, 250);

		//x��ư Ŭ���� ����
		setDefaultCloseOperation(EXIT_ON_CLOSE);

		//�г� ����
		JPanel panel = new JPanel();

		//������ Ŭ���̾�Ʈ, ���� ������ �� �ִ� ��ư ����
		JButton btnServer = new JButton("Server");
		btnServer.setBounds(10, 84, 362, 32);
		JButton btnClient = new JButton("Client");
		btnClient.setBounds(10, 126, 362, 32);
		JButton btnExit = new JButton("Exit");
		btnExit.setBounds(10, 168, 362, 32);
		
		//ip�ּҿ� portnum �޾ƿ� textfield����
		JTextField ipField;
		JTextField portField;

		//textfield �տ� ������ �� ����
		JLabel ipLabel = new JLabel("ip �ּ�");
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

		//�гο� �� �󺧰� �ؽ�Ʈ�ʵ�, ��ư�� �ø���
		panel.add(ipLabel);
		panel.add(ipField);
		panel.add(portLabel);
		panel.add(portField);
		panel.add(btnServer);
		panel.add(btnClient);
		panel.add(btnExit);

		getContentPane().add(panel, BorderLayout.CENTER);

		//���� ��ư Ŭ�� �� ����� ������ ��ü ���� �� �߰�
		btnServer.addActionListener(new ActionListener() {			

			@Override
			public void actionPerformed(ActionEvent e) {
				//portfield���� port �޾ƿ���
				String port = portField.getText();
				 do { //(do-while) port num ���� �� ���� â �ߵ���
			    		if(port.equals("")) {
							JOptionPane.showMessageDialog(null, "port num�� �Է����ּ���", "����",JOptionPane.WARNING_MESSAGE);
							return;
			    		} else break;
			    	}while(true);
				@SuppressWarnings("unused")
				ServerFrame frame = new ServerFrame(port);

			}

		});

		//Ŭ���̾�Ʈ ��ư Ŭ�� �� ����� ������ ��ü ���� �� �߰�
		btnClient.addActionListener(new ActionListener() {			

			@Override

			public void actionPerformed(ActionEvent e) {
				//portfield���� port �޾ƿ���
				String port = portField.getText();
				//ipfield���� ip �޾ƿ���
				String ipAdress = ipField.getText();
				 do { //(do-while) port num�� ip�ּ� ���� ������
			    		if(port.equals("")) {
							JOptionPane.showMessageDialog(null, "port num�� �Է����ּ���", "����",JOptionPane.WARNING_MESSAGE);
							return;
			    		} else if(ipAdress.equals("")) {
			    			JOptionPane.showMessageDialog(null, "ip �ּҸ� �Է����ּ���", "����",JOptionPane.WARNING_MESSAGE);
			    			return;
			    		} else break;
			    	}while(true);
				@SuppressWarnings("unused")
				ClientFrame frame = new ClientFrame(ipAdress, port);

			}

		});
		
		//���� ��ư Ŭ�� �� ����� ������ ��ü ���� �� �߰�
		btnExit.addActionListener(new ActionListener() {			

			@Override

			public void actionPerformed(ActionEvent e) {
				//�����ϱ� �� �� �� �� �����
				int exitOption = JOptionPane.showConfirmDialog(null, "â�� �����ðڽ��ϱ�?", "����", JOptionPane.YES_NO_OPTION);			
				
				if (exitOption == JOptionPane.YES_OPTION) {//yes��ư Ŭ���� ����
					try {
						System.exit(0);
					} catch (Exception e1) {
						JOptionPane.showMessageDialog(null, "���ῡ �����߽��ϴ�.", "����",JOptionPane.WARNING_MESSAGE);
					}
				}
				else if ((exitOption == JOptionPane.NO_OPTION) || (exitOption == JOptionPane.CLOSED_OPTION)) //no��ư Ŭ���ϰų� â�� ���� ��� return
					return; 
			}

		});
		setVisible(true);

	}


	//main�Լ�
	public static void main(String[] args) throws IOException {

		new MainFrame();
		
	}

}
