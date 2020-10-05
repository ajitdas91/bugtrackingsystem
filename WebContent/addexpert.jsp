<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="javascript/disableback.js">  </script>
<link href="" rel="shortcut icon"/>
<link href="mycss.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="javascript/validate.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User</title>
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
    document.getElementById("txt").innerHTML=xmlhttp.responseText;
    }
  }
xmlhttp.open("GET","getver.jsp?pname="+str,true);
xmlhttp.send();
}
</script>
</head>
<body>
<%String logid=(String)session.getAttribute("logid");if(logid==null){ %><jsp:forward page="index.jsp"/><%} %>
   <div class="wrapper">
   		<div class="header">
   		<BR>
   	
   		<center><h1>Bug Tracking System</h1></center>
   	    </div>
   	        <div class="nav">
   				<ul>
 			  		<li><a href="admin.jsp">Home</a></li>
   					<li><a href="addexpert.jsp">Add Expert</a></li>
   					<li><a href="updateexpert.jsp">Update Expert</a></li>
   					<li><a href="logout.jsp">Logout</a></li>
   				</ul>
   	  </div>
   	  	<div class="content3">
   			<center>
   			<h5><font color="red" size="4">${param.message}</font></h5>
   			<br>
   			<h2><u>Fill The Expert Details:</u></h2>
   			<br>
   				<form name="myform" onsubmit="return validExpert(this)" action="regexpert" method="post" >
   				<input type="hidden" class="textbox" name="utype" value="expert">
   				<table class="table1" border="#">
   					<tr><td><span>*</span>Name :</td><td><input type="text" class="textbox" name="expertname" placeholder="Enter Expert name"></td></tr>
   					<tr><td><span>*</span>Address :</td><td><textarea  class="textarea" name="address" placeholder="Enter Address"></textarea></td></tr>
   					<tr><td><span>*</span>Password :</td><td><input type="text" class="textbox" name="password" placeholder="Enter Password"></td></tr>
   					<tr><td><span>*</span>Email :</td><td><input type="text" class="textbox" name="email" placeholder="Enter Email"></td></tr>
   					<tr><td>Mobile :</td><td><input type="text" class="textbox" name="mobile" placeholder="Enter mobile No."></td></tr>
   					<tr><td><span>*</span>Field of Expertise :</td><td><select class="textbox" name="expertin"><option value="">--Select--</option><option value="hardware">Hardware</option><option value="software">Software</option><option value="network">network</option><option value="database">Database</option></select></td></tr>
   					<tr><td><span>*</span> Product Name :</td><td><select name="pname" class="textbox" onchange="showCustomer(this.value)"><option value="">--Select Product--</option>
   					<%
   					try
   					{
   					Class.forName("com.mysql.jdbc.Driver");
   					Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bug_tracker","root","mysql");
   					PreparedStatement stmt=con.prepareStatement("select distinct prodname from products");
   					ResultSet rs=stmt.executeQuery();
   					while(rs.next())
   					{
   					out.print("<option>"+rs.getString(1)+"</option>");
   					}
   					}
   					catch(SQLException e){e.printStackTrace();}
   					%>
   					</select></td></tr>
   					<tr><td>Product Version :</td><td><span id="txt"></span></td></tr>
   					<tr><td></td><td><input type="submit" class="button" value="submit"></td></tr>	
   				</table>
   				</form>
   				<span>* Field Are Mandatory</span>
   			</center>
 			<br> 		
   	    </div>
   	 <div class="footer">
   	 </div>
</div>
</body>
</html>