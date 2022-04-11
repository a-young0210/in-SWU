public class Car implements Movable {

	private int speed = 0;		// speed 필드 정의
	

	public void speedUp(int amount) {		// 속도 향상 메소드 
	
		speed += amount;		
		System.out.println( "속도를 " + amount + "km/h로 높입니다.");		
	}

	public void speedDown(int amount) {		// 속도 하향 메소드
		
		speed -= amount;
		System.out.println("속도를 " + amount + "km/h로 늦춥니다.");		
	}


	public void printSpeed() {		//현재 속도 출력 메소드
		
		System.out.println("현재속도는 " + speed+ "km/h입니다.");		
		
	}
	
	public void TurnLeft()		// 좌회전 알림을 문자열로 출력하는 메소드
	{
		System.out.println("좌회전합니다.");
	}
	
	public void TurnRight()		// 우회전 알림을 문자열로 출력하는 메소드
	{
		System.out.println("우회전합니다.");
	}


}

