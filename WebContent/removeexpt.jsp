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

	int i=0;
	String prodid=request.getParameter("expertid");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bug_tracker","root","mysql");
PreparedStatement stmt=con.prepareStatement("delete from expert where expertid=?");
stmt.setString(1,prodid);
i=stmt.executeUpdate();
PreparedStatement stmt1=con.prepareStatement("delete from login where login_id=?");
stmt1.setString(1,prodid);
i=stmt1.executeUpdate();
}
catch(Exception e)
{
e.printStackTrace();
}
if(i>0)
{
response.sendRedirect("updateprod.jsp?message=Product removed whose Expert id ='"+prodid+"'");
}
else
response.sendRedirect("updateexpert.jsp?message=Remove Fails");
%>
</body>
</html>