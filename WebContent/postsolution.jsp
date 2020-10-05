<%@page import="java.sql.*;"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="javascript/disableback.js">  </script>
<link href="" rel="shortcut icon"/>
<link rel="stylesheet" type="text/css" href="admincss.css">
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
 			  		<li><a href="viewassignbug.jsp" style="background-color: aqua;border-radius:5px;">Assigned Bugs</a></li>
   					<li><a href="" >Resolve Bug</a></li>
   					<li><a href="logout.jsp">Logout</a></li>
   				</ul>
   	  </div>
   	  	<div class="content">
   	  		<%
   	    String bugid="",error="",prodid="";
		String solution=request.getParameter("solution"),expertid=(String)session.getAttribute("logid");
		//out.print(expertid);
		int i=0;
		try
		{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bug_tracker","root","mysql");
		PreparedStatement stmt=con.prepareStatement("select bugid,description,prodid from bug_details where assign_to=?");
		stmt.setString(1,expertid);
		ResultSet rs=stmt.executeQuery();
		while(rs.next())
		{
			bugid=rs.getString(1);
			error=rs.getString(2);
			prodid=rs.getString(3);
	    }
		rs.close();
		stmt.close();
		PreparedStatement ps=con.prepareStatement("insert into solutions(bugid,expertid,errordetails,solution,soln_date,prodid) values(?,?,?,?,CURDATE(),?)");
	    ps.setString(1,bugid );
	    ps.setString(2,expertid);
	    ps.setString(3,error);
	    ps.setString(4,solution);
	    ps.setString(5,prodid);
	    i=ps.executeUpdate();
		}
		catch(Exception e)
		{
		e.printStackTrace();
		}
		if(i>0)
			response.sendRedirect("viewassignbug.jsp?message=Solution insert sucess");
   	  		 %>
   	    </div>
   	 <div class="footer">
   	 </div>
</div>
</body>
</html>