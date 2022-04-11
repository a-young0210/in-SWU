public class Test1
	{
		public static void main(String args[])
		{
			//객체 h1, h2, h3생성
			Human h1 = new Human("춘향", 18);
			Human h2 = new Human("몽룡", 21);
			Human h3 = new Human("사또",50);
			
			//출력
			System.out.println(h1);
			System.out.println(h2);
			System.out.println(h3);
			
			System.out.println();
			
			//객체 s1, s2, s3 생성
			Student s1 = new Student("명진", 21, "컴퓨터공학");
			Student s2 = new Student("미현", 22, "유아교육");
			Student s3 = new Student("용준", 24, "애니메이션");
			
			//출력
			System.out.println(s1);
			System.out.println(s2);
			System.out.println(s3);
			
		}
	}
	