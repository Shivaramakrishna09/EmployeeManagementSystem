<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Employee Management System</title>

<!-- Bootstrap CSS CDN -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body {
	background-color: #f8f9fa;
}

.container {
	margin-top: 100px;
}

.card {
	border-radius: 1rem;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

h2 {
	color: #343a40;
}

.btn-custom {
	width: 100%;
	padding: 12px;
	margin-bottom: 15px;
	font-weight: bold;
}
</style>
</head>
<body>

	<%
	
		if(session == null || session.getAttribute("userName") == null){
			response.sendRedirect("login.jsp");
			return;
		}
	
	%>

	<div class="container d-flex justify-content-center">
		<div class="card p-5 w-50 text-center">
			<h2 class="mb-4">Employee Management System</h2>

			<!-- Updated links -->
			<a href="list" class="btn btn-primary btn-custom">View Employees</a>
			<a href="add-employee.jsp" class="btn btn-success btn-custom">Add
				New Employee</a>
		</div>
	</div>

</body>
</html>
