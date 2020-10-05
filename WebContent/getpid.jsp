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
String pname=request.getParameter("pname");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bug_tracker","root","mysql");
PreparedStatement stmt=con.prepareStatement("select prodid from products where prodname=?");
stmt.setString(1, pname);
ResultSet rs=stmt.executeQuery();
			if(rs.next())
			{
				out.print("<input type='text' value="+rs.getString(1)+" class='textbox' disabled='disabled' ><input type='hidden' value="+rs.getString(1)+"  name='prodid'>");
			}			
}
catch(SQLException e)
{
	e.printStackTrace();
}

%>
</body>
</html>