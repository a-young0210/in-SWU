import java.io.*;

//buffer ������� copy
public class BufferCopy {
	public static void main(String[] args) {
		FileInputStream inputStream = null;
		FileOutputStream outputStream = null;
		BufferedInputStream bin = null;
		BufferedOutputStream bout = null;

		try {
			inputStream = new FileInputStream("�ڹ�.jpg");
			outputStream = new FileOutputStream("��Ŭ����.jpg");

			bin = new BufferedInputStream(inputStream, 1024);
			bout = new BufferedOutputStream(outputStream, 1024);

			long startTime = System.currentTimeMillis();

			byte[] buffer = new byte[1024];
			int readcount = 0;
			while ((readcount = bin.read(buffer)) != -1) {
				bout.write(buffer, 0, readcount);
			}

			long endTime = System.currentTimeMillis();

			System.out.println("�ɸ��ð��� " + (endTime - startTime) + "ms�Դϴ�.");

		} catch (IOException e) {
			System.out.println("������ �������� �ʽ��ϴ�.");
		} finally {
			try {
				if (bin != null)
					bin.close();
				if (bout != null)
					bout.close();
			} catch (IOException ex) {
				System.out.println("������ �������� �ʽ��ϴ�.");
			}
		}
	}
}