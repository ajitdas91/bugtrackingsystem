<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link type="text/css" href="mycss.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<br>
<br>

<center>
<%
String expertin=request.getParameter("expertin");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bug_tracker","root","mysql");
PreparedStatement stmt1=con.prepareStatement("select login_id,name,address,email from login where expertin=?");
stmt1.setString(1,expertin);
ResultSet rs1=stmt1.executeQuery();
if(rs1.next())
{
	PreparedStatement stmt=con.prepareStatement("select login_id,name,address,email from login where expertin=?");
	stmt.setString(1,expertin);
	ResultSet rs=stmt.executeQuery();
	out.print("<table class='table1'><tr><td>Loginid</td><td>Name</td><td>Address</td><td>Email</td><td>Expertin</td></tr>");
	while(rs.next())
	{
	 out.print("<tr><td>"+rs.getString(1)+"</td>");
	 out.print("<td>"+rs.getString(2)+"</td>");
	 out.print("<td>"+rs.getString(3)+"</td>");
	 out.print("<td>"+rs.getString(4)+"</td>");
	 out.print("<td>"+expertin+"</td><td><a href='updateexpt.jsp?expertid="+rs.getString(1)+"'>update</a></td><td><a href='removeexpt.jsp?expertid="+rs.getString(1)+"'>Remove</a></td></tr>");
	}	
	out.print("</table>");
}
}
catch(SQLException e)
{
	e.printStackTrace();
}
%>
</center>
<br>
</body>
</html>