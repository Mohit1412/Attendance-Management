<!DOCTYPE html>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import= "javax.servlet.http.HttpServlet"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Administrator</title>
	<!-- BOOTSTRAP STYLES-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
        <!-- CUSTOM STYLES-->
    <link href="assets/css/custom.css" rel="stylesheet" />
     <!-- GOOGLE FONTS-->
   <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
   <style>
table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}

tr:nth-child(even) {
    background-color: #dddddd;
}
</style>
</head>
<body>
    <div id="wrapper">
         <div class="navbar navbar-inverse navbar-fixed-top">
            <div class="adjust-nav">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div>
              
                 <span class="logout-spn" >
                  <a href="home.html" style="color:#fff;">LOGOUT</a>  

                </span>
            </div>
        </div>
        <!-- /. NAV TOP  -->
        <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
                 	 <li>
                        <a href="stud_attendance.html"><i class="fa fa-bar-chart-o"></i>Show Attendance</a>
                    </li>
					
					 <li>
                        <a href="stud_result.html"><i class="fa fa-bar-chart-o"></i>Result</a>
                    </li>
                </ul>
            </div>

        </nav>
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                     <h2>Attendance</h2>   
                    </div>
                </div>              
                 <!-- /. ROW  -->
	<form name="registration" class="form-horizontal" action="add_admin.jsp" method="post">

<table border="2">
<tr>
	<td>Enrollment no</td>
	<td>Name</td>
	<td>Date</td>
	<td>Status</td>
</tr>
<%
String r_no=request.getParameter("r_no");
String start=request.getParameter("start");
String end=request.getParameter("end");
//String start=request.getParameter("start");
//String end=request.getParameter("end");
try
{
Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost:3306/college";
String username="root";
String password="";
String query="select * from attend where r_no='"+r_no+"' and date >= '"+start+"' and date <= '"+end+"'   ";
Connection conn=DriverManager.getConnection(url, username, password);
Statement stmt=conn.createStatement();
ResultSet rs=stmt.executeQuery(query);
while(rs.next())
{

%>
<tr>
	<td><%=rs.getString("r_no") %></td>
	<td><%=rs.getString("name") %></td>
	<td><%=rs.getString("date") %></td>
	<td><%=rs.getString("status") %></td>
</tr>
<%

}
%>
</table>
<%
rs.close();
stmt.close();
conn.close();
}
catch(Exception e)
{
e.printStackTrace();
out.println("<h1> error: "+ e.getMessage()+"</h1>");
}
%>
  </form>
                  <hr />
              
                 <!-- /. ROW  -->           
			</div>
             <!-- /. PAGE INNER  -->
			 
            </div>
         <!-- /. PAGE WRAPPER  -->
        </div>
</body>
</html>
