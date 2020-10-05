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
<title>Assign Bug</title>
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
   					<li><a href="assignbug.jsp" >Assign Expert</a></li>
   					<li><a href="logout.jsp">Logout</a></li>
   				</ul>
   	  </div>
   	  	<div class="content3">
   			<center>
   		
   			<h5><font color="red" size="4">${param.message}</font></h5>
   			<h2><u>Assign Bug to Expert</u></h2>
   			<br>
   			<%
   			try
			{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bug_tracker","root","mysql");
			PreparedStatement stmt1=con.prepareStatement("select bugid,description,prodname,env,rep_date,prodid from bug_details where assign_to is null");
			ResultSet rs1=stmt1.executeQuery();
			if(rs1.next())
			{
			PreparedStatement stmt=con.prepareStatement("select bugid,description,prodname,env,rep_date,prodid from bug_details where assign_to is null");
			ResultSet rs=stmt.executeQuery();
			out.println("<table class='table1' border='#'><tr>");
			out.print("<th>Error_details </th><th>Product Name</th><th>Environment</th><th>Rep_date</th><tr> ");
			while(rs.next())
			{
			out.print("<tr><td>"+rs.getString(2)+"</td>");
			out.print("<td>"+rs.getString(3)+"</td>");
			out.print("<td>"+rs.getString(4)+"</td>");
			out.print("<td>"+rs.getDate(5)+"</td><td><a href='bugdetails.jsp?bugid="+rs.getString(1)+"'>Details</a></td><td><a href='assignedbug.jsp?bugid="+rs.getString(1)+"&prodid="+rs.getString(6)+"&prodname="+rs.getString(3)+"'>Assign</a></td></tr>");
			}
			out.print("</table>");
			}
			else out.print("Bug not Available");
			}
			catch(Exception e)
			{
			e.printStackTrace();
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
