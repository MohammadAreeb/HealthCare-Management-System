<%@page import="java.sql.*"%>
<%
String cname = request.getParameter("cname");
String test_type = request.getParameter("test_type");
String ctestcost = request.getParameter("ctestcost");

try {
	
	Connection con = null;
	Class.forName("oracle.jdbc.driver.OracleDriver");
	System.out.println("ok");
	con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "project","project");
	System.out.println("succed");
	
	
	PreparedStatement pstmt = con.prepareStatement("insert into costcustomer values(?,?,?)");
	pstmt.setString(1,cname);
	pstmt.setString(2,test_type);
	pstmt.setString(3,ctestcost);
	int n =pstmt.executeUpdate();
	 if(n>0){
		 response.sendRedirect("tech_customer_details.jsp?m1=success");
		  }
		  else{
			  response.sendRedirect("tech_customer_details.jsp?m2=Failed");
		  }
	
}

catch(Exception e){
	System.out.println(e);
	
}




%>
	