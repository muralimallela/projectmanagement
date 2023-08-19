package projectManagement.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import projectManagement.model.Project;
import projectManagement.dao.ProjectDAO;

@WebServlet({"/insertProject","/listProject","/updateProject","/deleteProject","/newProject","/editProject"})

public class ProjectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProjectDAO projectDAO;
	
	public void init() {
		projectDAO = new ProjectDAO();
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getServletPath();
		try {
			switch (action) {

			case "/newProject":
				showNewProjectForm(request, response);
				break;
			case "/insertProject":
				insertProject(request, response);
				break;
			case "/deleteProject":
				deleteProject(request, response);
				break;
			case "/editProject":
				showProjectEditForm(request, response);
				break;
			case "/updateProject":
				updateProject(request, response);
				break;
			case "/listProject":
				listProject(request, response);
				break;
			}
		} catch (SQLException ex) {
			throw new ServletException(ex);
		}
	}
	
	private void listProject(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		List<Project> listProject = projectDAO.selectAllProjects();
		request.setAttribute("listProject", listProject);
		RequestDispatcher dispatcher = request.getRequestDispatcher("project-list.jsp");
		dispatcher.forward(request, response);
	}

	private void showNewProjectForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("project-form.jsp");
		dispatcher.forward(request, response);
	}

	private void showProjectEditForm(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		String ProjectID = request.getParameter("projectID");
		Project existingProject = projectDAO.selectProject(ProjectID);
		RequestDispatcher dispatcher = request.getRequestDispatcher("project-form.jsp");
		request.setAttribute("Project", existingProject);
		dispatcher.forward(request, response);

	}

	private void insertProject(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {

		String ProjectID = request.getParameter("projectID");
		String projectTitle = request.getParameter("projectTitle");
		String description = request.getParameter("description");
		String facultyAdvisorID = request.getParameter("facultyAdvisorID");

		Project newProject = new Project(ProjectID, projectTitle, description, facultyAdvisorID);
		projectDAO.insertProject(newProject);
		response.sendRedirect("listProject");
	}

	private void updateProject(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {
		String projectID = request.getParameter("projectID");
		String projectTitle = request.getParameter("projectTitle");
		String description = request.getParameter("description");
		String facultyAdvisorID = request.getParameter("facultyAdvisorID");
		Project book = new Project(projectID, projectTitle, description, facultyAdvisorID);
		projectDAO.updateProject(book);
		response.sendRedirect("listProject");
	}

	private void deleteProject(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {
		String projectID = request.getParameter("projectID");
		projectDAO.deleteProject(projectID);
		response.sendRedirect("listProject");

	}


}
