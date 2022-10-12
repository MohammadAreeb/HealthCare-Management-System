<%@page import="java.sql.*"%>
<!doctype html>
<html lang="en">
  <head>
  
 
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>ALL TECHNICIANS</title>
   
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">

 
  </head>
  <%
if(request.getParameter("m1")!=null){%>
    
<script>alert('Boked Sucess!')</script>

<%}
if(request.getParameter("m2")!=null){%>

<script>alert('Item Failed..!')</script>
 <%
}
%> 
  <body >
 
  <div class="container-fluid" >
  <br>
  <h3 style="text-align: center; letter-spacing: 2px; padding:20px;">HEALTH   CARE   LOGISTICS</h3>
 
</div>

   
  <nav class="navbar navbar-expand-lg navbar navbar-dark bg-primary">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Customer</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse " id="navbarSupportedContent">
      <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="userhome.jsp">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="booktechnician.jsp"> Book Technicians</a>
        </li>
       
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="customer_viewdetails.jsp">View Bills</a>
        </li>
        
         <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="customer_logout.jsp">Logout</a>
        </li>
       


      

       
      </ul>
     
    </div>
  </div>
</nav>



   
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>

<%

try
{
	Connection con = null;
	Class.forName("oracle.jdbc.driver.OracleDriver");
	con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","project","project");
	PreparedStatement pstmt = con.prepareStatement("select * from technicianreg");
	ResultSet rs = pstmt.executeQuery();
%>	
	<h3 style="padding:40px;" align=center > ALL TECHNICIANS </h3><br>
	<table class="table">
  <thead>
    <tr>
	<th scope="col"> ID</th>
	<th scope="col">NAME</th>
	<th scope="col">EMAIL</th>
	<th scope="col">LOCATION</th>
	<th scope="col">AVAILABLE TIME</th>
	<th scope="col">MOBILE NO</th>
	<th scope="col">BOOK</th>
   
</tr>
  </thead>
<% 	
	while(rs.next()) {
	%>	
	<tbody>
		<tr>
		<td scope="row"><%=rs.getString(1) %></td>
		<td scope="row"><%=rs.getString(2) %></td>
		<td scope="row"><%=rs.getString(3) %></td>
		<td scope="row"><%=rs.getString(5) %></td>
		<td scope="row"><%=rs.getString(6) %></td>
		<td scope="row"><%=rs.getString(7) %></td>
		<td scope="row"><a href="bookdetails.jsp?tname=<%=rs.getString(2)%>&tlocation=<%=rs.getString(5)%>&tphoneno=<%=rs.getString(7)%>&tavailtime=<%=rs.getString(6)%>">click here to book</a></td>
		
		</tr>
		</tbody>
<%		
	}
%>

	</table>
<%	
}
catch(Exception e) {
	
	out.println(e);
	
}

%>











   
  </body>
</html>

