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
String logid="",pwd="",type="";
String name=request.getParameter("uname");
String address=request.getParameter("address");
String password=request.getParameter("pwd");
String email=request.getParameter("email");
String mobile=request.getParameter("mobile");
String user=request.getParameter("utype");
HttpSession s=request.getSession();
try
   {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bug_tracker","root","mysql");
			PreparedStatement stmt=con.prepareStatement("insert into login(name,address,password,email,mobile,type) values(?,?,?,?,?,?)");
			stmt.setString(1,name);
			stmt.setString(2,address);
			stmt.setString(3,password);
			stmt.setString(4,email);
			stmt.setString(5,mobile);
			stmt.setString(6,user);
			i=stmt.executeUpdate();
			stmt.close();
			PreparedStatement ps=con.prepareStatement("select * from login where email=?");
			ps.setString(1,email);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
				i++;
				logid=rs.getString(1);
				pwd=rs.getString(4);
				type=rs.getString(7);
			}
			rs.close();
			ps.close();
			con.close();
	}
	catch(Exception ee)
		{
		response.sendRedirect("regdetails.jsp?message=Duplicate Entry");
		ee.printStackTrace();
		}
	if(i>0)
		{
		s.setAttribute("logid",logid);
		//response.sendRedirect("user.jsp");
			//RequestDispatcher rd=request.getRequestDispatcher (regdetails.jsp?message=+logid+'+'+pwd+'+'+type);
			//rd.forward(request, response);
			response.sendRedirect("user.jsp?message=logid  password<br>"+logid+'+'+pwd);
			
		}
	
 %>
</body>
</html>