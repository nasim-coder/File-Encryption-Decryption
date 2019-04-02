<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>Recover Password</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {
	box-sizing: border-box;
}
.message {
	   text-align : center;
	   font-family : sans-serif;
	   font-size : 16px;
	   font-weight : bold;
	   color : blue;
	}
body {
	margin: 0;
	background-color: whitesmoke;
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

hr {
	margin-bottom: 40px;
	border: 2px solid #f1f1f1;
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

.inputcontainer {
	padding: 30px;
	background-color: aliceblue;
}

input[type=text], input[type=password], input[type=email] {
	width: 50%;
	padding: 10px;
	margin: 5px 25px 25px 5px;
	display: inline-block;
	border: none;
}

input[type=text]: focus, input[type=password]: focus, input[type=email]: focus {
	outline: none;
	background-color: #ddd;
}

.loginbtn {
	background-color: #4CAF50;
	color: white;
	padding: 12px 30px;
	margin: 40px 40%;
	cursor: pointer;
	border: none;
	opacity: 0.9;
}

.loginbtn:hover {
	opacity: 1;
}

.reg {
	text-align: center;
	font-family: sans-serif;
}

label {
	font-family: sans-serif;
}

@media screen and (max-width:600px) {
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
		<a href="decryption.jsp">Decryption</a> 
		<a href="contact.html">Contact Us</a>
	</div>


	<form action="ForgotPassword" method="post">
		<div class="inputcontainer">
			<h3>Please Recover your password by entering emailid which was used for registeraton. We wil send you an email with password...</h3>
			<hr>
			<label for="email"><b>E-mail :</b></label><br> <input
				type="email" name="email" placeholder="Enter username"
				title="your email is your username" size = "65" required><br>
				<div class="message">${requestScope.message}</div>
			<button type="submit" class="loginbtn">Send me Email</button>
			<div class="reg">
				<p>
					Don't have an acoount?<a href="register.jsp" style="font-size: 16px">
						Register</a> now. 
				</p>
			</div>

		</div>
	</form>


	<div class="footer">
		<p>&copy; 2018 All rights Reserved.</p>
	</div>

</body>

</html>
    