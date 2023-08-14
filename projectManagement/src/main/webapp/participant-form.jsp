<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Participants Management Application</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<body>

	<header>
		<nav class="navbar navbar-expand-md  navbar-dark"
			style="background-color: #123455">
			<a href="#" class="navbar-brand"> Participants Management
				Application </a>
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
					<li><a href="<%=request.getContextPath()%>/listStudent"
						class="nav-link ">Students</a></li>
				</ul>
				<ul class="navbar-nav">
					<li><a href="<%=request.getContextPath()%>/listFaculty"
						class="nav-link">Faculty</a></li>
				</ul>
				<ul class="navbar-nav">
					<li><a href="<%=request.getContextPath()%>/listParticipants"
						class="nav-link active">Participants</a></li>
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
				<c:if test="${Participants != null}">
					<form action="updateParticipant" method="post">
				</c:if>
				<c:if test="${Participants == null}">
					<form action="insertParticipant" method="post">
				</c:if>

				<caption>
					<h2>
						<c:if test="${Participants != null}">
            			Edit Participant
            		</c:if>
						<c:if test="${Participants == null}">
            			Add New Participant
            		</c:if>
					</h2>
				</caption>

				<c:if test="${Participants != null}">
					<input type="hidden" name="participantID"
						value="<c:out value='${Participants.participantID}' />" />
				</c:if>

				<c:if test="${Participants == null}">
					<fieldset class="form-group">
						<label>Participant ID</label> <input type="text"
							name="participantID" id="participantID"
							onblur="checkparticipantID()"
							value="<c:out value='${Participants.participantID}' />"
							class="form-control" name="participantID" required="required">
					</fieldset>
					<p id="myParagraph"></p>
				</c:if>

				<fieldset class="form-group">
					<label>Project ID</label> <input type="text"
						value="<c:out value='${Participants.projectID}' />"
						class="form-control" name="projectID" required="required">
				</fieldset>
				<fieldset class="form-group">
					<label>Student ID</label> <input type="text"
						value="<c:out value='${Participants.studentID}' />"
						class="form-control" name="studentID" required="required">
				</fieldset>

				<fieldset class="form-group">
					<label>Role</label> <input type="text"
						value="<c:out value='${Participants.role}' />"
						class="form-control" name="Email">
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

			} else {
				paragraphElement.textContent = 'faculty ID';
				submitBtn.disabled = false;
			}

		}
	</script>
</body>
</html>