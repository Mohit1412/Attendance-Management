<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import= "javax.servlet.http.HttpServlet"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>register.jsp</title>
</head>
<body>
<% 
String name=request.getParameter("name");  
String r_no=request.getParameter("r_no"); 
String batch=request.getParameter("batch"); 
String year=request.getParameter("year"); 
String password=request.getParameter("password"); 

Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/college","root",""); 

Statement st= con.createStatement(); 
ResultSet rs; 
int i=st.executeUpdate("insert into stud_reg values ('"+name+"','"+r_no+"','"+batch+"',	'"+year+"','"+password+"')"); 

out.println("Registered"); 
response.sendRedirect("stud_login.html");
%>

</body>
</html>