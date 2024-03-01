package com.virtualclassroom.registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

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
        Connection conn=null;
        RequestDispatcher dispatcher = null;
        
        try {
            // Register the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish the connection
            String url = "jdbc:mysql://localhost:3306/virtual_classroom";
            String dbUsername = "root";
            String dbPassword = "Password@123";
            conn = DriverManager.getConnection(url, dbUsername, dbPassword);

            // Print "Connection successful"
            System.out.println("Connection successful");
            
            PreparedStatement pst = conn.prepareStatement("insert into users (name,Username,Password,roleid) values(?,?,?,?)");
            pst.setString(1, name);
            pst.setString(2, username);
            pst.setString(3, password);
            pst.setString(4, role);
		// this is forign key
            int rowCount=pst.executeUpdate();
            
            dispatcher = request.getRequestDispatcher("/register.jsp");
            if (rowCount>0) {
            	request.setAttribute("status", "success");
            	 
            }
            else {
            	request.setAttribute("status", "fail");
            }
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
        	try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        }
    }
}
