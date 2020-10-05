<%@ page language="java" import="java.sql.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="javascript/disableback.js">  </script>
<link href="" rel="shortcut icon"/>
<link href="admincss.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="javascript/validate.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Assign product</title>
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
 			  		<li><a href="assignprod.jsp" style="background-color: aqua;border-radius:5px;">Assign Product</a></li>
   					<li><a href="assignbug.jsp">Assign Bug</a></li>
   					<li><a href="logout.jsp">Logout</a></li>
   				</ul>
   	  </div>
   	  	<div class="content">
   			<center>
   			<h5><font color="red" size="4">${param.message}</font></h5>
   			<h1>Assign Bug to Expert</h1>
   			<%
   			String expertid=request.getParameter("expertid"),expertname=request.getParameter("expertname");
   			try
			{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bug_tracker","root","mysql");
			PreparedStatement stmt=con.prepareStatement("select prodid,prodname from products");
			ResultSet rs=stmt.executeQuery();
			out.println("<table class='table'><tr>");
			out.print("<td>ProductId</td><td>ProductNmae</td><td></td><td></td><tr>");
			while(rs.next())
			{
			out.print("<tr><td>"+rs.getString(1)+"</td>");
			out.print("<td>"+rs.getString(2)+"</td><td><a href='assignprodtoexpert.jsp?prodid="+rs.getString(1)+"&prodname="+rs.getString(2)+"&expertid="+expertid+"&expertname="+expertname+"'>Assign</a></td></tr>");
			}
			out.print("</table>");
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
