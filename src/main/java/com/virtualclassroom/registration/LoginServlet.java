package com.virtualclassroom.registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uname = request.getParameter("username");
        String pass = request.getParameter("password");
        HttpSession session=request.getSession();
        RequestDispatcher dispatcher = null;
        //System.out.println("Received username: " + uname);
        //System.out.println("Received password: " + pass);

        try {
            // Register the driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            //System.out.println("MySQL JDBC Driver registered");

            // Establish The connection
            String url = "jdbc:mysql://localhost:3306/virtual_classroom";
            Connection conn = DriverManager.getConnection(url, "root", "Password@123");
            //System.out.println("Connection established");
            PreparedStatement pst = conn.prepareStatement("select * from users where Username = ? and Password = ?");
            pst.setString(1, uname);
            pst.setString(2, pass);
            ResultSet rs=pst.executeQuery();
            if (rs.next()) {
                session.setAttribute("name", rs.getString("Username"));
                response.sendRedirect("index.jsp"); // Redirect to index.jsp
            } else {
                request.setAttribute("status", "fail");
                response.sendRedirect("login.jsp");
                //dispatcher.forward(request, response);
                System.out.print("autheticaltion failed");
                // Add logic to handle authentication failure (e.g., display error message)
            }
            
            // Perform further operations with the database here

        } catch (ClassNotFoundException cnfe) {
            System.err.println("Failed to load MySQL JDBC Driver: " + cnfe.getMessage());
            cnfe.printStackTrace();
        } catch (SQLException e) {
            System.err.println("SQLException occurred: " + e.getMessage());
            e.printStackTrace();
        } catch (Exception e) {
            System.err.println("An unexpected error occurred: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
