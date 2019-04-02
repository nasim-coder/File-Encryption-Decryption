<!DOCTYPE html>
<html lang="en">
<head>
<title>Encryption Decryption</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {
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
	background-color: antiquewhite
}

a {
	font-size: 35px;
}

img {
	max-width: 100%;
	height: auto;
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
	padding: 15px 15px;
	text-decoration: none;
}

/* Change color on hover */
.topnav a:hover {
	background-color: #ddd;
	color: blue;
}

/* Create two equal columns that floats next to each other */
.column {
	float: left;
	width: 50%;
	padding: 15px;
}

/* Clear floats after the columns */
.row:after {
	content: "";
	display: table;
	clear: both;
}

/* Responsive layout - makes the three columns stack on top of each other instead of next to each other */
@media screen and (max-width:600px) {
	.column {
		width: 100%;
	}
	a {
		font-size: 15px;
	}
	.topnav a {
		padding: 10px 7px;
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
h3 {
text-align: center;
color: green;
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
	  <a href="home.jsp">Home</a>
	  <a href="encryption.jsp">Encryption</a>
	  <a href="decryption.jsp">Decryption</a>
	  <a href = "send_email.jsp">Send E-mail</a>
	  <a href = "change_password.jsp">Change Password</a>
	  <a href="contact.html">Contact Us</a>
	  <a href="logout.jsp">Logout</a>
	</div>
<h3>-: Hello!!! ${user.fname}, Welcome to this site :-</h3>
<hr>
	<div class="row">
		<div class="column">
			<h2>Column</h2>
			<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
				Maecenas sit amet pretium urna. Vivamus venenatis velit nec neque
				ultricies, eget elementum magna tristique. Quisque vehicula, risus
				eget aliquam placerat, purus leo tincidunt eros, eget luctus quam
				orci in velit. Praesent scelerisque tortor sed accumsan convallis.</p>
		</div>
		<div class="column">
			<img src="imgs/encpic.png" alt="This is encryption image" />
		</div>
	</div>
	<div class="footer">&copy; 2018 All rights reserved.</div>
</body>
</html>
