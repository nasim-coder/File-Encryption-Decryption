<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>Change Password</title>
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
<%
beans.Users user=(beans.Users)session.getAttribute("user");
	if(user==null)
	{
		response.sendRedirect("login.jsp");
    }
%>
<script lang="text/javascript">
function validateIt()
	{
		var y = document.getElementById("pp");
		var z = document.getElementById("ppp");
		
		if(y.value.match(z.value))
			{
				return true; 
			}
		else
			{
				alert("New Password must be matched with confirm password")
				return false;
			}
	}
</script>
	<div class="header">File Encryption And Decryption</div>
	<div class="topnav">
		<a href="home.jsp">Home</a> <a href="encryption.jsp">Encryption</a>
		<a href="decryption.jsp">Decryption</a> <a href="send_email.jsp">Send e-mail</a>
		<a href="contact.html">Contact Us</a>
		<a href = "logout.jsp">Logout</a>
	</div>


	<form name = "loginForm" action="ChangePassword" method="post" onsubmit= "return validateIt()">
		<div class="inputcontainer">
			<h3>Enter Credentials to Update password :</h3>
			<hr>
			<label for="password"><b>Enter New Password :</b></label><br> <input
				type="password" name="password" placeholder="Enter New Password"
				title="Password should not be less than 6 or more than 30 character" pattern= ".{6,30}" id="pp" required><br> <label
				for="password"><b>Confirm New Password :</b></label><br> <input
				type="password" name="password" placeholder="Enter New Password Again" pattern= ".{6,30}" id="ppp" required><br>
				<input type ="hidden" name="email" value="<%=user.getEmail()%>">
				<div class="message">${requestScope.message}</div>
			<button type="submit" class="loginbtn">Update</button>
		
			

		</div>
	</form>


	<div class="footer">
		<p>&copy; 2018 All rights Reserved.</p>
	</div>

</body>

</html>
    
