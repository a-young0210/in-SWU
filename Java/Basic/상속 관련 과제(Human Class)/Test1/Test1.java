public class Test1
	{
		public static void main(String args[])
		{
			//��ü h1, h2, h3����
			Human h1 = new Human("����", 18);
			Human h2 = new Human("����", 21);
			Human h3 = new Human("���",50);
			
			//���
			System.out.println(h1);
			System.out.println(h2);
			System.out.println(h3);
			
			System.out.println();
			
			//��ü s1, s2, s3 ����
			Student s1 = new Student("����", 21, "��ǻ�Ͱ���");
			Student s2 = new Student("����", 22, "���Ʊ���");
			Student s3 = new Student("����", 24, "�ִϸ��̼�");
			
			//���
			System.out.println(s1);
			System.out.println(s2);
			System.out.println(s3);
			
		}
	}
	