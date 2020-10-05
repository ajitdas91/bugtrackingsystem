<%@page import="java.sql.*;"%>
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
   				<ul>
 			  		<li><a href="user.jsp">Home</a></li>
 			  		<li><a href="viewbugs.jsp">View Bugs</a></li>
   					<li><a href="postbug.jsp">Post Bug</a></li>
   					<li><a href="checkbugstatus.jsp">Bug Status</a></li>
   					<li><a href="profile.jsp">Profile</a></li>
   					<li><a href="logout.jsp">Logout</a></li>
   				</ul>
   	  </div>
   	  	<div class="content3">
   		 	
   			<br>
   			<br>

   			<center>
   			<%
   			String authorid=(String)session.getAttribute("logid");
   			String bugid="",prodid="";
   			try
			{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bug_tracker","root","mysql");
			PreparedStatement stmt=con.prepareStatement("select bugid,rep_date,prodid,description from bug_details where authorid=?");
			stmt.setString(1,authorid);
			ResultSet rs=stmt.executeQuery();
			out.println("<table class='table1' border='#'><tr>");
			out.print("<th>BUG ID</th><th>REP_DATE</th><th>Error</th><tr> ");
			while(rs.next())
			{
			bugid=rs.getString(1);
			prodid=rs.getString(3);
			out.print("<tr><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td>");
			out.print("<td>"+rs.getString(4)+"</td><td><a href='checkbug.jsp?authorid="+authorid+"&bugid="+bugid+"&prodid="+prodid+"'>Check</a></td></tr>");
			}
			out.print("</table>");
			}
			catch(Exception e)
			{
			e.printStackTrace();
			}
   			%>   	
   			</center>
   			<br><br>
   	    </div>
   	 <div class="footer">
   	 </div>
</div>
</body>
</html>