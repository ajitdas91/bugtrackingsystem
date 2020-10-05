<%@ page language="java" import="java.sql.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="javascript/disableback.js">  </script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
		int i=0;
		int logid=Integer.parseInt(request.getParameter("logid"));
		String name=request.getParameter("name");
		System.out.print(name);
		String address=request.getParameter("address");
		String password=request.getParameter("password");
		String email=request.getParameter("email");
		String mobile=request.getParameter("mobile");
		try
		{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bug_tracker","root","mysql");
		PreparedStatement stmt=con.prepareStatement("update login set name=?,address=?,password=?,email=?,mobile=?  where login_id=?");
		stmt.setString(1,name);
		stmt.setString(2,address);
		stmt.setString(3,password);
		stmt.setString(4,email);
		stmt.setString(5,mobile);
		stmt.setInt(6, logid);
		i=stmt.executeUpdate();
		}
	catch(Exception e)
	    {
		e.printStackTrace();
		}
		if(i>0)
		{
		response.sendRedirect("profile.jsp?message=Update Sucessful !");
		}
 %>
</body>
</html>