import java.io.*;

//byte������� ī��
public class ByteCopy {
	public static void main(String args[]) {
		long startTime = System.currentTimeMillis();

		FileInputStream fis = null;
		FileOutputStream fos = null;
		int i;

		try
		{
			fis = new FileInputStream("�ڹ�.jpg");
			fos = new FileOutputStream("��Ŭ����.jpg");

			while ((i = fis.read()) != -1)
			{
				fos.write(i);
			}

		} catch (IOException e) {
			System.out.println("������ �������� �ʽ��ϴ�.");
		} finally {

			try
			{
				fis.close();
			} catch (IOException e)
			{
				System.out.println("������ �������� �ʽ��ϴ�.");
			}

			try	
			{
				fos.close();
			} catch (IOException e)
			{
				System.out.println("������ �������� �ʽ��ϴ�.");
			}
		}
		long endTime = System.currentTimeMillis();
		System.out.println("�ɸ� �ð���" + (endTime - startTime) + "ms�Դϴ�.");
	}
}