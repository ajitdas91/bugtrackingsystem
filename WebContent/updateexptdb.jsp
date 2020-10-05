<%@ page language="java" import="java.sql.*,java.io.*" contentType="text/html; charset=ISO-8859-1"
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
		String expertid=request.getParameter("expertid");
		String expertname=request.getParameter("expertname");
		String address=request.getParameter("address");
		String password=request.getParameter("password");
		String email=request.getParameter("email");
		String mobile=request.getParameter("mobile");
		String expertin=request.getParameter("expertin");
		String pname=request.getParameter("pname");
		String version=request.getParameter("version");
		out.println(expertid);
		out.println(expertname);
		out.println(address);
		out.println(password);
		out.println(email);
		out.println(mobile);
		out.println(expertin);
		out.println(pname);
		out.println(version);
		
		try
		{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bug_tracker","root","mysql");
		PreparedStatement stmt=con.prepareStatement("update login set name=?,address=?,password=?,email=?,mobile=?,expertin=? where login_id=?");
		stmt.setString(1,expertname);
		stmt.setString(2,address);
		stmt.setString(3,password);
		stmt.setString(4,email);
		stmt.setString(5,mobile);
		stmt.setString(6,expertin);
		stmt.setString(7,expertid);
		stmt.executeUpdate();
		
		PreparedStatement stmt1=con.prepareStatement("update expert set expertname=?,prodname=?,pver=? where expertid=?");
		stmt1.setString(1,expertname);
		stmt1.setString(2,pname);
		stmt1.setString(3,version);
		stmt1.setString(4,expertid);
		i=stmt1.executeUpdate();
		//out.print("hiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii ggg");
		}
	catch(Exception e)
	    {
		e.printStackTrace();
		}
		if(i>0)
		{
		response.sendRedirect("updateexpert.jsp?message=Update Sucessful !");
		}
 %>
</body>
</html>