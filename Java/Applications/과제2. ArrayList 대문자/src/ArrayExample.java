//ArrayList 클래스를 사용하기 위한 패키지를 import 하시오.
import java.util.*;
class ArrayExample {
	public static void main(String[] args) {
		//문자열형의 ArrayList인 list 변수를 선언하고 객체를 생성하시오.
		ArrayList<String> list = new ArrayList<String>();
		//리스트에 데이터를 추가합니다.
		list.add("말");
		list.add("사자");
		list.add("토끼");
		list.add("뱀");
		int num = list.size();
		
		//리스트에 있는 데이터의 수만큼 반복문을 돌면서 데이터를 읽어 출력하시오.
		for (int cnt = 0; cnt < num; cnt++) {
			String str = list.get(cnt);
			System.out.println(str);
		}
	}
}