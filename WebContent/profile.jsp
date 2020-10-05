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
 			  		<li><a href="user.jsp">Home</a></li>
 			  		<li><a href="viewbugs.jsp">View Bugs</a></li>
   					<li><a href="postbug.jsp">PostBug</a></li>
   					<li><a href="checkbugstatus.jsp">Bug Status</a></li>
   					<li><a href="profile.jsp">Profile</a></li>
   					<li><a href="logout.jsp">Logout</a></li>
   				</ul>
   	  </div>
   	  	<div class="content3">
   	  	<center>
   	  	<h2>${param.message}</h2>
   			<br>
   			
   			<%
   			boolean status=false;
   			//String prodid=request.getParameter("prodid");
   			try
			{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bug_tracker","root","mysql");
			PreparedStatement stmt=con.prepareStatement("select * from login where login_id=?");
			stmt.setString(1, logid);
			ResultSet rs=stmt.executeQuery();
			out.print("<h2><u>Your Details Are As Follows:</u></h2><br>");
			out.println("<table class='table1' border='#'>");
//			out.println("<tr><th>LogId</th><th>Solution</th></tr>");
			if(rs.next())
				{
						out.print("<tr><td>Logid :</td><td>"+rs.getString(1)+"</td></tr>");
						//out.print("<td>"+rs.getString(2)+"</td>");
						out.print("<tr><td>Name :</td><td>"+rs.getString(2)+"</td></tr>");
						out.print("<tr><td>Address :</td><td>"+rs.getString(3)+"</td></tr>");
						out.print("<tr><td>Password :</td><td>"+rs.getString(4)+"</td></tr>");
						out.print("<tr><td>Email :</td><td>"+rs.getString(5)+"</td></tr>");
						out.print("<tr><td>Mobile :</td><td>"+rs.getString(6)+"</td></tr>");
						out.print("<tr><td></td><td><a href='updateprofile.jsp?logid="+rs.getString(1)+"'>UPDATE</a></td></tr>");
				}
				out.print("</table>");
				rs.close();
				stmt.close();
				con.close();
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