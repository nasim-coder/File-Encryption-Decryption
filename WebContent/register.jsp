
<!DOCTYPE html>
<html lang="en">

<head>
<title>Please register first</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {
	box-sizing: border-box;
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

input[type=text], input[type=email], input[type=tel], input[type=password] {
	width: 50%;
	padding: 10px;
	margin: 5px 25px 25px 5px;
	display: inline-block;
	border: none;
}

input[type=text]: focus,input[type=email]: focus, input[type=tel]: focus, input[type=password]: focus {
	outline: none;
	background-color: #ddd;
}

.regbtn {
	background-color: blue;
	color: white;
	padding: 12px 30px;
	margin: 40px 40%;
	cursor: pointer;
	border: none;
	opacity: 0.9;
}

.regbtn:hover {
	opacity: 1;
}

.reg {
	text-align: center;
	font-family: sans-serif;
}

label {
	font-family: sans-serif;
	font-weight: bold;
}
.message {
	   text-align : center;
	   font-family : sans-serif;
	   font-size : 16px;
	   font-weight : bold;
	   color : blue;
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
				alert("Must be matched with confirm password")
				return false;
			}
	}
</script>
	<div class="header">File Encryption And Decryption</div>
	<div class="topnav">
		<a href="home.jsp">Home</a> <a href="login.jsp">Login</a> <a
			href="register.jsp">Register</a> <a href="encryption.jsp">Encryption</a>
		<a href="decryption.jsp">Decryption</a>
		<a href="contact.html">Contact Us</a>
	</div>


	<form action="RegisterServlet" method="post" name ="regForm" onsubmit ="return validateIt()">
		<div class="inputcontainer">
		<div class="message">${requestScope.message}</div>
			<h3>Please register first in order to perform incryption and
				decryption...</h3>
			<hr>
			<label for="fname"><b>First Name :</b></label><br> <input
				type="text" name="fname" placeholder="Enter first name" required><br>

			<label for="lname"><b>Last Name :</b></label><br> <input
				type="text" name="lname" placeholder="Enter last name" required><br>

			<label for="gender">Gender : </label> <select name="gender" required>
				<option>Male</option>
				<option>Female</option>
				<option>Other</option>
			</select><br>
			<br> <label for="mobile"><b>Mobile No. :</b></label><br> <input
				type="tel" name="mobile" placeholder="Enter mobile No" id = "mnum" pattern="[7-9]{1}[0-9]{9}" required><br>

			<label for="email"><b>Email :</b></label><br> <input type="email"
				name="email" placeholder="Enter Email ID" required><br>

			<label for="password1"><b>Password :</b></label><br> <input
				type="password" name="password1" placeholder="Enter Password" id="pp" pattern=".{6,30}"
				required><br> <label for="password2"><b>Confirm
					Password :</b></label><br> <input type="password" name="password2" id="ppp" pattern=".{6,30}"
				placeholder="Re enter same Password" required><br>

			<p class="reg">
				By registering this site you are agree to our <a href="#"
					style="font-size: 16px">terms of use</a> of this application.
			</p>

			<button type="submit" class="regbtn">Register</button>

			<div class="reg">
				<p>
					Already have an acoount? <a href="login.jsp" style="font-size: 16px">
						Login </a> now.
				</p>
			</div>

		</div>
	</form>


	<div class="footer">
		<p>&copy; 2018 All rights Reserved.</p>
	</div>

</body>

</html>
