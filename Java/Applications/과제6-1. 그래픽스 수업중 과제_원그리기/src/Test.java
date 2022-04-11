import javax.swing.*;
import java.awt.*;

	 @SuppressWarnings("serial")
	class MyComponent extends JComponent 
	{
		public void paintComponent(Graphics g)
		{
			//�������� 60px�� ��
			g.drawOval(20, 20, 120, 120);
			g.drawString("������ : 60px", 50, 80);
			
			//������ 75px�� ������ ��
			g.setColor(Color.RED);
			g.drawOval(160, 20, 150, 150);
			g.drawString("������ : 75px", 200, 100);
			
			//������ 50px�� ��Ȳ�� ��
			g.setColor(new Color(255,140,0));
			g.drawOval(330, 20, 100, 100);
			g.drawString("������ : 50px", 350, 75);
			
			//������ 65px�� �ʷϻ� ��
			g.setColor(new Color(0,100,0));
			g.drawOval(450, 20, 130, 130);
			g.drawString("������ : 65px", 480, 90);
			
			//������ 40px�� ���λ� ��
			g.setColor(Color.GREEN);
			g.drawOval(600, 20, 80, 80);
			g.drawString("������ : 40px", 610, 60);
			
			//������ 55px�� ����� ��
			g.setColor(Color.MAGENTA);
			g.drawOval(700, 20, 110, 110);
			g.drawString("������ : 55px", 720, 80);
			
			//������ 45px�� �Ķ��� ��
			g.setColor(Color.BLUE);
			g.drawOval(830, 20, 90, 90);
			g.drawString("������ : 45px", 840, 70);
			
			//������ 90px�� ���λ� ��
			g.setColor(new Color(34,139,34));
			g.drawOval(20, 170, 180, 180);
			g.drawString("������ : 90px", 80, 260);
			
			//������ 125px�� ���� ��
			g.setColor(new Color(139,69,19));
			g.drawOval(220, 170, 250, 250);
			g.drawString("������ : 125px", 320, 290);
			
			//������ 175px�� �ϴû� ��
			g.setColor(new Color(70,130,180));
			g.drawOval(490, 170, 350, 350);
			g.drawString("������ : 175px", 630, 350);
		}

	}

	public class Test
	{
		public static void main(String[] args)
		{
			JFrame frame = new JFrame();
			frame.setSize(800, 300);
			frame.setTitle("�׸���");
			frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
			MyComponent component = new MyComponent();
			frame.add(component);
			frame.setVisible(true);
		}
	}
