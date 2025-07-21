<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="com.dto.Employee"%>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);

request.getSession(false);
if (session == null || session.getAttribute("userName") == null) {
	response.sendRedirect("login.jsp");
}
%>
<%
Employee emp = (Employee) request.getAttribute("emp");
if (emp == null) {
%>
<!DOCTYPE html>
<html>
<head>
<title>Error</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body class="bg-light">
	<div class="container mt-5">
		<div class="alert alert-danger text-center">❌ Employee not
			found. Make sure the ID is valid.</div>
		<div class="text-center mt-3">
			<a href="list" class="btn btn-secondary">Back to List</a>
		</div>
	</div>
</body>
</html>
<%
return;
}
%>

<html lang="en">
<head>
<meta charset="UTF-8">
<title>Edit Employee</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background-color: #f8f9fa;
}

.container {
	margin-top: 80px;
}

.card {
	border-radius: 1rem;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

h2 {
	color: #343a40;
}

.form-label {
	font-weight: 500;
}
</style>
</head>
<body>

	<div class="container d-flex justify-content-center">
		<div class="card p-5 w-50">
			<h2 class="text-center mb-4">Edit Employee</h2>

			<!-- IMPORTANT: method="post" matches the updated servlet logic -->
			<form action="edit" method="post">
				<input type="hidden" name="id" value="<%=emp.getId()%>">

				<div class="mb-3">
					<label for="name" class="form-label">Full Name</label> <input
						type="text" name="name" id="name" class="form-control"
						placeholder="Enter Full Name" value="<%=emp.getName()%>" required>
				</div>

				<div class="mb-3">
					<label for="email" class="form-label">Email</label> <input
						type="email" name="email" id="email" class="form-control"
						placeholder="Enter Email Address" value="<%=emp.getEmail()%>"
						required>
				</div>

				<div class="mb-3">
					<label for="experience" class="form-label">Experience
						(Years)</label> <input type="number" name="experience" id="experience"
						class="form-control" placeholder="Enter Experience"
						value="<%=emp.getExperience()%>" required>
				</div>

				<div class="mb-3">
					<label for="salary" class="form-label">Salary</label> <input
						type="number" name="salary" id="salary" class="form-control"
						placeholder="Enter Salary" value="<%=emp.getSalary()%>" required>
				</div>

				<div class="d-grid">
					<button type="submit" class="btn btn-warning">Update
						Employee</button>
				</div>
			</form>

			<div class="mt-4 text-center">
				<a href="list" class="btn btn-outline-secondary btn-sm">Back to
					List</a>
			</div>
		</div>
	</div>

</body>
</html>
