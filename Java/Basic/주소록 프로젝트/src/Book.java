import java.io.*;

public class Book {
//Book 클래스 
	
	public int index, count = 0;
	private Person[] addressBook;;	//Person 클래스 객체 배열
	
	int max = 0;
	
	public Book(int n, DataOutputStream out) throws IOException {  // n을 받아와서 addressBook의 크기를 정해준다.
		addressBook = new Person[n];
		 FileInputStream fin;
         DataInputStream in;
		
		try {
			fin = new FileInputStream("file1.dat");
			in = new DataInputStream(fin);
			
			//setNumberOfPerson(in);
            readFile(in);
            in.close();
	
		}
		catch(FileNotFoundException e){
			count = 0;
		}
		catch(IOException e) {
			System.out.println("파일에 접근할 수 없습니다.");

		}
	}
	
	
	public void addPerson(Person addPerson) throws Exception {	//추가하고 싶은 객체의 데이터 입력 받기
		
		addressBook[index] = addPerson;
		index++;
		
	}
	
	 public int searchName(String s_name) throws Exception{ //이름을 입력받아 index값 반환

		 for(int i = 0; i < index; i++)
		 {
			 if(s_name.equals(addressBook[i].getName()))
			 {
				 return i;
			 }
			 
		 }
		 throw new Exception(); //조건에 맞는 객체를 찾지 못했을 때
	}
	
	public void modifyPerson(String m_name, Person p) throws Exception {	//수정하고 싶은 객체 입력 받기
		
		int m_index = searchName(m_name);
		addressBook[m_index] = p;
		
	}
	
	public void deletePerson(String d_name) throws Exception {	//삭제하고 싶은 객체 입력 받기
		
		int d_index = searchName(d_name);
		
		if (d_index > -1) {
			for (int i = d_index; i < index; i++)
			{
				addressBook[i] = addressBook[i + 1];
			}
			index--;
		}
	}
	
	public void writeFile(DataOutputStream out) throws IOException {
	    try {

	      out.writeInt(count);
	      for(int i = 0; i < index; i++) {
	    	  addressBook[i].writeMyField(out);
	      }
	      
	    }catch(IOException ioe) {
	    	System.out.println("파일에 접근할 수 없습니다.");

	    }
	}
	
	
	public void readFile(DataInputStream in) throws FileNotFoundException, IOException {
			
			try {
				count = in.readInt();
		    	Person p = null;
		    	for(int i = 0; i < index; i++) {
		    		p = new Person();
		    		p.readMyField(in);
		    		addressBook[i] = p;
		    	}    	 
		    	
		    }
		    	catch(FileNotFoundException eofe) {
					System.out.println("해당하는 파일이 없습니다.");
		    	}
		    	catch(IOException e) {
					System.out.println("파일을 읽어올 수 없습니다.");
		    	}
			}
	
	
		
	public Person[] getAddressBook() {
		return addressBook;
	}

	public void setIndex(int index) {	//index 접근자
		this.index = index;
	}
	
	public int getIndex() {		//index 변경자
		return index;
	}

}