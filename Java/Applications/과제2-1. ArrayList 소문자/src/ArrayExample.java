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
		
		System.out.println("입력한 동물을 출력합니다...");
		printInfo(list);
		System.out.println("사자를 호랑이로 변경합니다...");
		
		//사자를 검색해서 호랑이로 변경하는 문장을 작성하시오.
		int index1 = list.indexOf("사자");
		list.set(index1, "호랑이");
		printInfo(list);
		
		System.out.println("3번째 항목에 원숭이를 첨가합니다.");
		//3번째 항목에 원숭이를 첨가하는 문장을 작성하시오.
		list.add(3, "원숭이");
		printInfo(list);
		
		System.out.println("뱀을 검색하여 삭제합니다...");
		//뱀을 검색하여 삭제합니다.
		int index2 = list.indexOf("뱀");
		list.remove(index2);
		printInfo(list);
	}
		
		//ArrayList형의 list를 입력받아 항목들을 출력하는 메소드를 작성하시오.
		public static void printInfo(ArrayList<String> list) {
			int num = list.size();
			for (int cnt = 0; cnt < num; cnt++) {
				String str = list.get(cnt);
				System.out.println(str);
		}
	}
}