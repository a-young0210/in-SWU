public abstract class Vehicle {
	private int speed;	// speed �ʵ� ����
	public abstract double getkilosPerLiter();
	public void printSpeed()		//���� �ӵ� ����ϴ� �޼ҵ�
	{
		System.out.println("���� �ӵ���" + speed + "�Դϴ�.");
	}
}
