<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
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
   					
   				</ul>
   		    </div>
   	  </div>
   	  <div class="content2">
   		  <%
			String uname=request.getParameter("uname");
			String address=request.getParameter("address");
			String password=request.getParameter("pwd");
			String email=request.getParameter("email");
			String mobile=request.getParameter("mobile");
			String user=request.getParameter("utype");
		  %>
 		<center>
 		<h1>Registation Details:</h1>
 		<br>
  		<table class="table1	">
 			<tr><td>Name</td><td>: <%out.print(uname);%></td></tr>
 			<tr><td>Address</td><td>: <%out.print(address);%></td></tr>
 			<tr><td>Password</td><td>: <%out.print(password);%></td></tr>
 			<tr><td>Email Id</td><td>: <%out.print(email);%></td></tr>
 			<tr><td>Mobile No</td><td>: <%out.print(mobile);%></td></tr>
 			<tr><td>UserType</td><td>: <%out.print(user);%></td></tr>
 			<tr><td></td><td>
 		<%
 				out.print("<form action='regdb.jsp' method='post'>");
 				out.print("<input type='hidden' name='uname' value='"+uname+"'>");
 				out.print("<input type='hidden' name='address' value='"+address+"'>");
 				out.print("<input type='hidden' name='pwd' value='"+password+"'>");
 				out.print("<input type='hidden' name='email' value='"+email+"'>");
 				out.print("<input type='hidden' name='utype' value='"+user+"'>");
 				out.print("<input type='hidden' name='mobile' value='"+mobile+"'>");
 				out.print("<input type='submit' class='button' value='submit'>");
				 out.print("</form>");
			 %>
			 </td></tr>
			 
			</table>
   		  </center>
   		<br>
   		 
   	</div>
   	<div class="footer">
   	</div>
   	</div>
  </body>
</html>
