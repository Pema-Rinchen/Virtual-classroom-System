<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard</title>
<style>
    section {
        color: white;
        padding: 10px;
        display: flex;
        height: 95vh;
    }
    .left {
        background-color: limegreen;
        float: left;
        width: 10%;
    }
    .mid {
        background-color: orange;
        float: left;
        width: 65%;
    }
    .right {
        background-color: black;
        float: left;
        width: 20%;
    }
    .photo {
        border-radius: 100px;
        width: 60px;
        height: 60px;
    }
    .progress-bar-wrap {
        width: 100%;
        background-color: #f3f3f3;
        border-radius: 5px;
        overflow: hidden;
    }
    .progress-bar {
        height: 20px;
        background-color: #4caf50;
    }
</style>
</head>
<body>
    <section class="left">
        <div class="profile">
            <img src="Screenshot 2024-02-22 230913.png" class="photo">
            <a><%= session.getAttribute("name") %></a>
            <div>
                <a>Overview</a><br>
                <a>Assignments</a><br>
                <a>Courses</a><br>
                <a>Attendance</a><br>
                <a href="logout">Logout</a> <!-- Assuming logout functionality -->
            </div>
        </div>
    </section>
    <section class="mid">
        <p>a,sdnasdas s</p>
    </section>
    <section class="right">
        <%
            String user = (String) session.getAttribute("name");
            int totalClasses = 10;
            int attendedClasses = 4;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/virtual_classroom", "root", "Password@123");
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT COUNT(*) FROM classes WHERE user='" + user + "'");
                if (rs.next()) {
                    totalClasses = rs.getInt(1);
                }
                rs = stmt.executeQuery("SELECT COUNT(*) FROM attendance WHERE user='" + user + "' AND status='Present'");
                if (rs.next()) {
                    attendedClasses = rs.getInt(1);
                }
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            int percentage = (int) (((double) attendedClasses / totalClasses) * 100);
        %>
        <div class="progress">
            <span class="skill">My attendence <i class="val"><%= percentage %>%</i></span>
            <div class="progress-bar-wrap">
                <div class="progress-bar" role="progressbar" aria-valuenow="<%= percentage %>" aria-valuemin="0" aria-valuemax="100" style="width: <%= percentage %>%"></div>
            </div>
        </div>
    </section>
</body>
</html>
