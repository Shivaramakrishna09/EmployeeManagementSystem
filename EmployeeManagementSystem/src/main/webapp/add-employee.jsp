<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Add New Employee</title>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);

request.getSession(false);
if(session == null || session.getAttribute("userName") == null){
	response.sendRedirect("login.jsp");
}


%>
<!-- Bootstrap CSS CDN -->
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
			<h2 class="text-center mb-4">Add New Employee</h2>

			<form action="add" method="get">

				<div class="mb-3">
					<label for="id" class="form-label">Employee ID</label> <input
						type="number" name="id" id="id" class="form-control"
						placeholder="Enter Employee ID" required>
				</div>

				<div class="mb-3">
					<label for="name" class="form-label">Full Name</label> <input
						type="text" name="name" id="name" class="form-control"
						placeholder="Enter Employee Name" required>
				</div>

				<div class="mb-3">
					<label for="email" class="form-label">Email</label> <input
						type="email" name="email" id="email" class="form-control"
						placeholder="Enter Email Address" required>
				</div>

				<div class="mb-3">
					<label for="password" class="form-label">PassWord</label> <input
						type="password" name="password" id="password" class="form-control"
						placeholder="Enter Your Password" required>
				</div>

				<div class="mb-3">
					<label for="experience" class="form-label">Experience
						(Years)</label> <input type="number" name="experience" id="experience"
						class="form-control" placeholder="Enter Experience in Years"
						required>
				</div>

				<div class="mb-3">
					<label for="salary" class="form-label">Salary</label> <input
						type="number" name="salary" id="salary" class="form-control"
						placeholder="Enter Salary" required>
				</div>

				<div class="d-grid">
					<button type="submit" class="btn btn-success">Add Employee</button>
				</div>
			</form>

			<div class="mt-4 text-center">
				<a href="home.jsp" class="btn btn-outline-secondary btn-sm">Back
					to Home</a>
			</div>
		</div>
	</div>

</body>
</html>
