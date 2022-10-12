<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>

<%
String email = request.getParameter("email");
String password = request.getParameter("password");

try{
	
	 Connection con = null;
		Class.forName("oracle.jdbc.driver.OracleDriver");
		System.out.println("ok");
		con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "project","project");
		System.out.println("succed");
	PreparedStatement pstmt=con.prepareStatement("select * from technicianreg where email=? and password=?");
	pstmt.setString(1,email);
	pstmt.setString(2,password);
	ResultSet rs = pstmt.executeQuery();
	if(rs.next()){
		session.setAttribute("username",rs.getString("username"));
		session.setAttribute("email","email");
		session.setAttribute("password","password");
		session.setMaxInactiveInterval(1000000);
		response.sendRedirect("tech_userhome.jsp");
		
	}
	else
	{
		response.sendRedirect("technician_inlogin.html");	
	}
}
catch(Exception e){
	out.println(e);
	
	
	
}


%>
