<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="javascript/disableback.js">  </script>
<link rel="stylesheet" type="text/css" href="mycss.css">
	<script type="text/javascript" src="javascript/validate.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin</title>
</head>
<body>
<%String logid=(String)session.getAttribute("logid");
String type=(String)session.getAttribute("type");
if(logid==null){ %><jsp:forward page="index.jsp"/><%}
else if(!(type.equals("admin"))){
	session.invalidate();
%>
<jsp:forward page="index.jsp?message=You donot have permission !Please Login as Admin..."></jsp:forward>
<%} %>
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
 			  		<li><a href="#home">Home</a></li>
   					
   					<li><a href="logout.jsp">Logout</a></li>
   				</ul>
   		   </div>
   	  </div>
   	<div class="content">
   		 	<div class="clogin">
   		 		<ul>
   		 			<li><a href="addproduct.jsp">Add Product</a></li>
   		 			<li><a href="updateprod.jsp">Update Product</a></li>
   		 			<li><a href="addexpert.jsp">Add Expert</a></li>
   		 			<li><a href="updateexpert.jsp">Update Expert</a></li>
   		 			<li><a href="addpriority.jsp">Add Priority</a></li>
   		 			<li><a href="assignbug.jsp">Assigned Expert</a></li>
   		 			<li><a href="checkreport.jsp">Check Bug Report</a></li>
   		 			
 			</ul>
   			</div>
   			<div class="cleft">		   
   		  </div>
   		 
   	</div>
   	 <div class="footer">
   	 </div>
</div>
</body>
</html>