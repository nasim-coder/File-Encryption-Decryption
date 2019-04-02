<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Contact details</title>
<style>
<
style>* {
	box-sizing: border-box;
}

body {
	margin: 0;
}

/* Style the header */
.header {
	background-color: crimson;
	padding: 20px;
	font-size: 50px;
	text-align: center;
	font-weight: bold;
}

.footer {
	text-align: center;
	background-color: azure;
}

a {
	font-size: 35px;
}

/* Style the top navigation bar */
.topnav {
	overflow: hidden;
	background-color: #333;
	text-align: center;
}

/* Style the topnav links */
.topnav a {
	float: left;
	display: block;
	color: #f2f2f2;
	padding: 15px 35px;
	text-decoration: none;
}

/* Change color on hover */
.topnav a:hover {
	background-color: #ddd;
	color: blue;
}

.contact {
	background-color: antiquewhite;
	text-align: center;
	height: 500px;
	margin-top: -19px;
}

h2 {
	padding: 40px;
}

@media screen and (max-width:600px) {
	.column {
		width: 100%;
	}
	a {
		font-size: 15px;
	}
	.topnav a {
		padding: 10px 5px;
		color: blue;
		font-weight: bold;
	}
	.topnav {
		background-color: whitesmoke;
	}
	.header {
		background-color: crimson;
		padding: 15px;
		font-size: 20px;
		text-align: center;
	}
}
</style>
<title>Log out</title>
</head>
<body>

	<div class="header">File Encryption And Decryption</div>
	<div class="topnav">
		<a href="home.jsp">Home</a> <a href="login.jsp">Login</a> <a
			href="register.jsp">Register</a> <a href="encryption.jsp">Encryption</a>
		<a href="decryption.jsp">Decryption</a> <a href="logout.jsp">Logout</a>
		<a href="contact.html">Contact Us</a>
	</div>

	<div class="contact">
		<h2>You are logged out succesfully.</h2><br>

    <h2>Thank you !!! ${user.fname}, for using our services...Have a Good Day!!!</h2>
		
	</div>
	<div class="footer">
		<p>&copy; 2018 All rights Reserved.</p>
<%
beans.Users user=(beans.Users)session.getAttribute("user");
if(user!=null)
session.invalidate();
else if(user==null){
    response.sendRedirect("login.jsp");	
    }
%>
	</div>
</body>
</html>