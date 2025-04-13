<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*"
    import="java.util.*" %>
<%
String category=request.getParameter("category");
String count=request.getParameter("quantity");
String productname= request.getParameter("productname");
String price=request.getParameter("price");
String filename=request.getParameter("filename");
String userid=request.getParameter("userid");
try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/projectfull2","root","54112");
	String q="insert into cart(count,filename,price,productname,userid) values(?,?,?,?,?)";
	PreparedStatement ps=con.prepareStatement(q);
	ps.setString(1,count);
	ps.setString(2,filename);
	ps.setString(3,price);
	ps.setString(4,productname);
	ps.setString(5,userid);
	ps.executeUpdate();
	con.close();
}
catch(Exception e){
	e.printStackTrace();
}
response.sendRedirect(category+".jsp");
%>