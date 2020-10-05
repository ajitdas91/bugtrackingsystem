function validateform(thisform)
{
	
	var uname=document.forms["myform"]["uname"].value;
	var pass=document.forms["myform"]["pwd"].value;
	var pass1=document.forms["myform"]["pwd1"].value;
	var email=document.forms["myform"]["email"].value;
	var mobile=document.forms["myform"]["mobile"].value;
	var address=document.forms["myform"]["address"].value;
	if(uname=="" || uname==null)
		{
		alert("Name should not empty");
		return false;
		}
	if(address=="" || address==null)
	{
	alert("Address Should not empty");
	return false;
	}
	if(pass=="" || pass==null)
		{
		alert("password not empty");
		return false;
		}
	if(pass!=pass1)
	{
	alert("password not matched");
	return false;
	}
	if(isNaN(mobile))
	{
	alert("Enter a valid Number !");
	return false;
	}
	if((mobile.length < 10) || (mobile.length > 10)) 
	{
		alert(" Your Mobile Number must be 10 Digit !");
		//document.form.mobile.select();
		return false;
	}
	if(email=="" || email==null)
		{
		alert("Enter ur email");
		return false;
		}
	if(email!="")
		{
		with (thisform)
		  {
		  if (validate_email(email,"Not a valid e-mail address!")==false)
		    {email.focus();return false;}
		  }
		}
	
}
function validate_email(field,alerttxt)
{
with (field)
  {
  apos=value.indexOf("@");
  dotpos=value.lastIndexOf(".");
  if (apos<1||dotpos-apos<2)
    {alert(alerttxt);return false;}
  else return;
  }
}


function loginvalid()
{
	var logid=document.forms["loginform"]["logid"].value;
	var pass=document.forms["loginform"]["pwd"].value;
	//var utype=document.forms["loginform"]["utype"].value;
	if(logid=="" || logid==null)
		{
		alert("Log id shoud not be empty");
		return false;
		}
	else if(pass=="" || pass==null)
		{
		alert("password shoud not be empty");
		return false;
		}
}
function validExpert(thisform)
	{
	//alert("hiiiiiiiiiiiiiiiiiiiiiiii");
		var ename=document.forms["myform"]["expertname"].value;
		var address=document.forms["myform"]["address"].value;
		var password=document.forms["myform"]["password"].value;

		var email=document.forms["myform"]["email"].value;
		var mobile=document.forms["myform"]["mobile"].value;
		var expertin=document.forms["myform"]["expertin"].value;
		var pname=document.forms["myform"]["pname"].value;
		if(ename=="" || ename==null)
			{
			alert("Name shoud not be empty");
			return false;
			}
		if(address=="" || address==null)
			{
			alert("Address shoud not be empty");
			return false;
			}
		if(password=="" || password==null)
			{
			alert("password should not be Empty");
			return false;
		}
		if(email=="" || email==null)
		{
		alert("Email Should not be Empty");
		return false;
	     }
		if(email!="")
		{
		with (thisform)
		  {
		  if (validate_email(email,"Not a valid e-mail address!")==false)
		    {
			  return false;
			}
		  }
		}
		
		if(isNaN(mobile))
		{
		alert("Enter a valid Number !");
		return false;
		}
		if((mobile.length < 10) || (mobile.length > 10)) 
		{
			alert(" Your Mobile Number must be 10 Digit !");
			//document.form.mobile.select();
			return false;
		}
		if(expertin=="" || expertin==null)
		{
		alert("Select a Expertise Field");
		return false;
	     }
		if(pname=="" || pname==null)
		{
		alert("Product Name not Empty !");
		return false;
	    }
		if(version=="" || version==null)
		{
		alert("Product version not Empty !");
		return false;
	    }

}
function validprod()
{
	
	var prodname=document.forms["prodform"]["prodname"].value;
	var prodver=document.forms["prodform"]["prodver"].value;
	if(prodname=="" || prodname==null)
		{
		alert("produt name should not be empty");
		return false;
		}
	else if(prodver=="" || prodver==null)
		{
		alert("product version should not be empty");
		return false;
		}
}
function validprod1()
{
	
	var prodname=document.forms["prodform"]["prodname"].value;
	var prodversion=document.forms["prodform"]["prodversion"].value;
	if(prodname=="" || prodname==null)
		{
		alert("produt name should not be empty");
		return false;
		}
	else if(prodversion=="" || prodversion==null)
		{
		alert("product version should not be empty");
		return false;
		}
}
function validprodid()
{
	
	var prodid=document.forms["myform"]["prodid"].value;
	if(prodid=="" || prodid==null)
		{
		alert("product Id should not be empty");
		return false;
		}
}
function validbug()
{
	var uname=document.forms["bugform"]["uname"].value;
	var prodid=document.forms["bugform"]["prodid"].value;
	var prodname=document.forms["bugform"]["prodname"].value;
	var env=document.forms["bugform"]["env"].value;
	var severity=document.forms["bugform"]["severity"].value;
	var desc=document.forms["bugform"]["desc"].value;
	if(uname=="" || uname==null)
		{
		alert("User name should not be empty");
		return false;
		}
	else if(prodid=="" || prodid==null)
		{
		alert("product Id should not be empty");
		return false;
		}
	else if(prodname=="" || prodname==null)
	{
	alert("product Name should not be empty");
	return false;
	}
	else if(env=="" || env==null)
	{
	alert("Select the Environment");
	return false;
	}
	else if(severity=="" || severity==null)
	{
	alert("Select one Severity");
	return false;
	}
	else if(desc=="" || desc==null)
	{
	alert("Description should not be empty");
	return false;
	}
}
function validDate()
{
	var sdate=document.repform.sdate.value;
	var edate=document.repform.edate.value;
	if(sdate=="" || sdate==null)
	{
	alert("Start date should not be empty");
	return false;
	}
	if(edate=="" || edate==null)
	{
	alert("End date should not be empty");
	return false;
	}
}