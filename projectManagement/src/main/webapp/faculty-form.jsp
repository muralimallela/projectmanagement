<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Faculty Management Application</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
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
						href="<%=request.getContextPath()%>/search"
						class="nav-link ">Search</a></li>
					<li><a href="<%=request.getContextPath()%>/listStudent"
						class="nav-link ">Students</a></li>
				</ul>
				<ul class="navbar-nav">
					<li><a href="<%=request.getContextPath()%>/listFaculty"
						class="nav-link active">Faculty</a></li>
				</ul>
				<ul class="navbar-nav">
					<li><a href="<%=request.getContextPath()%>/listParticipants"
						class="nav-link ">Participants</a></li>
				</ul>
				<ul class="navbar-nav">
					<li><a href="<%=request.getContextPath()%>/listProject"
						class="nav-link">Projects</a></li>
				</ul>
			</div>
		</nav>
	</header>
	<br>
	<div class="container col-md-5">
		<div class="card">
			<div class="card-body">
				<c:if test="${Faculty != null}">
					<form action="updateFaculty" method="post">
				</c:if>
				<c:if test="${Faculty == null}">
					<form action="insertFaculty" method="post">
				</c:if>

				<caption>
					<h2>
						<c:if test="${Faculty != null}">
            			Edit Faculty
            		</c:if>
						<c:if test="${Faculty == null}">
            			Add New Faculty
            		</c:if>
					</h2>
				</caption>

				<c:if test="${Faculty != null}">
					<input type="hidden" name="facultyID"
						value="<c:out value='${Faculty.facultyID}' />" />
				</c:if>

				<c:if test="${Faculty== null}">
					<fieldset class="form-group">
						<label>Faculty ID</label> <input type="text"
							name="facultyID" id="facultyID" onblur="checkFacultyID()"
							value="<c:out value='${Faculty.facultyID}' />"
							class="form-control" name="FirstName" required="required">
					</fieldset>
					<p id="myParagraph"></p>
				</c:if>

				<c:if test="${str.contains(subStr) }">

				</c:if>
				<fieldset class="form-group">
					<label>Faculty First Name</label> <input type="text"
						value="<c:out value='${Faculty.firstName}' />"
						class="form-control" name="FirstName" required="required">
				</fieldset>
				<fieldset class="form-group">
					<label>Faculty Last Name</label> <input type="text"
						value="<c:out value='${Faculty.lastName}' />" class="form-control"
						name="LastName" required="required">
				</fieldset>

				<fieldset class="form-group">
					<label>Faculty Email</label> <input type="text"
						value="<c:out value='${Faculty.email}' />" class="form-control"
						name="Email">
				</fieldset>

				<fieldset class="form-group">
					<label>Faculty Department</label> <input type="text"
						value="<c:out value='${Faculty.department}' />"
						class="form-control" name="Department">
				</fieldset>
				<fieldset class="form-group">
					<label>Faculty Contact Number</label> <input type="text"
						value="<c:out value='${Faculty.contactNumber}' />"
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
		const facultyID = document.getElementById("facultyID");
		const paragraphElement = document.getElementById('myParagraph');
		const submitBtn = document.getElementById('submitBtn');

		let subString = "1";
		function checkFacultyID() {
			if (!facultyID.value.includes(subString)) {
				facultyID.focus();
				paragraphElement.textContent = 'Invalid faculty ID';
				submitBtn.disabled = true;
				
			} else{
				paragraphElement.textContent = 'faculty ID';
				submitBtn.disabled =false;
			}
				
			
		}
	</script>
</body>
</html>