<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
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
	String q="";
	if(Integer.parseInt(count)==0){
		q="delete from cart where userid=? and productname=?";
		PreparedStatement ps=con.prepareStatement(q);
		ps.setInt(1,Integer.parseInt(userid));
		ps.setString(2,productname);
		ps.executeUpdate();
	}
	else{
		q="update cart set count=? where userid=? and productname=?";
		PreparedStatement ps=con.prepareStatement(q);
		ps.setString(1,count);
		ps.setInt(2,Integer.parseInt(userid));
		ps.setString(3, productname);
		ps.executeUpdate();
	}
	
	
	con.close();
}
catch(Exception e){
	e.printStackTrace();
}
response.sendRedirect(category+".jsp");
%>