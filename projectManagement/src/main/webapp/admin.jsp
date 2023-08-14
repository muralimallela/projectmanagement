<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
	<header>
		<nav class="navbar navbar-expand-md  navbar-dark"
			style="background-color: #123455">
			<a href="#" class="navbar-brand"> Admin
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
						href="<%=request.getContextPath()%>/admin" class="nav-link active">Home</a></li>
					<li class="nav-item"><a
						href="<%=request.getContextPath()%>/search" class="nav-link ">Search</a></li>
					<li class="nav-item"><a
						href="<%=request.getContextPath()%>/listStudent" class="nav-link ">Students</a></li>

					<li class="nav-item"><a
						href="<%=request.getContextPath()%>/listFaculty"
						class="nav-link">Faculty</a></li>

					<li class="nav-item"><a
						href="<%=request.getContextPath()%>/listParticipants"
						class="nav-link ">Participants</a></li>

					<li class="nav-item"><a
						href="<%=request.getContextPath()%>/listProject" class="nav-link">Projects</a></li>
				</ul>
			</div>
		</nav>
	</header>
	<div class="container" style="margin-top:50px">
        <div class="row r">
            <div class="col-2"><a href="search" style="text-decoration:none">
                <button class="btn btn-primary btn-block" style="height: 150px; width: 180px"><h3>Search</h3></button></a>
            </div>
             <div class="col-2"><a href="listStudent" style="text-decoration:none">
                <button class="btn btn-primary btn-block" style="height: 150px; width: 180px"><h3>Students</h3></button></a>
            </div>
             <div class="col-2"><a href="listFaculty" style="text-decoration:none">
                <button class="btn btn-primary btn-block" style="height: 150px; width: 180px"><h3>Faculty</h3></button></a>
            </div>
             <div class="col-2"><a href="listParticipants" style="text-decoration:none">
                <button class="btn btn-primary btn-block" style="height: 150px; width: 180px"><h3>Participants</h3></button></a>
            </div>
             <div class="col-2"><a href="listProject" style="text-decoration:none">
                <button class="btn btn-primary btn-block" style="height: 150px; width: 180px"><h3>Projects</h3></button></a>
            </div>
           
        </div>

    </div>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>