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
 			  		<li><a href="texpert.jsp">Home</a></li>
 			  		<li><a href="viewassignbug.jsp">Assigned Bugs</a></li>
   					<li><a href="resolvebug.jsp" >Resolve Bug</a></li>
   					<li><a href="logout.jsp">Logout</a></li>
   				</ul>
   	 	 </div>
   	  	<div class="content3">
   		 	
   			<br>
   			<br>

   			<center>
   			<h1>${param.message}</h1>
   			<%
   			String loginid=(String)session.getAttribute("logid");
   			try
			{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bug_tracker","root","mysql");
			PreparedStatement stmt1=con.prepareStatement("select bugid,prodid,prodname,env,priority,description from bug_details where assign_to=?");
			stmt1.setString(1,loginid);
			ResultSet rs1=stmt1.executeQuery();
			boolean status=rs1.next();
			if(status)
			{
				
				PreparedStatement stmt=con.prepareStatement("select bugid,prodid,prodname,env,priority,description from bug_details where assign_to=?");
				stmt.setString(1,loginid);
				ResultSet rs=stmt.executeQuery();
				out.println("<table class='table1' border='#'><tr>");
				out.print("<th>ProdId</th><th>ProdName</th><th>Environ.</th><th>Priority</th><th>ErrorDetails</th><th></th><th</th><tr> ");
				while(rs.next())
				{
				out.print("<tr><td>"+rs.getString(2)+"</td>");
				out.print("<td>"+rs.getString(3)+"</td>");
				out.print("<td>"+rs.getString(4)+"</td>");
				out.print("<td>"+rs.getString(5)+"</td>");
				out.print("<td>"+rs.getString(6)+"</td><td><a href='solvebug.jsp?errordetails="+rs.getString(1)+"'>Solve</a></td></tr>");
				}
				out.print("</table>");
				}
			else
   			{
   				out.print("<h2>Bug not Available.....</h2>");
   			}
			}
   			
			catch(Exception e)
			{
			e.printStackTrace();
			}
   			 %>   	
   			</center>
   	    </div>
   	 <div class="footer">
   	 </div>
</div>
</body>
</html>