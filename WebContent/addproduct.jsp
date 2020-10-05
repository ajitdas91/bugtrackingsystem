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
 			  		<li><a href="admin.jsp">Home</a></li>
   		 			<li><a href="addproduct.jsp" >Add Product</a></li>
   		 			<li><a href="updateprod.jsp">Update Product Info</a></li>
   		 			<li><a href="logout.jsp">Logout</a></li>
   		 		</ul>
   		   </div>
   	  </div>
   	<div class="content3">
   	<center><h5 Style="color:red"">${param.message}</h5>
   			<h2><u>Enter Product Details:</u></h2><br>
   			<form action="addproduct" method="get" name="prodform" onsubmit="return validprod()">
   			<table class="table1" border="#">
   			<tr><td>Product Name:</td><td><input type="text" class="textbox" name="prodname"></td></tr>
   			<tr><td>Product Version:</td><td><input type="text"  class="textbox" name="prodver"></td></tr>
   			<tr><td></td><td><input type="submit"  class="button" value="submit"></td></tr>
   			</table>
   			</form>
   	</center>
   	</div>
   	 <div class="footer">
   	 </div>
</div>
</body>
</html>