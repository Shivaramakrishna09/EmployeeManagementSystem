package com.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.Employee;

@WebServlet("/edit")
public class EditEmployeeServlet extends HttpServlet {
    
    // Load driver once when servlet initializes
    @Override
    public void init() throws ServletException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new ServletException("MySQL Driver not found", e);
        }
    }
    
    // Handle GET request - Load employee data for editing
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        
        String idParam = req.getParameter("id");
        if (idParam == null || idParam.trim().isEmpty()) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Employee ID is required");
            return;
        }
        
        try {
            int id = Integer.parseInt(idParam);
            Employee emp = getEmployeeById(id);
            
            if (emp != null) {
                req.setAttribute("emp", emp);
                req.getRequestDispatcher("edit-employee.jsp").forward(req, resp);
            } else {
                resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Employee not found");
            }
        } catch (NumberFormatException e) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid employee ID");
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error");
        }
    }
    
    // Handle POST request - Update employee data
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        
        req.setCharacterEncoding("UTF-8");
        
        // Validate all required parameters
        String idParam = req.getParameter("id");
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String expParam = req.getParameter("experience");
        String salary = req.getParameter("salary");
        
        // Check for null or empty values
        if (idParam == null || name == null || email == null || 
            expParam == null || salary == null ||
            idParam.trim().isEmpty() || name.trim().isEmpty() || 
            email.trim().isEmpty() || expParam.trim().isEmpty() || 
            salary.trim().isEmpty()) {
            
            resp.getWriter().println("❌ Error: All fields are required");
            return;
        }
        
        try {
            int id = Integer.parseInt(idParam);
            int experience = Integer.parseInt(expParam);
            
            // Update employee in database
            boolean updated = updateEmployee(id, name.trim(), email.trim(), experience, salary.trim());
            
            if (updated) {
                resp.sendRedirect("list");
            } else {
                resp.getWriter().println("❌ Update failed — employee not found.");
            }
            
        } catch (NumberFormatException e) {
            resp.getWriter().println("❌ Error: Invalid number format");
        } catch (Exception e) {
            e.printStackTrace();
            resp.getWriter().println("❌ Error: " + e.getMessage());
        }
    }
    
    // Helper method to get employee by ID
    private Employee getEmployeeById(int id) throws Exception {
        String sql = "SELECT * FROM employee WHERE id = ?";
        
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                Employee emp = new Employee();
                emp.setId(rs.getInt("id"));
                emp.setName(rs.getString("name"));
                emp.setEmail(rs.getString("email"));
                emp.setExperience(rs.getInt("experience"));
                emp.setSalary(rs.getString("salary"));
                return emp;
            }
        }
        return null;
    }
    
    // Helper method to update employee
    private boolean updateEmployee(int id, String name, String email, int experience, String salary) 
            throws Exception {
        
        String sql = "UPDATE employee SET name=?, email=?, experience=?, salary=? WHERE id=?";
        
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, name);
            stmt.setString(2, email);
            stmt.setInt(3, experience);
            stmt.setString(4, salary);
            stmt.setInt(5, id);
            
            int rowsUpdated = stmt.executeUpdate();
            return rowsUpdated > 0;
        }
    }
    
    // Helper method to get database connection
    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/employee_management", 
            "javauser", 
            "java123"
        );
    }
}