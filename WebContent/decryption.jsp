<!DOCTYPE html>
<html lang="en">

<head>
<title>Decrypt your file</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {
	box-sizing: border-box;
}

body {
	margin: 0;
	background-color: whitesmoke;
	height:
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

input[type=text], input[type=file] {
	width: 50%;
	padding: 10px;
	margin: 5px 25px 25px 5px;
	display: inline-block;
	border: 2px solid blue;
}

input[type=text]: focus, input[type=file]: focus {
	outline: none;
	background-color: #ddd;
}

.encbtn {
	background-color: blue;
	color: white;
	padding: 12px 30px;
	margin: 40px 40%;
	cursor: pointer;
	border: none;
	opacity: 0.9;
}

.encbtn:hover {
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
<script type="text/javascript">

function validateIt(){
	var x = document.getElementById("dfile").files[0];
	var length = document.getElementById("dkey").value.length;
	if(x.size>1024*1024*20)
		{
		alert("File size should not be greater than 20MB")
		return false;
		}
	if(length>16||length<16){
		alert("Key size should be 16 character long only")
		return false;
	}
}
</script>
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
		<a href="decryption.jsp">Decryption</a> 
		<a href="contact.html">Contact Us</a> <a href="logout.jsp">Logout</a>
	</div>


	<form action="DecryptServlet" enctype="multipart/form-data" onsubmit="return validateIt()" method="post">
		<div class="filecontainer">
			<h4>Please select an encrypted file, and enter 16 digit long key
				which was used to encrypt this file. Key shouldn't be less than 16
				digit but can be more as multiple of 16 digit.</h4>
			<hr>
			<label for="fileName">Select an Encrypted File :</label><br> 
			<input type="file" name="fileName" id="dfile" required><br>
	 <label for="key"> Decryption Key :</label><br>
	  <input type="text" name="key" placeholder="Enter key" id="dkey" required><br> 
	  <input type="submit" value="Decrypt" class="encbtn"><br>
		</div>
	</form>


	<div class="footer">
		<p>&copy; 2018 All rights Reserved.</p>
	</div>

</body>

</html>
