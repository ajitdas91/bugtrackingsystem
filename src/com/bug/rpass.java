package com.bug;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class rpass
 */
@WebServlet("/rpass")
public class rpass extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public rpass() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int i=0;
		String logid="",pwd="";
		String email=request.getParameter("email");
		try
		   {
					Class.forName("com.mysql.jdbc.Driver");
					Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bug_tracker","root","mysql");
					PreparedStatement ps=con.prepareStatement("select login_id,password from login where email=?");
					ps.setString(1,email);
					ResultSet rs=ps.executeQuery();
					while(rs.next())
					{
					     i++;
						 logid=rs.getString(1);
						 pwd=rs.getString(2);
						 //type=rs.getString(5);
					}
					rs.close();
					ps.close();
					con.close();
			}
			catch(Exception ee)
				{
					ee.printStackTrace();
				}
		  Password p=new Password();
		  String msg=(String)p.send(email,logid,pwd);
		  response.sendRedirect("index.jsp?message=Please check your Mail  "+msg);
		  //System.out.print(msg);
		  //for sending mail
		  
		 }
	 }