<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String logid=request.getParameter("logid");
String password=request.getParameter("pwd");
//String user=request.getParameter("utype");
String type="";
boolean status=false;
HttpSession ses=request.getSession();
try
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bug_tracker","root","mysql");
	PreparedStatement stmt=con.prepareStatement("select * from login where login_id=? and password=?");
	stmt.setString(1,logid);
	stmt.setString(2,password);
	//stmt.setString(3,user);
	ResultSet rs=stmt.executeQuery();
	while(rs.next())
	{
		type=rs.getString(7);
	}
	rs.close();
	stmt.close();
	con.close();
	}
catch(Exception ee)
{
	ee.printStackTrace();
}
 if(type.equals("user"))
{
	ses.setAttribute("logid",logid);
	ses.setAttribute("type",type);
	response.sendRedirect("user.jsp");
}
else if(type.equals("admin"))
{
	ses.setAttribute("logid",logid);
	ses.setAttribute("type",type);
	response.sendRedirect("admin.jsp");
}
else if(type.equals("expert"))
{
	ses.setAttribute("logid",logid);
	ses.setAttribute("type",type);
	response.sendRedirect("texpert.jsp");
}
else
{
	response.sendRedirect("index.jsp?message=Your Logid or Password is invald");
}
  %>
</body>
</html>