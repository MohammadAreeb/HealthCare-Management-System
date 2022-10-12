<%@page import="java.sql.*" %>
<%

String  test = request.getParameter("test");
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
	
	PreparedStatement pstmt = con.prepareStatement("insert into tests values(?,?,?)");
	pstmt.setString(1,test);
	pstmt.setInt(2,id);
    pstmt.setTimestamp(3,new Timestamp(System.currentTimeMillis()));
    int n= pstmt.executeUpdate();
	
	if(n>0)
	{
		
		%>
		
		<h3 align= center> Test added succesfully</h3>
		<% 
	}
	
	else
	{
	
	
	%>
	
	<h3 align=center>Adding failed</h3>
	
	<%
	}
}
	
	catch(Exception e)
	{
		
		out.println("Exception:" +e);
		
	}
	%>
	