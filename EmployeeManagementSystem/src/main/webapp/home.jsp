<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%
	
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);

%>
<%
request.getSession(false);
if (session == null || session.getAttribute("userName") == null) {
	response.sendRedirect("login.jsp");
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home - Employee Management System</title>

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body {
	background-color: #eef2f7;
}

.container {
	margin-top: 80px;
}

.card {
	border-radius: 1rem;
	box-shadow: 0 6px 16px rgba(0, 0, 0, 0.1);
	padding: 30px;
}

.btn-custom {
	width: 100%;
	padding: 12px;
	font-weight: bold;
	margin-bottom: 15px;
}

.header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 25px;
}
</style>
</head>
<body>

	<div class="container">
		<div class="card">
			<div class="header">
				<h3>
					Welcome, Employee Portal
				</h3>
				<a href="LogoutServlet" class="btn btn-danger">Logout</a>
			</div>

			<hr>

			<div class="d-grid gap-3">
				<a href="list" class="btn btn-primary btn-custom">View Employees</a>
				<a href="add-employee.jsp" class="btn btn-success btn-custom">Add
					New Employee</a>
			</div>
		</div>
	</div>

</body>
</html>
