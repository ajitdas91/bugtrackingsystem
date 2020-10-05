package com.bug;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class regbug extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3937854920760597024L;
	int i=0;

	/**
	 * Constructor of the object.
	 */
	public regbug() {
		super();
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String authorid=request.getParameter("authorid");
		String uname=request.getParameter("uname");
		String prodid=request.getParameter("prodid");
		String prodname=request.getParameter("prodname");
		String env=request.getParameter("env");
		String severity=request.getParameter("severity");
		String desc=request.getParameter("desc");
		String bugid="";
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bug_tracker","root","mysql");
			PreparedStatement stmt=con.prepareStatement("insert into bug_details(authorid,author,prodid,prodname,env,type,description,rep_date,status) values(?,?,?,?,?,?,?,CURDATE(),'new')");
			stmt.setString(1,authorid);
			stmt.setString(2,uname);
			stmt.setString(3,prodid);
			stmt.setString(4,prodname);
			stmt.setString(5,env);
			stmt.setString(6,severity);
			stmt.setString(7,desc);
			i=stmt.executeUpdate();
			stmt.close();
			PreparedStatement stmt1=con.prepareStatement("select bugid from bug_details where authorid=? and author=? and prodid=? and prodname=? and env=? and type=? and description=?");
			stmt1.setString(1,authorid);
			stmt1.setString(2, uname);
			stmt1.setString(3,prodid);
			stmt1.setString(4,prodname);
			stmt1.setString(5,env);
			stmt1.setString(6,severity);
			stmt1.setString(7,desc);
			ResultSet rs=stmt1.executeQuery();
			if(rs.next())
			{
				//System.out.print(rs.getString(1));
			bugid=rs.getString(1);
			}
			con.close();
			}
		catch(Exception ee)
		{
			ee.printStackTrace();
		}
		
	   if(i>0)
	   {
		  // out.print("data insert sucess");
		   response.sendRedirect("user.jsp?message=Post Success ! If You Want To Post Photo Please <a href='photo.jsp?bugid="+bugid+"' >Click Here</a>");
	   }
	   else
	   {
		   response.sendRedirect("postbug.jsp?message=Duplicate Entry");
	   }
	}

}
