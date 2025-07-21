<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login - Employee Management System</title>

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body {
	background-color: #f8f9fa;
}

.login-container {
	margin-top: 100px;
}

.card {
	padding: 30px;
	border-radius: 1rem;
	box-shadow: 0 8px 24px rgba(0, 0, 0, 0.1);
}

.btn-custom {
	width: 100%;
	padding: 10px;
	font-weight: bold;
}

.error-msg {
	color: red;
	margin-top: 10px;
}
</style>
</head>
<body>

	<div class="container login-container d-flex justify-content-center">
		<div class="card w-50">
			<h3 class="text-center mb-4">Employee Login</h3>


			<form action="LoginServlet" method="post">
				<div class="mb-3">
					<label for="email" class="form-label">Username</label> <input
						type="text" class="form-control" id="email" name="email"
						placeholder="Enter your email" required>
				</div>

				<div class="mb-3">
					<label for="password" class="form-label">Password</label> <input
						type="password" class="form-control" id="password" name="password"
						placeholder="Enter password" required>
				</div>

				<input type="submit" value="Login"
					class="btn btn-primary btn-custom">
			</form>


			<c:if test="${not empty errorMessage}">
				<p class="error-msg text-center">${errorMessage}</p>
			</c:if>
		</div>
	</div>

</body>
</html>
