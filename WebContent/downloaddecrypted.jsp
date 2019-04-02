<!DOCTYPE html>
<html lang="en">

<head>
<title>Download Decrypted file</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {
	box-sizing: border-box;
}

body {
	margin: 0;
	background-color: whitesmoke;
	height: auto;
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

.filecontainer {
	padding: 30px;
	background-color: aliceblue;
}

input[type=email] {
	width: 40%;
	padding: 10px;
	margin: 5px 0px 25px 5px;
	display: inline-block;
	border: 1px solid blue;
}

input[type=email]: focus {
	outline: none;
	background-color: #ddd;
}

.dwnbtn {
	background-color: blue;
	color: white;
	padding: 12px 30px;
	margin: 40px 30%;
	cursor: pointer;
	border: none;
	opacity: 0.9;
}

.dwnbtn:hover {
	opacity: 1;
}

.sndbtn {
	background-color: blue;
	color: white;
	padding: 12px 15px;
	cursor: pointer;
	border: none;
	opacity: 0.9;
}

.reg {
	text-align: center;
	font-family: sans-serif;
}

label {
	font-family: sans-serif;
	font-weight: bold;
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
	<div class="header">File Encryption And Decryption</div>

	<div class="topnav">
		<a href="home.jsp">Home</a> <a href="encryption.jsp">Encryption</a>
		<a href="decryption.jsp">Decryption</a> <a href = "send_email.jsp">Send E-mail</a> <a href="logout.jsp">Logout</a>
		<a href="contact.html">Contact Us</a>
	</div>


	<form method="post">
		<div class="filecontainer">
			<h4>Choose encrypted file and encryption key to decrypt your
				file.</h4>

			<hr>
			<input type="hidden" name="eord" value="5">
			<p>Click the download button to download the decrypted file</p>
			<button type="submit" formaction="DownloadServlet" class="dwnbtn">Download</button>
		</div>
	</form>


	<div class="footer">
		<p>&copy; 2018 All rights Reserved.</p>
	</div>

</body>

</html>
