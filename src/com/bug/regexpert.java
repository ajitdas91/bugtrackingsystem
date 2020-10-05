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

public class regexpert extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	int i=0;

	/**
	 * Constructor of the object.
	 */
	public regexpert() {
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
		String expertname=request.getParameter("expertname");
		String address=request.getParameter("address");
		String password=request.getParameter("password");
		String email=request.getParameter("email");
		String mobile=request.getParameter("mobile");
		String expertin=request.getParameter("expertin");
		String pname=request.getParameter("pname");
		String ver=request.getParameter("version");
		String user=request.getParameter("utype"),logid="";

		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bug_tracker","root","mysql");
			PreparedStatement stmt=con.prepareStatement("insert into login(name,address,password,email,mobile,expertin,type) values(?,?,?,?,?,?,?)");
			stmt.setString(1,expertname);
			stmt.setString(2,address);
			stmt.setString(3,password);
			stmt.setString(4,email);
			stmt.setString(5,mobile);
			stmt.setString(6,expertin);
			stmt.setString(7,user);
		    stmt.executeUpdate();
			stmt.close();
			PreparedStatement stmt2=con.prepareStatement("select login_id from  login where  name=? and address=? and password=? and email=? and mobile=? and expertin=? and type=?");
			stmt2.setString(1,expertname);
			stmt2.setString(2,address);
			stmt2.setString(3,password);
			stmt2.setString(4,email);
			stmt2.setString(5,mobile);
			stmt2.setString(6,expertin);
			stmt2.setString(7,user);
			ResultSet rs=stmt2.executeQuery();
			if(rs.next())
			{
				logid=rs.getString(1);
			}
			PreparedStatement stmt1=con.prepareStatement("insert into expert values(?,?,null,?,?,null)");
			stmt1.setString(1,logid);
			stmt1.setString(2,expertname);
			stmt1.setString(3,pname);
			stmt1.setString(4,ver);
			i=stmt1.executeUpdate();
			con.close();
	   }
		catch(Exception e)
		{
			e.printStackTrace();
		}
		if(i>0)
		{
			response.sendRedirect("addexpert.jsp?message='Record Sucessfully inserted'");
		}
		else
		{
			response.sendRedirect("addexpert.jsp?message='Duplicate Entry'");
		}

    }
}
