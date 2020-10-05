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
   			
   			<%
   			boolean status=false;
   			//String prodid=request.getParameter("prodid");
   			try
			{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bug_tracker","root","mysql");
			PreparedStatement stmt1=con.prepareStatement("select bugid,errordetails,solution,soln_date from solutions");
			//stmt.setString(1, prodid);
			ResultSet rs1=stmt1.executeQuery();
			if(rs1.next())
			{
			PreparedStatement stmt=con.prepareStatement("select bugid,errordetails,solution,soln_date from solutions");
			//stmt.setString(1, prodid);
			ResultSet rs=stmt.executeQuery();
			out.print("<h2><u>Error Details Are As Follows:</u></h2><br>");
			out.println("<table border='#' class='table1'>");
			out.println("<tr><th>Error</th><th>Solution</th><th>Solution Date</th><th></th></tr>");
			while(rs.next())
				{
						
						out.print("<td>"+rs.getString(2)+"</td>");
						out.print("<td>"+rs.getString(3)+"</td>");
						out.print("<td>"+rs.getDate(4)+"</td><td><a href='viewdet.jsp?bugid="+rs.getString(1)+"&date="+rs.getDate(4)+"'>Details</a></td></tr>");
				}
				out.print("</table>");
				rs.close();
				stmt.close();
				con.close();
			}
			else out.print("<h2>Bug not Available......<h2>");
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