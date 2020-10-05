<%@page import="java.sql.*;"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="javascript/disableback.js">  </script>
<link href="" rel="shortcut icon"/>
<link rel="stylesheet" type="text/css" href="admincss.css">
	<script type="text/javascript" src="javascript/validate.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Remove Bug</title>
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
   					<li><a href="#postbug">Post Bug</a></li>
   					<li><a href="#checkbugstatus">Bug Status</a></li>
   					<li><a href="logout.jsp">Logout</a></li>
   				</ul>
   	  </div>
   	  	<div class="content">
   		 	<div class="cleft">
   		 		
   			</div>
   			<div class="cright">
   			<br>
   			<br>

   			<center>
   			<%
   			int i=0;
				String bugid=request.getParameter("bugid");
				String authorid=request.getParameter("authorid");
		try
			{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bug_tracker","root","mysql");
			PreparedStatement stmt=con.prepareStatement("delete from bug_details where authorid=? and bugid=?");
			stmt.setString(1,authorid);
			stmt.setString(2,bugid);
			i=stmt.executeUpdate();
			stmt.close();
			con.close();
			}
		catch(Exception e)
		    {
			e.printStackTrace();
			}
			if(i>0)
			{
			response.sendRedirect("checkbugstatus.jsp");
			}
 %>   	
   			</center>
   	    	</div>
   	    </div>
   	 <div class="footer">
   	 </div>
</div>
</body>
</html>