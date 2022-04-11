public class Car extends Vehicle {	//Car 클래스는 Vehicle 클래스를 상속

	public double getkilosPerLiter() {	//getkilosPerLiter 구현
		System.out.println("getkilosPerLiter() 재정의");
		return 12.4;
	}
}
