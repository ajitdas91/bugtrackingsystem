package com.bug;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class addproduct extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	int i=0;

	/**
	 * Constructor of the object.
	 */
	public addproduct() {
		super();
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String prodname=request.getParameter("prodname");
		String version=request.getParameter("prodver");

		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bug_tracker","root","mysql");
			PreparedStatement stmt=con.prepareStatement("insert into products(prodname,prodversion) values(?,?)");
			stmt.setString(1,prodname);
			stmt.setString(2,version);
			i=stmt.executeUpdate();
			stmt.close();
			con.close();
	   }
		catch(Exception e)
		{
			e.printStackTrace();
		}
		if(i>0)
		{
			response.sendRedirect("addproduct.jsp?message='Record Sucessfully inserted'");
		}
		else
		{
			response.sendRedirect("addproduct.jsp?message='Duplicate Entry'");
		}
	}

}
