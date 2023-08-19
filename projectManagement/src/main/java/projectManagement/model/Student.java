package projectManagement.model;

public class Student {
	public String studentIDCheck = "C51A";
	private String studentID;
	private String firstName;
	private String lastName;
	private String email;
	private String department;
	private int batch;
	private String contactNumber;

	public Student() {

	}
	public String getStudentIDCheck() {
		return studentIDCheck;
	}
	public Student(String studentID, String firstName, String lastName, String email, String department, int batch,
			String contactNumber) {
		super();
		this.batch = batch;
		this.studentID = studentID;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.department = department;
		this.contactNumber = contactNumber;
	}
	
	public Student( String firstName, String lastName, String email, String department, int batch,
			String contactNumber) {
		super();
		this.batch = batch;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.department = department;
		this.contactNumber = contactNumber;
	}
	public String getStudentID() {
		return studentID;
	}

	public void setStudentID(String studentID) {
		this.studentID = studentID;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public int getBatch() {
		return batch;
	}

	public void setBatch(int batch) {
		this.batch = batch;
	}

	public String getContactNumber() {
		return contactNumber;
	}

	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}

}
