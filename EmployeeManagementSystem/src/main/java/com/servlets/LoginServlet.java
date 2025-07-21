package com.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

	Login login = new Login();

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String userName = request.getParameter("email");
		String pass = request.getParameter("password");

		if (login.checkLoginDetails(userName, pass)) {

			HttpSession session = request.getSession();
			session.setAttribute("userName", userName);
			response.sendRedirect("home.jsp");
		} else {
			request.setAttribute("errorMessage", "Invalid UserName and Password");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}

	}

}

class Login {

	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/employee_management";
	String user = "javauser";
	String password = "java123";

	public boolean checkLoginDetails(String userName, String pass) {

		try {
			Class.forName(driver);
			Connection connection = DriverManager.getConnection(url, user, password);
			PreparedStatement preparedStatement = connection
					.prepareStatement("select * from employee where email=? and password=?");
			preparedStatement.setString(1, userName);
			preparedStatement.setString(2, pass);

			ResultSet resultSet = preparedStatement.executeQuery();

			if (resultSet.next()) {
				return true;
			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		return false;
	}
}
