<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>Bug Tracker</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="mycss.css">
	<script type="text/javascript" src="javascript/validate.js"></script>
  </head>
  
  <body>
   <div class="wrapper">
   		<div class="header">
   		<BR>
   		<BR>
   		<center><h1>Bug Tracking System</h1></center>
   	    </div>
   	   <div class="nav">
   	    <div class="navl">
   	    </div>
   	        <div class="navr">
   				<ul>
 			  		<li><a href="index.jsp">Home</a></li>
   				</ul>
   		    </div>
   	  </div>
   	  <div class="content2">
   		 
   		  <br>
   		  <center>
   		  <h2><u>Fill The Following Details:</u></h2>
   			<br>
			<form action="regdetails.jsp" method="post" name="myform" onsubmit="return validateform(this)" method="post">
				<input type="hidden" name="utype"   value="user">
				<table class="table1" >
					<tr><td>Name :</td><td><input type="text" class="textbox" name="uname" placeholder="Enter ur name"></td></tr>
					<tr><td>Address:</td><td><textarea  class="textarea" name="address" placeholder="Enter ur address"></textarea></td></tr>
					<tr><td>password:</td><td><input type="password"  class="textbox" name="pwd" placeholder="Enter ur password"></td></tr>
					<tr><td>Confirm password:</td><td><input type="password"  class="textbox" name="pwd1" placeholder="Reenter ur password"></td></tr>
					<tr><td>Email :</td><td><input type="text" name="email"  class="textbox" placeholder="enter ur email"></td></tr>
					<tr><td>Mobile no:</td><td><input type="text" name="mobile"  placeholder="Enter ur mobile no" class="textbox"></td></tr>
					<tr><td><td><input type="submit" class="button" value="submit"></td></tr>
					</table>
					</form>
					</center>
					<br>
   		 
   	</div>
   	<div class="footer">
   	</div>
   	</div>
  </body>
</html>
