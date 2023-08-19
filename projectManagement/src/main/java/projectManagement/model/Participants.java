package projectManagement.model;

public class Participants {

	private int participantID;
	private String projectID;
	private String studentID;
	private String role;

	public Participants() {

	}

	public Participants(int participantID, String projectID, String studentID, String role) {
		super();
		this.participantID = participantID;
		this.projectID = projectID;
		this.studentID = studentID;
		this.role = role;
	}
	
	public Participants(String projectID, String studentID, String role) {
		super();
		
		this.projectID = projectID;
		this.studentID = studentID;
		this.role = role;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public int getParticipantID() {
		return participantID;
	}

	public void setParticipantID(int participantID) {
		this.participantID = participantID;
	}

	public String getProjectID() {
		return projectID;
	}

	public void setProjectID(String projectID) {
		this.projectID = projectID;
	}

	public String getStudentID() {
		return studentID;
	}

	public void setStudentID(String studentID) {
		this.studentID = studentID;
	}

}
