import java.io.*;

//byte방식으로 카피
public class ByteCopy {
	public static void main(String args[]) {
		long startTime = System.currentTimeMillis();

		FileInputStream fis = null;
		FileOutputStream fos = null;
		int i;

		try
		{
			fis = new FileInputStream("자바.jpg");
			fos = new FileOutputStream("이클립스.jpg");

			while ((i = fis.read()) != -1)
			{
				fos.write(i);
			}

		} catch (IOException e) {
			System.out.println("사진이 존재하지 않습니다.");
		} finally {

			try
			{
				fis.close();
			} catch (IOException e)
			{
				System.out.println("사진이 존재하지 않습니다.");
			}

			try	
			{
				fos.close();
			} catch (IOException e)
			{
				System.out.println("사진이 존재하지 않습니다.");
			}
		}
		long endTime = System.currentTimeMillis();
		System.out.println("걸린 시간은" + (endTime - startTime) + "ms입니다.");
	}
}