import javax.swing.*;
import java.awt.*;

	 @SuppressWarnings("serial")
	class MyComponent extends JComponent 
	{
		public void paintComponent(Graphics g)
		{
			//반지름이 60px인 원
			g.drawOval(20, 20, 120, 120);
			g.drawString("반지름 : 60px", 50, 80);
			
			//반지름 75px인 빨간색 원
			g.setColor(Color.RED);
			g.drawOval(160, 20, 150, 150);
			g.drawString("반지름 : 75px", 200, 100);
			
			//반지름 50px인 주황색 원
			g.setColor(new Color(255,140,0));
			g.drawOval(330, 20, 100, 100);
			g.drawString("반지름 : 50px", 350, 75);
			
			//반지름 65px인 초록색 원
			g.setColor(new Color(0,100,0));
			g.drawOval(450, 20, 130, 130);
			g.drawString("반지름 : 65px", 480, 90);
			
			//반지름 40px인 연두색 원
			g.setColor(Color.GREEN);
			g.drawOval(600, 20, 80, 80);
			g.drawString("반지름 : 40px", 610, 60);
			
			//반지름 55px인 보라색 원
			g.setColor(Color.MAGENTA);
			g.drawOval(700, 20, 110, 110);
			g.drawString("반지름 : 55px", 720, 80);
			
			//반지름 45px인 파란색 원
			g.setColor(Color.BLUE);
			g.drawOval(830, 20, 90, 90);
			g.drawString("반지름 : 45px", 840, 70);
			
			//반지름 90px인 연두색 원
			g.setColor(new Color(34,139,34));
			g.drawOval(20, 170, 180, 180);
			g.drawString("반지름 : 90px", 80, 260);
			
			//반지름 125px인 갈색 원
			g.setColor(new Color(139,69,19));
			g.drawOval(220, 170, 250, 250);
			g.drawString("반지름 : 125px", 320, 290);
			
			//반지름 175px인 하늘색 원
			g.setColor(new Color(70,130,180));
			g.drawOval(490, 170, 350, 350);
			g.drawString("반지름 : 175px", 630, 350);
		}

	}

	public class Test
	{
		public static void main(String[] args)
		{
			JFrame frame = new JFrame();
			frame.setSize(800, 300);
			frame.setTitle("그리기");
			frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
			MyComponent component = new MyComponent();
			frame.add(component);
			frame.setVisible(true);
		}
	}
