<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Connection.Dbconnect" %>
<%
String username=request.getParameter("name");
String password=request.getParameter("password");
String role=request.getParameter("role");
try{
	Dbconnect.registerrecord(username, password, role);
}
catch(Exception e){
	e.printStackTrace();
}
response.sendRedirect("login.jsp");
%>