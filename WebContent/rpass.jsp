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
String email=request.getParameter("email");
try
   {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bug_tracker","root","mysql");
			PreparedStatement ps=con.prepareStatement("select * from login where email=?");
			ps.setString(1,email);
			ResultSet rs=ps.executeQuery();
			while(rs.next())
			{
			     i++;
				 logid=rs.getString(1);
				 pwd=rs.getString(3);
				 type=rs.getString(5);
			}
			rs.close();
			ps.close();
			con.close();
	}
	catch(Exception ee)
		{
			ee.printStackTrace();
		}
	if(i>0)
		{
			//out.print("Logid= "+logid);
			//out.print("<br>password= "+pwd);
			//out.print("<br>userType= "+type);
			//RequestDispatcher rd=request.getRequestDispatcher ("resetpass.jsp");
			//rd.include(request, response);
			response.sendRedirect("index.jsp?message=logid password utype\n"+logid+'+'+pwd+'+'+type);
			
		}
	else
		{
		    out.print("ur email is not correct ! reinsert:");
			RequestDispatcher rd=request.getRequestDispatcher ("resetpass.jsp");
			rd.include(request, response);
		
		}
 %>
</body>
</html>