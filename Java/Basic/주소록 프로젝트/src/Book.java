import java.io.*;

public class Book {
//Book Ŭ���� 
	
	public int index, count = 0;
	private Person[] addressBook;;	//Person Ŭ���� ��ü �迭
	
	int max = 0;
	
	public Book(int n, DataOutputStream out) throws IOException {  // n�� �޾ƿͼ� addressBook�� ũ�⸦ �����ش�.
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
			System.out.println("���Ͽ� ������ �� �����ϴ�.");

		}
	}
	
	
	public void addPerson(Person addPerson) throws Exception {	//�߰��ϰ� ���� ��ü�� ������ �Է� �ޱ�
		
		addressBook[index] = addPerson;
		index++;
		
	}
	
	 public int searchName(String s_name) throws Exception{ //�̸��� �Է¹޾� index�� ��ȯ

		 for(int i = 0; i < index; i++)
		 {
			 if(s_name.equals(addressBook[i].getName()))
			 {
				 return i;
			 }
			 
		 }
		 throw new Exception(); //���ǿ� �´� ��ü�� ã�� ������ ��
	}
	
	public void modifyPerson(String m_name, Person p) throws Exception {	//�����ϰ� ���� ��ü �Է� �ޱ�
		
		int m_index = searchName(m_name);
		addressBook[m_index] = p;
		
	}
	
	public void deletePerson(String d_name) throws Exception {	//�����ϰ� ���� ��ü �Է� �ޱ�
		
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
	    	System.out.println("���Ͽ� ������ �� �����ϴ�.");

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
					System.out.println("�ش��ϴ� ������ �����ϴ�.");
		    	}
		    	catch(IOException e) {
					System.out.println("������ �о�� �� �����ϴ�.");
		    	}
			}
	
	
		
	public Person[] getAddressBook() {
		return addressBook;
	}

	public void setIndex(int index) {	//index ������
		this.index = index;
	}
	
	public int getIndex() {		//index ������
		return index;
	}

}