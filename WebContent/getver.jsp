<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 import="java.sql.*"   pageEncoding="ISO-8859-1"%>
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
   					PreparedStatement stmt=con.prepareStatement("select prodversion from products where prodname=?");
   					stmt.setString(1, pname);
   					out.print("<select name='version' class='textbox'>");
   					ResultSet rs=stmt.executeQuery();
   					while(rs.next())
   					{
   						//System.out.print(rs.getString(1));
   					out.print("<option>"+rs.getString(1)+"</option>");
   					}
   					out.print("</select>");
   					}
   					catch(SQLException e){e.printStackTrace();}
   					%>
   					
</body>
</html>