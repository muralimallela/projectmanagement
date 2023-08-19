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
<title>Student Management Application</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>

<body>

	<header>
		<nav class="navbar navbar-expand-md  navbar-dark"
			style="background-color: #123455">
			<a href="#" class="navbar-brand"> Student Management Application
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
					<li><a href="<%=request.getContextPath()%>/listStudent"
						class="nav-link active">Students</a></li>
				</ul>
				<ul class="navbar-nav">
					<li><a href="<%=request.getContextPath()%>/listFaculty"
						class="nav-link">Faculty</a></li>
				</ul>
				<ul class="navbar-nav">
					<li><a href="<%=request.getContextPath()%>/listParticipants"
						class="nav-link">Participants</a></li>
				</ul>
				<ul class="navbar-nav">
					<li><a href="<%=request.getContextPath()%>/listProject"
						class="nav-link">Projects</a></li>
					<li class="nav-item"><a class="nav-link" href="Logout">Logout</a>
					</li>
				</ul>
			</div>
		</nav>
	</header>
	<br>
	<div class="container col-md-5">
		<div class="card">
			<div class="card-body">
				<c:if test="${Student != null}">
					<form action="updateStudent" method="post">
				</c:if>
				<c:if test="${Student == null}">
					<form action="insertStudent" method="post">
				</c:if>

				<caption>
					<h2>
						<c:if test="${Student != null}">
									Edit Student
								</c:if>
						<c:if test="${Student == null}">
									Add New Student
								</c:if>
					</h2>
				</caption>

				<c:if test="${Student != null}">
					<input type="hidden" name="StudentID"
						value="<c:out value='${Student.studentID}' />" />
				</c:if>

				<c:if test="${Student== null}">
					<fieldset class="form-group">
						<label>Student Student ID</label> <input type="text"
							name="StudentID" id="StudentID" onblur="checkStudentID()"
							value="<c:out value='${Student.studentID}' />"
							class="form-control" name="FirstName" required="required">
					</fieldset>
					<p id="myParagraph"></p>
				</c:if>

				<c:if test="${str.contains(subStr) }">

				</c:if>
				<fieldset class="form-group">
					<label>Student First Name</label> <input type="text"
						value="<c:out value='${Student.firstName}' />"
						class="form-control" name="FirstName" required="required">
				</fieldset>
				<fieldset class="form-group">
					<label>Student Last Name</label> <input type="text"
						value="<c:out value='${Student.lastName}' />" class="form-control"
						name="LastName" required="required">
				</fieldset>

				<fieldset class="form-group">
					<label>Student Email</label> <input type="text"
						value="<c:out value='${Student.email}' />" class="form-control"
						name="Email">
				</fieldset>
				<fieldset class="form-group">
					<label>Student Batch Year</label> <input type="text"
						value="<c:out value='${Student.batch}' />" class="form-control"
						name="BatchYear">
				</fieldset>

				<fieldset class="form-group">
					<label>Student Department</label> <input type="text"
						value="<c:out value='${Student.department}' />"
						class="form-control" name="Department">
				</fieldset>
				<fieldset class="form-group">
					<label>Student Contact Number</label> <input type="text"
						value="<c:out value='${Student.contactNumber}' />"
						class="form-control" name="ContactNumber">
				</fieldset>

				<button type="submit" id="submitBtn" class="btn btn-success">Save</button>
				</form>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

	<script type="text/javascript">
		const StudentID = document.getElementById("StudentID");
		const paragraphElement = document.getElementById('myParagraph');
		const submitBtn = document.getElementById('submitBtn');

		let subString = "C51A";
		function checkStudentID() {
			if (!StudentID.value.includes(subString)) {
				StudentID.focus();
				paragraphElement.textContent = 'Invalid student ID';
				submitBtn.disabled = true;

			} else {
				paragraphElement.textContent = 'student ID';
				submitBtn.disabled = false;
			}
		}
	</script>
</body>

</html>