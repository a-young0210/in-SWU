public class VehicleTest {
	public static void main(String[] args) {
		Car c1 = new Car();	//c1 객체 생성
		System.out.println("연비는 " + c1.getkilosPerLiter() + " 입니다.");
		c1.printSpeed();
	}
}
