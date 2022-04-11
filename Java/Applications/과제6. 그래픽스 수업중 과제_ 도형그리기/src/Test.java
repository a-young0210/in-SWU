import javax.swing.*;
import java.awt.*;

	@SuppressWarnings("serial")
	//������Ʈ�� ��ӹ޾Ƽ� ����
	 class MyComponent extends JComponent 
	{
		public void paintComponent(Graphics g)
		{
			//���� �׸���
			g.drawLine(10, 80, 100, 10);
			//"drawLine()" ���ڿ� ����ϱ�
			g.drawString("drawLine()", 10, 100);
			//���� ���������� ����
			g.setColor(Color.RED);
			//�簢�� �׸���
			g.drawRect(110, 10, 110, 80);
			//���� �ٽ� ���������� ����
			g.setColor(Color.BLACK);
			//��Ʈ �ٲ��ֱ�
			Font font = new Font("Serif",Font.BOLD,12);
			g.setFont(font);
			//"drawRect()" ���ڿ� ����ϱ�
			g.drawString("drawRect()", 110, 100);
			
		
			//��Ʈ �������
			font = new Font("Dialog",Font.PLAIN,12);
			g.setFont(font);
			// �� ���⿡ �ҽ��� �߰�
			
			//3D �簢�� �׸���
			//���� LIGHT_GRAY�� ������� 3D�� �� ���̵��� 
			g.setColor(Color.LIGHT_GRAY);
			g.draw3DRect(230, 10, 110, 80, true);
			//���� �ٽ� BLACK���� �ٲ��ֱ�
			g.setColor(Color.BLACK);
			g.drawString("draw3DRect()", 230, 100);
			
			//�𼭸��� �ձ� �簢�� �׸���
			g.drawRoundRect(350, 10, 95, 80, 40, 40);
			g.drawString("drawRoundRect()", 350, 100);
			
			//���� Ÿ�� �׸���
			g.drawOval(460, 10, 110, 80);
			g.drawString("drawOval()", 480, 100);
			
			//ȣ �׸���
			g.drawArc(590, 10, 110, 80, 50, 30);
			g.drawString("drawArc()", 610, 100);
			
			//x��ǥ�� y��ǥ �迭
			int[]x = new int[4];
			x[0]=710;
			x[1]=810;
			x[2]=710;
			x[3]=810;
			int[]y = new int[4];
			y[0]=10;
			y[1]=10;
			y[2]=90;
			y[3]=90;
			//�ٰ��� �׸���
			g.drawPolygon(x,y,4);
			g.drawString("drawPolygon()", 720, 100);
			
			
			//ä���� ���� �׸���
			
			//���� ���������� ����
			g.setColor(Color.RED);
			//ä�����簢�� �׸���
			g.fillRect(110, 150, 110, 80);
			//���� �ٽ� ���������� ����
			g.setColor(Color.BLACK);
			g.drawString("fillRect()", 110, 250);
			
			//ä����3D �簢�� �׸���
			//���� LIGHT_GRAY�� �����Ű��
			g.setColor(Color.LIGHT_GRAY);
			g.fill3DRect(230, 150, 110, 80, true);
			//���� �ٽ� BLACK���� �ٲ��ֱ�
			g.setColor(Color.BLACK);
			g.drawString("fill3DRect()", 230, 250);
			
			//ä���� �𼭸��� �ձ� �簢�� �׸���
			g.fillRoundRect(350, 150, 95, 80, 40, 40);
			g.drawString("fillRoundRect()", 350, 250);
			
			//ä���� ���� Ÿ�� �׸���
			g.fillOval(460, 150, 110, 80);
			g.drawString("fillOval()", 480, 250);
			
			//��ä�� �׸���
			g.fillArc(590, 150, 110, 80, 80, 100);
			g.drawString("fillArc()", 610, 250);
			
			//x��ǥ�� y��ǥ �迭
			x[0]=710;
			x[1]=810;
			x[2]=710;
			x[3]=810;
			y[0]=150;
			y[1]=150;
			y[2]=230;
			y[3]=230;
			//�ٰ��� �׸���
			g.fillPolygon(x,y,4);
			g.drawString("fillPolygon()", 720, 250);
		}
	}

	public class Test
	{
		public static void main(String[] args)
		{
			//������ ����
			JFrame frame = new JFrame();
			//������ ũ�� ���ϱ�
			frame.setSize(800, 300);
			//������ Ÿ��Ʋ ���ϱ�
			frame.setTitle("�׸���");
			//x��ư ������ �� close �ǵ���
			frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
			
			MyComponent component = new MyComponent();
			frame.add(component);
			frame.setVisible(true);
		}
	}
