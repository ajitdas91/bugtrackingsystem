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
   					<li><a href="logout.jsp">Logout</a></li>
   				</ul>
   	  </div>
   	  	<div class="content3">
   			<br>
   			<br>

   			<center>
   			
   			<%
				String bugid=request.getParameter("bugid");
				String authorid=request.getParameter("authorid");
				String prodid=request.getParameter("prodid");
				boolean status=false;
		try
			{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bug_tracker","root","mysql");
			PreparedStatement stmt1=con.prepareStatement("select bugid,prodid,solution from solutions where bugid=? and prodid=?");
			//stmt.setString(1,authorid);
			stmt1.setString(1,bugid);
			stmt1.setString(2,prodid);
			ResultSet rs1=stmt1.executeQuery();
			//System.out.print(rs1.getString(3));
			status=rs1.next();
			if(status)
			{
				PreparedStatement stmt=con.prepareStatement("select bugid,prodid,solution,errordetails from solutions where bugid=? and prodid=?");
				stmt.setString(1,bugid);
				stmt.setString(2,prodid);
				ResultSet rs=stmt.executeQuery();
				out.print("<h1><u>Solution for your Bug:</u></h1><br>");
				out.println("<table border='#' class='table1'>");
				out.print("<tr><td>BugId</td><td>ProductId</td><td>Error</td><td>Solution</td></tr>");
				while(rs.next())
				{
				out.print("<tr><td>"+rs.getString(1)+"</td>");
				out.print("<td>"+rs.getString(2)+"</td>");
				out.print("<td>"+rs.getString(4)+"</td>");
				out.print("<td>"+rs.getString(3)+"</td></tr>");
				}
				out.print("</table>");
		   }
			else
			{
				out.print("<h1 style='color:red'>solution not available</h1>");
			}
		}
		catch(Exception e)
		    {
			e.getMessage();
			}
		 %>   	
   			</center>
   			<br>
   	    </div>
   	    
   	 <div class="footer">
   	 </div>
</div>
</body>
</html>