<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard</title>

<style>
section{
    color: white;
    padding: 10px;
    display: flex;
    height: 95vh;
}
.left
{
    background-color:limegreen;    
    float: left; 
    width:10%; 
}
.mid
{
    background-color:orange;
    float: left;
    width:65%;
}
.right{
	background-color:black;
	float:left;
	width:20%
}
.photo{
	border-radius: 100px;
	width:60px;
	height:60px;
}
</style>
</head>
<body>
<section class="left">
<div class="profile">
<img src="Screenshot 2024-02-22 230913.png" class="photo">
<div>
<a>Overview</a><br>
<a>assignments</a><br>
<a>Courses</a><br>
<a>Attendence</a><br>
<a>logout</a>
</div>
</div>
</section>
<section class="mid">
hello
</section>
<section class="right">
<a>Your attaendence</a>
</section>
</body>
</html>