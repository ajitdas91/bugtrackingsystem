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
 			  		<li><a href="admin.jsp">Home</a></li>
   					<li><a href="assignbug.jsp">Assign Expert</a></li>
   					<li><a href="logout.jsp">Logout</a></li>
   				</ul>
   	  </div>
   	  	<div class="content3">
   			<center>
   			<%String bugid=request.getParameter("bugid"); %>
   			<h2><u>Bug Details Are As Follows:</u></h2><br>
   			<form action="changeprioritydb.jsp">
   			<table class="table1" border="1">
   			<%
   			
   			try
			{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bug_tracker","root","mysql");
			PreparedStatement stmt=con.prepareStatement("select * from bug_details where bugid=?");
			stmt.setString(1, bugid);
			ResultSet rs=stmt.executeQuery();
	
			while(rs.next())
			{
			out.print("<tr><td>Bug Id:</td><td>"+rs.getString(1)+"<input type='hidden' value="+rs.getString(1)+" name='bugid'></td></tr>");
			out.print("<tr><td>User Id:</td><td>"+rs.getString(2)+"</td></tr>");
			out.print("<tr><td>User Name:</td><td>"+rs.getString(3)+"</td></tr>");
			out.print("<tr><td>Product Id:</td><td>"+rs.getString(4)+"</td></tr>");
			out.print("<tr><td>Product Name:</td><td>"+rs.getString(5)+"</td></tr>");
			out.print("<tr><td>Environment:</td><td>"+rs.getString(6)+"</td></tr>");
			out.print("<tr><td>Severity:</td><td>"+rs.getString(7)+"</td></tr>");
			out.print("<tr><td>Description:</td><td>"+rs.getString(8)+"</td></tr>");
			out.print("<tr><td>Reperting Date:</td><td>"+rs.getString(9)+"</td></tr>"); 
			out.print("<tr><td>Status:</td><td>"+rs.getString(11)+"</td></tr>");
			}
			
			}
			catch(Exception e)
			{
			e.printStackTrace();
			}
   			 %>
   			 <tr><td>Priority</td><td><select name="priority" class="textbox"><option value="">--select--</option>
   			 <option>High</option>
   			 <option>Middle</option>
   			 <option>Low</option>
   			 </select></td></tr>
   			 <tr><td></td><td><input type="submit" value="submit" class="button"></td></tr>
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
