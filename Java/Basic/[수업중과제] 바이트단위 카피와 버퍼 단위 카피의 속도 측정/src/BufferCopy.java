import java.io.*;

//buffer 방식으로 copy
public class BufferCopy {
	public static void main(String[] args) {
		FileInputStream inputStream = null;
		FileOutputStream outputStream = null;
		BufferedInputStream bin = null;
		BufferedOutputStream bout = null;

		try {
			inputStream = new FileInputStream("자바.jpg");
			outputStream = new FileOutputStream("이클립스.jpg");

			bin = new BufferedInputStream(inputStream, 1024);
			bout = new BufferedOutputStream(outputStream, 1024);

			long startTime = System.currentTimeMillis();

			byte[] buffer = new byte[1024];
			int readcount = 0;
			while ((readcount = bin.read(buffer)) != -1) {
				bout.write(buffer, 0, readcount);
			}

			long endTime = System.currentTimeMillis();

			System.out.println("걸린시간은 " + (endTime - startTime) + "ms입니다.");

		} catch (IOException e) {
			System.out.println("사진이 존재하지 않습니다.");
		} finally {
			try {
				if (bin != null)
					bin.close();
				if (bout != null)
					bout.close();
			} catch (IOException ex) {
				System.out.println("사진이 존재하지 않습니다.");
			}
		}
	}
}