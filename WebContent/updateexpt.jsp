<%@ page language="java" import="java.sql.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
function showCustomer(str)
{
if (str=="")
  {
  document.getElementById("txtHint").innerHTML="";
  return;
  }  
if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
    document.getElementById("pid").innerHTML=xmlhttp.responseText;
    }
  }
xmlhttp.open("GET","getver.jsp?pname="+str,true);
xmlhttp.send();
}
</script>
<script type="text/javascript" src="javascript/disableback.js">  </script>
<link href="" rel="shortcut icon"/>
<link href="mycss.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="javascript/validate.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Expert</title>
</head>
<body>
 <div class="wrapper">
   		<div class="header">
   		  <BR>
   		<BR>
   		<center><h1>Bug Tracking System</h1></center>
   	    </div>
   	        <div class="nav">
   				<ul>
 			  		<li><a href="admin.jsp">Home</a></li>
   					<li><a href="addexpert.jsp">Add Expert</a></li>
   					<li><a href="updateexpert.jsp" >Update Expert</a></li>
   					<li><a href="logout.jsp">Logout</a></li>
   				</ul>
   	  </div>
<div class="content3">
<%String logid=(String)session.getAttribute("logid");if(logid==null){ %><jsp:forward page="index.jsp"/><%} %>
  
   			<center>
   			<h5><font color="red" size="4">${param.message}</font></h5>
   			<h1><u>: Update Expert Details :</u></h1><br>
   			<form action='updateexptdb.jsp' onsubmit="return validExpert(this);" method="post" name="myform">
   			<table class='table1'><tr>
   			<%
			String expertid=request.getParameter("expertid");
   			try
			{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bug_tracker","root","mysql");
			PreparedStatement stmt=con.prepareStatement("select * from login where login_id=?");
			stmt.setString(1,expertid);
			ResultSet rs=stmt.executeQuery();
			out.println("<input type='hidden' name='expertid' value='"+expertid+"'>");
			//out.print("<td>ExpertId</td><td>ExpertName</td><td>ProductId</td><td></td><tr> ");
			if(rs.next())
			{
			out.print("<tr><td>Expertid:</td><td>"+rs.getString(1)+"</td></tr>");
			out.print("<tr><td>Exper Name:</td><td><input type='text' class='textbox' name='expertname' value='"+rs.getString(2)+"'></td></tr>");
			out.print("<tr><td>Address:</td><td><input type='text' class='textbox' name='address' value='"+rs.getString(3)+"'></td></tr>");
			out.print("<tr><td>password:</td><td><input type='text' class='textbox' name='password' value='"+rs.getString(4)+"'></td></tr>");
			out.print("<tr><td>Email:</td><td><input type='text' class='textbox' name='email' value='"+rs.getString(5)+"'></td></tr>");
			out.print("<tr><td>Mobile:</td><td><input type='text' class='textbox' name='mobile' value='"+rs.getString(6)+"'></td></tr>");
			}
			PreparedStatement stmt1=con.prepareStatement("select distinct prodname from products");
 			ResultSet rs1=stmt1.executeQuery();
 			out.print("<tr><td>Product Name:</td><td><select class='textbox'  name='pname' onchange='showCustomer(this.value)'><option value=''>--Select Product--</option>");
 			while(rs1.next())
			{
				out.print("<option>"+rs1.getString(1)+"</option>");
			}
 			out.print("</select>");
			}
			catch(Exception e)
			{
			e.printStackTrace();
			}
   			 %>
   			 <tr><td>Product version :</td><td><span id="pid"></span></td></tr>
   			 <tr><td>Field of Expertise :</td><td><select class="textbox" name="expertin"><option value="">--Select--</option><option value="hardware">Hardware</option><option value="software">Software</option><option value="network">network</option><option value="database">Database</option></select></td></tr>
   			 <tr><td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   			 &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Apply" class="button" ></td></tr>
   			 </table>
   			 </form>
   			 	</center>
   			<br>	
   		</div>
   		</div>
</body>
</html>
