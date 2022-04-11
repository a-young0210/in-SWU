import java.io.*;

import java.util.*;

class FileExample1 {
	public static void main(String args[]) {
		File file = new File(".");
		File arr[] = file.listFiles();
		for (int cnt = 0; cnt < arr.length; cnt++) {
			String name = arr[cnt].getName();
			if (arr[cnt].isFile())
				System.out.printf(name, arr[cnt].length());
			else
				System.out.printf(name);
			long time = arr[cnt].lastModified();
			GregorianCalendar calendar = new GregorianCalendar();
			calendar.setTimeInMillis(time);
			System.out.println(calendar);
		}
	}
}
