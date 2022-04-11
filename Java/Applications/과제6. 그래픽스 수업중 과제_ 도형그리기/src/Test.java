import javax.swing.*;
import java.awt.*;

	@SuppressWarnings("serial")
	//컴포넌트를 상속받아서 정의
	 class MyComponent extends JComponent 
	{
		public void paintComponent(Graphics g)
		{
			//직선 그리기
			g.drawLine(10, 80, 100, 10);
			//"drawLine()" 문자열 출력하기
			g.drawString("drawLine()", 10, 100);
			//색을 빨간색으로 변경
			g.setColor(Color.RED);
			//사각형 그리기
			g.drawRect(110, 10, 110, 80);
			//색을 다시 검정색으로 변경
			g.setColor(Color.BLACK);
			//폰트 바꿔주기
			Font font = new Font("Serif",Font.BOLD,12);
			g.setFont(font);
			//"drawRect()" 문자열 출력하기
			g.drawString("drawRect()", 110, 100);
			
		
			//폰트 원래대로
			font = new Font("Dialog",Font.PLAIN,12);
			g.setFont(font);
			// ① 여기에 소스를 추가
			
			//3D 사각형 그리기
			//색을 LIGHT_GRAY로 변경시켜 3D가 잘 보이도록 
			g.setColor(Color.LIGHT_GRAY);
			g.draw3DRect(230, 10, 110, 80, true);
			//색상 다시 BLACK으로 바꿔주기
			g.setColor(Color.BLACK);
			g.drawString("draw3DRect()", 230, 100);
			
			//모서리가 둥근 사각형 그리기
			g.drawRoundRect(350, 10, 95, 80, 40, 40);
			g.drawString("drawRoundRect()", 350, 100);
			
			//내접 타원 그리기
			g.drawOval(460, 10, 110, 80);
			g.drawString("drawOval()", 480, 100);
			
			//호 그리기
			g.drawArc(590, 10, 110, 80, 50, 30);
			g.drawString("drawArc()", 610, 100);
			
			//x좌표와 y좌표 배열
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
			//다각형 그리기
			g.drawPolygon(x,y,4);
			g.drawString("drawPolygon()", 720, 100);
			
			
			//채워진 도형 그리기
			
			//색을 빨간색으로 변경
			g.setColor(Color.RED);
			//채워진사각형 그리기
			g.fillRect(110, 150, 110, 80);
			//색을 다시 검정색으로 변경
			g.setColor(Color.BLACK);
			g.drawString("fillRect()", 110, 250);
			
			//채워진3D 사각형 그리기
			//색을 LIGHT_GRAY로 변경시키기
			g.setColor(Color.LIGHT_GRAY);
			g.fill3DRect(230, 150, 110, 80, true);
			//색상 다시 BLACK으로 바꿔주기
			g.setColor(Color.BLACK);
			g.drawString("fill3DRect()", 230, 250);
			
			//채워진 모서리가 둥근 사각형 그리기
			g.fillRoundRect(350, 150, 95, 80, 40, 40);
			g.drawString("fillRoundRect()", 350, 250);
			
			//채워진 내접 타원 그리기
			g.fillOval(460, 150, 110, 80);
			g.drawString("fillOval()", 480, 250);
			
			//부채꼴 그리기
			g.fillArc(590, 150, 110, 80, 80, 100);
			g.drawString("fillArc()", 610, 250);
			
			//x좌표와 y좌표 배열
			x[0]=710;
			x[1]=810;
			x[2]=710;
			x[3]=810;
			y[0]=150;
			y[1]=150;
			y[2]=230;
			y[3]=230;
			//다각형 그리기
			g.fillPolygon(x,y,4);
			g.drawString("fillPolygon()", 720, 250);
		}
	}

	public class Test
	{
		public static void main(String[] args)
		{
			//프레임 생성
			JFrame frame = new JFrame();
			//프레임 크기 정하기
			frame.setSize(800, 300);
			//프레임 타이틀 정하기
			frame.setTitle("그리기");
			//x버튼 눌렀을 때 close 되도록
			frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
			
			MyComponent component = new MyComponent();
			frame.add(component);
			frame.setVisible(true);
		}
	}
