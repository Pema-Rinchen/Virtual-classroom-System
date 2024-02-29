package com.virtualclassroom.registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

@WebServlet("/register")
public class RegistrationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve form parameters
        String name = request.getParameter("name");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        // Basic validation
        if (name == null || username == null || password == null || role == null ||
            name.isEmpty() || username.isEmpty() || password.isEmpty() || role.isEmpty()) {
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<h3>Please fill in all fields</h3>");
            return;
        }

        Connection conn = null;

        try {
            // Register the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish the connection
            String url = "jdbc:mysql://localhost:3306/java";
            String dbUsername = "root";
            String dbPassword = "Password@123";
            conn = DriverManager.getConnection(url, dbUsername, dbPassword);

            // Print "Connection successful"
            System.out.println("Connection successful");

            // Perform further processing (insert into database, etc.)
            // This is where you would insert the registration data into your database
            // using a PreparedStatement or other database manipulation logic.
        } catch (Exception e) {
            e.printStackTrace();
            // Handle database connection or other errors
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<h3>Error: " + e.getMessage() + "</h3>");
        } finally {
            // Close the connection
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }
}
