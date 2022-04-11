public abstract class Vehicle {
	private int speed;	// speed 필드 정의
	public abstract double getkilosPerLiter();
	public void printSpeed()		//현재 속도 출력하는 메소드
	{
		System.out.println("현재 속도는" + speed + "입니다.");
	}
}
