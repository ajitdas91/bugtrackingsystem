 <%@ page language="java" import="java.sql.*" contentType="text/html; charset=ISO-8859-1"
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
xmlhttp.open("GET","update_exp.jsp?expertin="+str,true);
xmlhttp.send();
}
</script>
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
 			  		<li><a href="admin.jsp">Home</a></li>
   					<li><a href="addexpert.jsp">Add Expert</a></li>
   					<li><a href="updateexpert.jsp" >Update Expert</a></li>
   					<li><a href="logout.jsp">Logout</a></li>
   				</ul>
   	  </div>
   	  <div class="content3">
   	  	<center>
   			<h5><font color="red" size="4">${param.message}</font></h5><br>
   				<table>
   					<tr><td>Select a Department:</td><td><select class="listbox" name="expertin" onchange="showCustomer(this.value)"><option value="" >Expert In</option><option value="hardware">Hardware</option><option value="software">Software</option><option value="network">network</option><option value="database">Database</option></select></td></tr>
   				</table>
   			</center>
   			<span id="txt"></span>
   	    </div>
   	 <div class="footer">
   	 </div>
</div>
</body>
</html>