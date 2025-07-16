package com.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.Employee;

@WebServlet("/list")
public class ListEmployeeDetails extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Employee> employeeList = new ArrayList<>();

		String url = "jdbc:mysql://localhost:3306/employee_management";
		String user = "javauser";
		String password = "java123";

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection(url, user, password);
			PreparedStatement stmt = conn.prepareStatement("SELECT * FROM employee");
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				Employee emp = new Employee();
				emp.setId(rs.getInt("id"));
				emp.setName(rs.getString("name"));
				emp.setEmail(rs.getString("email"));
				emp.setExperience(rs.getInt("experience"));
				emp.setSalary(rs.getString("salary"));

				employeeList.add(emp);
			}

			rs.close();
			stmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		req.setAttribute("employeeList", employeeList);
		req.getRequestDispatcher("employee-list.jsp").forward(req, resp);
	}
}
