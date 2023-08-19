<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
// Check if the user has an active session
response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");

HttpSession ses = request.getSession(false);
if (session == null || session.getAttribute("username") == null) {
	response.sendRedirect("adminLogin.jsp"); // Redirect to login page if not logged in
}
%>
<html>
<head>
<title>Faculty Management Application</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>

	<header>
		<nav class="navbar navbar-expand-md  navbar-dark"
			style="background-color: #123455">
			<a href="#" class="navbar-brand"> Faculty Management Application
			</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarNav" aria-controls="navbarNav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse justify-content-end"
				id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item"><a
						href="<%=request.getContextPath()%>/admin" class="nav-link ">Home</a></li>

					<li class="nav-item"><a
						href="<%=request.getContextPath()%>/search" class="nav-link ">Search</a></li>
					<li class="nav-item"><a
						href="<%=request.getContextPath()%>/studentReview"
						class="nav-link ">StudentReview</a></li>
					<li class="nav-item"><a
						href="<%=request.getContextPath()%>/listStudent" class="nav-link ">Students</a></li>

					<li class="nav-item"><a
						href="<%=request.getContextPath()%>/listFaculty"
						class="nav-link active">Faculty</a></li>

					<li class="nav-item"><a
						href="<%=request.getContextPath()%>/listParticipants"
						class="nav-link ">Participants</a></li>

					<li class="nav-item"><a
						href="<%=request.getContextPath()%>/listProject" class="nav-link">Projects</a></li>
					<li class="nav-item"><a class="nav-link" href="Logout">Logout</a>
					</li>
				</ul>
			</div>
		</nav>
	</header>
	<br>

	<div class="row">
		<!--  <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

		<div class="container">
			<h3 class="text-center">List of Faculty</h3>
			<hr>
			<div class="container text-left">
				<a href="<%=request.getContextPath()%>/newFaculty"
					class="btn btn-success">Add New Faculty</a>
			</div>
			<br>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>Faculty ID</th>
						<th>First Name</th>
						<th>Last Name</th>
						<th>Email</th>
						<th>Department</th>
						<th>ContactNumber</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="Faculty" items="${listFaculty}">

						<tr>
							<td><c:out value="${Faculty.facultyID}" /></td>
							<td><c:out value="${Faculty.firstName}" /></td>
							<td><c:out value="${Faculty.lastName}" /></td>
							<td><c:out value="${Faculty.email}" /></td>
							<td><c:out value="${Faculty.department}" /></td>
							<td><c:out value="${Faculty.contactNumber}" /></td>
							<td><a
								href="editFaculty?facultyID=<c:out value='${Faculty.facultyID}' />">Edit</a>
								&nbsp;&nbsp;&nbsp;&nbsp; <a
								href="deleteFaculty?facultyID=<c:out value='${Faculty.facultyID}' />">Delete</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>