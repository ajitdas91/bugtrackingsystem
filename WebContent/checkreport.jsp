<%@ page language="java" import="java.sql.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="javascript/disableback.js">  </script>
<link href="" rel="shortcut icon"/>
<link href="mycss.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="javascript/validate.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Report</title>
</head>
<body>
<%String logid=(String)session.getAttribute("logid");if(logid==null){ %><jsp:forward page="index.jsp"/><%} %>
   <div class="wrapper">
   		<div class="header">
   		  <BR>
   		<BR>
   		<center><h1>Bug Tracking System</h1></center>
   	    </div>
   	        
<%String type=(String)session.getAttribute("type");
if(type.equals("admin")){ %>
		<div class="nav">
   				<ul>
 			  		<li><a href="admin.jsp">Home</a></li>
   					<li><a href="assignbug.jsp">Assign Bug</a></li>
   					<li><a href="checkreport.jsp">Check Bug Report</a></li>
   					<li><a href="logout.jsp">Logout</a></li>
   				</ul>
   	  </div>
   	  <%}else if(type.equals("expert")){ %>
   	  <div class="nav">
   				<ul>
 			  		<li><a href="texpert.jsp">Home</a></li>
   					
   					<li><a href="logout.jsp">Logout</a></li>
   				</ul>
   	  </div>
   	  <%} %>
   	  	<div class="content3">
   			<center>
   			<h5><font color="red" size="4">${param.message}</font></h5>
   			<h2><u>Enter number of days you Want to show:</u></h2><br>
   			<form action="checkbugreport.jsp" name="repform" onsubmit="return validDate();">
   			<table class="table1" border="#">
   			 <tr><td>Start Dade:</td><td><input type="date" class="textbox" name="sdate" placeholder="yyyy-mm-yy"></td></tr>
   			 <tr><td>Enter Date:</td><td><input type="date" class="textbox" name="edate" placeholder="yyyy-mm-yy"></td></tr>
   			 <tr><td></td><td><input type="submit" value="submit" class="button"></td></tr>
   			 </table>
   			 </form>
   			
   				
   			</center>
   	    </div>
   	 <div class="footer">
   	 </div>
</div>
</body>
</html>
