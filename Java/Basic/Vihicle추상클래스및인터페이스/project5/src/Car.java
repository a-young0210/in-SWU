public class Car implements Movable {

	private int speed = 0;		// speed �ʵ� ����
	

	public void speedUp(int amount) {		// �ӵ� ��� �޼ҵ� 
	
		speed += amount;		
		System.out.println( "�ӵ��� " + amount + "km/h�� ���Դϴ�.");		
	}

	public void speedDown(int amount) {		// �ӵ� ���� �޼ҵ�
		
		speed -= amount;
		System.out.println("�ӵ��� " + amount + "km/h�� ����ϴ�.");		
	}


	public void printSpeed() {		//���� �ӵ� ��� �޼ҵ�
		
		System.out.println("����ӵ��� " + speed+ "km/h�Դϴ�.");		
		
	}
	
	public void TurnLeft()		// ��ȸ�� �˸��� ���ڿ��� ����ϴ� �޼ҵ�
	{
		System.out.println("��ȸ���մϴ�.");
	}
	
	public void TurnRight()		// ��ȸ�� �˸��� ���ڿ��� ����ϴ� �޼ҵ�
	{
		System.out.println("��ȸ���մϴ�.");
	}


}

