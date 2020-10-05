<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <script type="text/javascript" src="javascript/disableback.js">  </script>
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
   					
   					<li><a href="reg.jsp">Signup</a></li>
   				</ul>
   		    </div>
   	  </div>
   	  <div class="content">
   		 <div class="login">
   		 <h5><font color="red" size="6">${param.message}</font></h5>
   		 <h3>Registed User Login Here</h3> 
   		 
   			<form action="login.jsp" name="loginform" onSubmit="return loginvalid()" method="post">
   			<table class="table">
   				<tr><td>Login Id :</td><td colspan="2"><input type="text" name="logid" placeholder="Enter your Logid" class="textbox"></td></tr>
   				<tr><td>password:</td><td colspan="2"><input type="password" name="pwd" placeholder="Eter your password" class="textbox"></td></tr>
   				<tr><td></td><td colspan="2"><input type="submit" value="login" class="button"></td></tr>
   				<tr><td></td><td colspan="2"><a href="resetpass.jsp">Forgot Password</a></td></tr>
   				<tr><td></td><td colspan="2"><a href="reg.jsp">SinUp</a></td></tr>
   			</table>
   			</form>
   		</div>
   		  <div class="cleft">
   		  <center>
			<form action="rpass" method="post" name="myform" onsubmit="return validateform()" method="post">
				    Enter your Email:<br><input type="text" class="textbox" name="email" placeholder="enter ur email">
					</td><td><input type="submit"  class="button" value="Go">
			</form>
			</center>
   		  </div>
   		 <div class="cright">
   		 </div>
   	</div>
   	<div class="footer">
   	</div>
   	</div>
  </body>
</html>
