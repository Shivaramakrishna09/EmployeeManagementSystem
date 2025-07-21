<%@ page import="java.util.*, com.dto.Employee"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>
<head>
<title>Employee List</title>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);

request.getSession(false);
if (session == null || session.getAttribute("userName") == null) {
	response.sendRedirect("login.jsp");
}
%>
<style>
table {
	width: 90%;
	margin: 20px auto;
	border-collapse: collapse;
}

th, td {
	padding: 12px;
	border: 1px solid #ccc;
	text-align: center;
}

th {
	background-color: #2d2d2d;
	color: white;
}

.btn-group {
	text-align: center;
	margin: 20px;
}

.btn {
	padding: 8px 16px;
	text-decoration: none;
	margin: 0 5px;
	border-radius: 4px;
	font-weight: bold;
}

.btn-back {
	background-color: #6c757d;
	color: white;
}

.btn-add {
	background-color: #28a745;
	color: white;
}

h2 {
	text-align: center;
	margin-top: 20px;
}
</style>
</head>
<body>

	<h2>Employee List</h2>

	<table>
		<thead>
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Email</th>
				<th>Experience (Years)</th>
				<th>Salary</th>
				<th>Actions</th>
			</tr>
		</thead>
		<tbody>
			<%
			List<Employee> employeeList = (List<Employee>) request.getAttribute("employeeList");
			if (employeeList != null && !employeeList.isEmpty()) {
				for (Employee emp : employeeList) {
			%>
			<tr>
				<td><%=emp.getId()%></td>
				<td><%=emp.getName()%></td>
				<td><%=emp.getEmail()%></td>
				<td><%=emp.getExperience()%></td>
				<td><%=emp.getSalary()%></td>
				<td><a href="edit?id=<%=emp.getId()%>"
					class="btn btn-warning btn-sm"><strong>Edit</strong></a> | <a
					href="delete?id=<%=emp.getId()%>"
					onclick="return confirm('Are you sure?')"><strong>Delete</strong></a></td>
			</tr>
			<%
			}
			} else {
			%>
			<tr>
				<td colspan="6">No employees found.</td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>

	<div class="btn-group">
		<a href="home.jsp" class="btn btn-back">Back to Home</a> <a
			href="add-employee.jsp" class="btn btn-add">Add New Employee</a>
	</div>

</body>
</html>
