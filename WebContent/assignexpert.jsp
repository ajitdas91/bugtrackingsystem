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
<%			String bugid=request.getParameter("bugid");
   			String prodid=request.getParameter("prodid");
   			String expertid=request.getParameter("expertid");
   			int i=0;
   			try
			{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bug_tracker","root","mysql");
			PreparedStatement stmt=con.prepareStatement("update bug_details set assign_to=? where bugid=?");
			stmt.setString(1,expertid);
			stmt.setString(2,bugid);
			i=stmt.executeUpdate();
			}
			catch(Exception e)
			{
			e.printStackTrace();
			}
			if(i>0)
			{
			 response.sendRedirect("assignbug.jsp?message=Assigned Sucess");
			}
			else
			{
			 response.sendRedirect("assignbug.jsp?message=Assigned Failure");
			}
   			 %>	
</body>
</html>