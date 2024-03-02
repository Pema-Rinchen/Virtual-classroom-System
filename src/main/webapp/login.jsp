<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
        }
        .container {
            width: 300px;
            padding: 16px;
            background-color: white;
            margin: 0 auto;
            margin-top: 100px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .container input[type="text"], .container input[type="password"] {
            width: 100%;
            padding: 12px 20px;
            margin: 5px 0;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .container input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 14px 20px;
            margin: 10px 0;
            border: none;
            cursor: pointer;
            width: 100%;
            border-radius: 4px;
        }
        .container input[type="submit"]:hover {
            background-color: #45a049;
        }
        .password-container {
            position: relative;
            width: 100%;
        }
      
        .eye-icon {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
        }
        .eye-icon i {
            font-size: 18px;
        }
    </style>
</head>
<body>
    <form method="post" action="login">
    <div class="container">
        <label for="uname"><b>Username</b></label>
        <%--<i class="fas fa-user"></i> --%>
            
        <input type="text" name="username"placeholder="Enter Username" id="uname" required>

        <label for="psw"><b>Password</b></label>
        <%-- <i class="fas fa-lock"></i>--%>
        <div class="password-container">
          <input type="password" name="password" placeholder="Enter Password" id="psw" required>
          <div class="eye-icon" onclick="togglePasswordVisibility()">
            <i class="fas fa-eye"></i>
          </div>
        </div>
        <button type="submit">Login</button>
        <a href="register.jsp">register here</a>
    </div>
</form>
    <script>
        function togglePasswordVisibility() {
            const passwordInput = document.getElementById('psw');
            if (passwordInput.type === 'password') {
                passwordInput.type = 'text';
            } else {
                passwordInput.type = 'password';
            }
        }
    </script>
</body>
</html>
