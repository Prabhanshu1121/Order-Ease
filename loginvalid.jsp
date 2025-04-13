<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Connection.Dbconnect"%>
<%@ page import="java.util.HashMap"
	import="java.util.Date" 
	import="java.sql.*"%>
<%

String username=request.getParameter("name");
String password=request.getParameter("password");
String role=request.getParameter("role");
try{
	boolean status=Dbconnect.checklogin(username, password, role);
	
	if(status){
		int userid=Dbconnect.userid(username, password, role);
		Date d=new Date();
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/projectfull2","root","54112");
			PreparedStatement ps=con.prepareStatement("update loginrecord set lastlogin=? where sno=?");
			ps.setString(1, d.toString());
			ps.setInt(2,userid);
			ps.executeUpdate();
			con.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		session.setAttribute("userid",String.valueOf(userid));
		session.setAttribute("role",role);
		if(role.equals("User")){
			session.setAttribute("username",username);
			response.sendRedirect("home.jsp");
		}
		else if(role.equals("Admin")){
			session.setAttribute("username", username);
			response.sendRedirect("admin.jsp");
		}
		else{
			response.sendRedirect("login.jsp");
		}
	}
	else{
		response.sendRedirect("login.jsp");
	}
}
catch(Exception e){
	e.printStackTrace();
}
%>