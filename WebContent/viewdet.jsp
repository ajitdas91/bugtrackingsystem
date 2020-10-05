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
   				<ul><li><a href="user.jsp">Home</a></li>
 			  		<li><a href="viewbugs.jsp">View Bugs</a></li>
   					<li><a href="postbug.jsp">PostBug</a></li>
   					<li><a href="checkbugstatus.jsp">Bug Status</a></li>
   					<li><a href="profile.jsp">Profile</a></li>
   					<li><a href="logout.jsp">Logout</a></li>
   				</ul>
   	  </div>
   	  	<div class="content3">
   	  	<%
   			String bugid=request.getParameter("bugid"),expert="",sol="";
   			String date=request.getParameter("date");
   			Date dt=Date.valueOf(date);
   			try
			{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bug_tracker","root","mysql");
			PreparedStatement stmt=con.prepareStatement("select prodname,env,description,path from bug_details where bugid=?");
			stmt.setString(1,bugid);
			ResultSet rs=stmt.executeQuery();
			if(rs.next())
			{
				PreparedStatement stmt1=con.prepareStatement("select expertid,solution from solutions where bugid=? and soln_date=?");
				stmt1.setString(1,bugid);
				stmt1.setDate(2, dt);
				ResultSet rs1=stmt1.executeQuery();
				if(rs1.next())
				{
					expert=rs1.getString(1);
					sol=rs1.getString(2);
				}
			%>
			<center>
			<br><br>
			<form action="postsolution.jsp" method="post">
			<table class="table1" border="#">
   				<tr><td colspan="2">Product Name :</td><td></td><td colspan="2"><%=rs.getString(1)%></td></tr><tr><td colspan="2">Environment :</td><td></td><td colspan="2"><%=rs.getString(2)%></td></tr>
   				<tr><td colspan="2">Error Details :</td><td></td><td colspan="2"><%=rs.getString(3)%></td></tr>
   				<tr><td colspan="2">Solutions :</td><td></td><td colspan="2"><%=rs1.getString(2)%></td></tr>
   				<tr><td colspan="2">Author id:</td><td></td><td colspan="2"><%=rs1.getString(1)%></td></tr>
   				<tr><td colspan="4"><img src="<%=rs.getString(4)%>" alt="Image Not Available" height="200px" width="400px" ></td></tr>
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