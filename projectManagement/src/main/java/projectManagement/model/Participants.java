package projectManagement.model;

public class Participants {

	private String participantID;
	private String projectID;
	private String studentID;
	private String role;

	public Participants() {

	}

	public Participants(String participantID, String projectID, String studentID, String role) {
		super();
		this.participantID = participantID;
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

	public String getParticipantID() {
		return participantID;
	}

	public void setParticipantID(String participantID) {
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
