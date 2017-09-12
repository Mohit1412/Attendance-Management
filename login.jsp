<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import= "javax.servlet.http.HttpServlet"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login.jsp</title>
</head>
<body>
<%
String r_no=request.getParameter("r_no");
session=request.getSession();
session.setAttribute("name",r_no);
String password=request.getParameter("password"); 


Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/college","root",""); 

Statement st= con.createStatement(); 
ResultSet rs=st.executeQuery("select * from stud_reg where r_no='"+r_no+"'"); 
if(rs.next()) 
{ 
if(rs.getString(5).equals(password)) 
{ 
	 response.sendRedirect("stud_attendance.html"); 

} 
else 
{ 
out.println("Invalid password try again"); 
} 
}
%>

</body>
</html>