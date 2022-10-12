<%@page import="java.sql.*" %>
<%

String  name = request.getParameter("name");
String mobilenumber = request.getParameter("mobilenumber");
String email = request.getParameter("email");
String message = request.getParameter("message");
int id = (int)(Math.random()*99999)+1;
%>

<%

try
{

    Connection con = null;
	Class.forName("oracle.jdbc.driver.OracleDriver");
	System.out.println("ok");
	con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "project","project");
	System.out.println("succed");
	PreparedStatement pstmt = con.prepareStatement("insert into contact values(?,?,?,?,?,?)");
	pstmt.setString(1,name);
	pstmt.setString(2,mobilenumber);
	pstmt.setString(3,email);
	pstmt.setString(4,message);
	pstmt.setInt(5,id);
	pstmt.setTimestamp(6,new Timestamp(System.currentTimeMillis()));
	
	
	int n= pstmt.executeUpdate();
	
	if(n>0)
	{
		
		%>
		
		<h3 align= center> Message sent succesfully</h3>
		<% 
	}
	
	else
	{
	
	
	%>
	
	<h3 align=center>Message failed</h3>
	
	<%
	}
}
	
	catch(Exception e)
	{
		
		out.println("Exception:" +e);
		
	}
	%>
	
	