<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="javascript/disableback.js">  </script>
<link href="" rel="shortcut icon"/>
<link rel="stylesheet" type="text/css" href="mycss.css">
	<script type="text/javascript" src="javascript/validate.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User</title>
</head>
<body>
<%String logid=(String)session.getAttribute("logid");if(logid==null){ %><jsp:forward page="index.jsp"/><%} %>
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
 			  		<li><a href="user.jsp">Home</a></li>
   					
   					<li><a href="logout.jsp">Logout</a></li>
   				</ul>
   		    </div>
   	  </div>   	  	<div class="content">
   	  	<div class="clogin">
   		 		<ul>
   		 			<li><a href="viewbugs.jsp">View Bugs</a></li>
   		 		    <li><a href="postbug.jsp">Post Bug</a></li>
   		 			<li><a href="checkbugstatus.jsp">Bug Status</a></li>
   		 			<li><a href="profile.jsp">Profile</a></li>
   		 		</ul>
   			</div>
   			<div class="cleft">
   			<h5><font color="red" size="4">${param.message}</font></h5>
   			
   			</div>
   			
   	    </div>
   	 <div class="footer">
   	 </div>
</div>
</body>
</html>