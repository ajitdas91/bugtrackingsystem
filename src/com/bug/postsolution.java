package com.bug;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.http.HttpSession;
public class postsolution extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public postsolution() {
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
		String bugid="",expertid="",error="",prodid="";
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String solution=request.getParameter("solution");
		int i=0;
		try
		{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bug_tracker","root","mysql");
		PreparedStatement stmt=con.prepareStatement("select bugid,assign_to,description,prodid from bug_details");
		ResultSet rs=stmt.executeQuery();
		while(rs.next())
		{
			bugid=rs.getString(1);
			expertid=rs.getString(2);
			error=rs.getString(3);
			prodid=rs.getString(4);
	    }
		rs.close();
		stmt.close();
		PreparedStatement ps=con.prepareStatement("insert into solutions(bugid,expertid,errordetails,solution,soln_date,prodid) values(?,?,?,?,CURDATE(),?)");
	    ps.setString(1,bugid );
	    ps.setString(2,expertid );
	    ps.setString(3,error);
	    ps.setString(4,solution);
	    ps.setString(5,prodid);
	    i=ps.executeUpdate();
		}
		catch(Exception e)
		{
		e.printStackTrace();
		}
		if(i>0)
			response.sendRedirect("viewassignbug.jsp?message=record insert sucess");
	}

}
