<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isErrorPage="true" %>
<!DOCTYPE HTML>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Error Page</title>
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

.error {
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
</head>

<body>

	<div class="header">File Encryption And Decryption</div>

	<div class="topnav">
		<a href="home.jsp">Home</a> <a href="login.jsp">Login</a> <a
			href="register.jsp">Register</a> <a href="encryption.jsp">Encryption</a>
		<a href="decryption.jsp">Decryption</a> <a href="logout.jsp">Logout</a>
		<a href="contact.html">Contact Us</a>
	</div>

	<div class="error">
	<h1> Oops!!! something went wrong</h1>
	<h3>Error :</h3>
    <%= exception.getMessage() %>
    <h4> ${requestScope.message} </h4>
	</div>
	<div class="footer">
		<p>&copy; 2018 All rights Reserved.</p>
	</div>
</body>

</html>
