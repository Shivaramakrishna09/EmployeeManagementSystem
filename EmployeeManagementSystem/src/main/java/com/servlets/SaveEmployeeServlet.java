package com.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/add")
public class SaveEmployeeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String pass = req.getParameter("password");
        int experience = Integer.parseInt(req.getParameter("experience"));
        String salary = req.getParameter("salary");

        String driver = "com.mysql.cj.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/employee_management";
        String user = "javauser";
        String password = "java123";

        Connection connection = null;
        PreparedStatement statement = null;

        try {
            Class.forName(driver);
            connection = DriverManager.getConnection(url, user, password);
            statement = connection.prepareStatement(
                "INSERT INTO employee(id, name, email, experience, salary, password) VALUES(?, ?, ?, ?, ?, ?)");
            statement.setInt(1, id);
            statement.setString(2, name);
            statement.setString(3, email);
            statement.setInt(4, experience);
            statement.setString(5, salary);
            statement.setString(6, pass);
            statement.executeUpdate();

            System.out.println("Employee inserted successfully");

        } catch (ClassNotFoundException e) {
            System.out.println("JDBC Driver not found");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("SQL Exception occurred");
            e.printStackTrace();
        } finally {
            try {
                if (statement != null) statement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        resp.sendRedirect("list");
    }
}
