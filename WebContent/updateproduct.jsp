<%@ page language="java" import="java.sql.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="javascript/disableback.js">  </script>
<link rel="stylesheet" type="text/css" href="mycss.css">
	<script type="text/javascript" src="javascript/validate.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin</title>
</head>
<body>
<%String logid=(String)session.getAttribute("logid");if(logid==null){ %><jsp:forward page="index.jsp"/><%} %>
   <div class="wrapper">
   		<div class="header">
   		  <BR>
   		<BR>
   		<center><h1>Bug Tracking System</h1></center>   	    
   		</div>
   	   <div class="nav">
   	    <div class="navl">
   	    </div>
   	        <div class="navr">
   				<ul>
 			  		<li><a href="admin.jsp">Home</a></li>
   		 			<li><a href="addproduct.jsp">Add Product</a></li>
   		 			<li><a href="updateprod.jsp">Update Product Info</a></li>
   		 			<li><a href="logout.jsp">Logout</a></li>
   		 		</ul>
   		   </div>
   	  </div>
   	<div class="content3">
   	<center>
   			<h5><font color="red" size="4">${param.message}</font></h5>
   			<h2><u>Update Expert Details</u></h2><br>
   			<%
   			
			String prodid=request.getParameter("prodid");
   			try
			{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bug_tracker","root","mysql");
			PreparedStatement stmt=con.prepareStatement("select * from products where prodid=?");
			stmt.setString(1,prodid);
			ResultSet rs=stmt.executeQuery();
			out.println("<form action='updateproddb.jsp' name='prodform' onsubmit='return validprod1()''><input type='hidden' name='prodid' value='"+prodid+"'><table class='table1' border='#'>");
			//out.print("<td>ExpertId</td><td>ExpertName</td><td>ProductId</td><td></td><tr> ");
			while(rs.next())
			{
			out.print("<tr><td>Product Id :</td><td>"+rs.getString(1)+"</td></tr>");
			out.print("<tr><td>Product Name :</td><td><input type='text' class='textbox' name='prodname' value='"+rs.getString(2)+"'></td></tr>");
			out.print("<tr><td>Product Version :</td><td><input type='text' class='textbox' name='prodversion' value='"+rs.getString(3)+"'></td></tr><tr><td></td><td><input type='submit' class='button' value='Apply'></td></tr>");
			}
			out.print("</table></form>");
			}
			catch(Exception e)
			{
			e.printStackTrace();
			}
   			 %>
   				
   			</center>
   	</div>
   	 <div class="footer">
   	 </div>
</div>
</body>
</html>