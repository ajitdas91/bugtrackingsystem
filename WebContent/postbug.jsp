<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
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
xmlhttp.open("GET","getpid.jsp?pname="+str,true);
xmlhttp.send();
}
</script>
<script type="text/javascript" src="javascript/disableback.js">  </script>
<link href="" rel="shortcut icon"/>
<link href="mycss.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="javascript/validate.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User</title>
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
   				<ul>
 			  		<li><a href="user.jsp">Home</a></li>
 			  		<li><a href="viewbugs.jsp">View Bugs</a></li>
   					<li><a href="postbug.jsp">PostBug</a></li>
   					<li><a href="checkbugstatus.jsp">Bug Status</a></li>
   					<li><a href="profile.jsp">Profile</a></li>
   					<li><a href="logout.jsp">Logout</a></li>
   				</ul>
   	  </div>
   	  	<div class="content2">
   			<center>
   			<h5><font color="red" size="4">${param.message}</font></h5>
   			<h2><u>Fill The Bug Details:</u></h2>
   			<br>
			<%
			try
			{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bug_tracker","root","mysql");
			PreparedStatement stmt=con.prepareStatement("select prodname from products");
			ResultSet rs=stmt.executeQuery();
			
			%>
   				<form action="regbug" method="post" name="bugform" onsubmit="return validbug()">
   				<input type="hidden" name="authorid" value="<%=session.getAttribute("logid") %>">
   				<table class="table1">
   					<tr><td>User Name:</td><td><input type="text" class="textbox" name="uname" placeholder="Enter ur name"></td></tr>
   					<tr><td>Product Name:</td><td><select class="textbox"  name="prodname" onchange="showCustomer(this.value)"><option value="">--Select Product--</option>
   					<%
   					while(rs.next())
   					{
   						out.print("<option>"+rs.getString(1)+"</option>");
   					}
   					%>
   					</select>
   					</td></tr>
   					<tr><td>Product Id:</td><td><span id="pid"></span></td></tr>
   					<tr><td>Environment:</td><td><select class="listbox" name="env"><option value="windows" selected="selected">Windows</option><option value="linux">Linux</option></select></td></tr>
   					<tr><td>Severity</td><td><select class="listbox" name="severity"><option value="high">High</option><option value="middle">Middle</option><option value="low">Low</option></select></td></tr>
   					<tr><td>Bug Description:</td><td><textarea name="desc" class="textarea" placeholder="Enter Bug details "></textarea></td></tr>
   					<tr><td></td><td><input type="submit" class="button" value="submit"></td></tr>
   					<%
			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
   					%>
   				</table>
   				</form>
   			</center>
   			<br><br>
   	    </div>
   	 <div class="footer">
   	 </div>
</div>
</body>
</html>