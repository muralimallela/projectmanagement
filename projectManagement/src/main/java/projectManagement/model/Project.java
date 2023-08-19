package projectManagement.model;

public class Project {

	private String projectID;
	private String projectTitle;
	private String description;
	private String facultyAdvisorID;
	public Project() {

	}
	public String getProjectID() {
		return projectID;
	}
	public void setProjectID(String projectID) {
		this.projectID = projectID;
	}
	public String getProjectTitle() {
		return projectTitle;
	}
	public void setProjectTitle(String projectTitle) {
		this.projectTitle = projectTitle;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getFacultyAdvisorID() {
		return facultyAdvisorID;
	}
	public void setFacultyAdvisorID(String facultyAdvisorID) {
		this.facultyAdvisorID = facultyAdvisorID;
	}
	public Project(String projectID, String projectTitle, String description, String facultyAdvisorID) {
		super();
		this.projectID = projectID;
		this.projectTitle = projectTitle;
		this.description = description;
		this.facultyAdvisorID = facultyAdvisorID;
	}

	
}
