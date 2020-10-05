<%@page import="java.sql.*;"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1"%>
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
   				<ul>
 			  		<li><a href="texpert.jsp">Home</a></li>
 			  		<li><a href="viewassignbug.jsp">Assigned Bugs</a></li>
   					<li><a href="#" >Resolve Bug</a></li>
   					<li><a href="logout.jsp">Logout</a></li>
   				</ul>
   	  </div>
   	  	<div class="content3">
   	  	<%
   			String loginid=(String)session.getAttribute("logid");
   			try
			{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bug_tracker","root","mysql");
			PreparedStatement stmt=con.prepareStatement("select bugid,prodid,prodname,env,type,priority,description,path from bug_details where assign_to=?");
			stmt.setString(1,loginid);
			ResultSet rs=stmt.executeQuery();
			//boolean status=rs.next();
			if(rs.next())
			{
				
			%>
			<center>
			<br><br>
			<form action="postsolution.jsp" method="post">
			<table class="table1" border="#">
   				<tr><td>Product Name :</td><td><%=rs.getString(3)%></td><td></td><td>Environment :</td><td><%=rs.getString(4)%></td></tr>
   				<tr><td>Type :</td><td><%=rs.getString(5)%></td><td></td><td>Priority :</td><td><%=rs.getString(6)%></td></tr>
   				<tr><td colspan="2">Error Details :</td><td></td><td colspan="2"><%=rs.getString(7)%></td></tr>
   				<tr><td colspan="5"><img src="<%=rs.getString(8) %>" height="200px" width="500px" alt="Image Not Posted"></td></tr>
   				<tr><td colspan="5">Comments:</td></tr>
   				<tr><td colspan="5"><textarea rows="7" cols="50" style="border-radius:5px;padding:10px" name="solution"></textarea><br></td></tr>
   				<tr><td colspan="5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="submit"></td></tr>
   			</table>
   			</form>
			</center>
			<%
				
				}
			}
			catch(Exception e)
			{
			e.printStackTrace();
			}
   			 
   			%>
   			<br>
   			
   				
   			
   	    </div>
   	 <div class="footer">
   	 </div>
</div>
</body>
</html>