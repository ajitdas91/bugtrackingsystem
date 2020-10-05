<%@page import="java.sql.Date"%>
<%@ page language="java" import="java.sql.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="javascript/disableback.js">  </script>
<link href="" rel="shortcut icon"/>
<link href="mycss.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="javascript/validate.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Reports</title>
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
   			<h2><u>Bug Reports Are As Follows:</u></h2><br>
   			<%
   			
   			String sdate=request.getParameter("sdate") ;
   			String edate=request.getParameter("edate") ; 
   			java.sql.Date sd=Date.valueOf(sdate);
   			java.sql.Date ed=Date.valueOf(edate);
   			try
			{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bug_tracker","root","mysql");
			
			PreparedStatement stmt1=con.prepareStatement("select * from solutions where soln_date between ? and ?");
			stmt1.setDate(1, sd);
			stmt1.setDate(2, ed);
			ResultSet rs1=stmt1.executeQuery();
			if(rs1.next())
			{
			PreparedStatement stmt=con.prepareStatement("select * from solutions where soln_date between ? and ?");
			stmt.setDate(1, sd);
			stmt.setDate(2, ed);
			ResultSet rs=stmt.executeQuery();
			out.print("<table class='table1' border='#'>");
			out.print("<tr><th>Bugid</th><th>Expertid</th><th>Name</th><th>Error</th><th>Solution</th><th>solDate</th><th>Prodid</th></tr>");
			while(rs.next())	
			{
			out.print("<tr><td>"+rs.getString(1)+"</td>");
			out.print("<td>"+rs.getString(2)+"</td>");
			out.print("<td>"+rs.getString(3)+"</td>");
			out.print("<td>"+rs.getString(4)+"</td>");
			out.print("<td>"+rs.getString(5)+"</td>");
			out.print("<td>"+rs.getString(6)+"</td>");
			out.print("<td>"+rs.getString(7)+"</td></tr>");
			}
			out.print("</table>");
			}
			else
			out.print("Report Not Available !");
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
