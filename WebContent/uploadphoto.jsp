<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   import="java.sql.*" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String bugid=(String)session.getAttribute("bugid");
String path="photo/"+bugid+".jpg";
out.print(bugid+path);
int i=0;
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bug_tracker","root","mysql");
PreparedStatement stmt=con.prepareStatement("update bug_details set path=? where bugid=?");
stmt.setString(1,path);
stmt.setString(2,bugid);
i=stmt.executeUpdate();
if(i>0)
{
	//MultipartRequest n=new MultipartRequest(request,"F:/Servlet/Bug_Tracking/WebContent/photo");
   MultipartRequest m=new MultipartRequest(request,"F:/Servlet/Bug_Tracking/WebContent/photo");

}
response.sendRedirect("user.jsp?message=Photo uploaed success");
}
catch(SQLException e)
{
	e.printStackTrace();
}

%>
</body>
</html>