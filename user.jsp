<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        html,body{
            height: 100%;
            color: white;
            margin: 0px;
            background: url("https://images.unsplash.com/photo-1447078806655-40579c2520d6?q=80&w=1770&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D") no-repeat center center/cover;
            opacity: 0.7;
        }
        
        
    </style>
</head>
<body>
    <h1 style="text-align: center; margin: 3vw;">User Details</h1>
    <div class="container">
        <table class="table table-striped">
            <tr>
                <th>Userid</th>
                <th>Username</th>
                <th>Lastlogin</th>
            </tr>
            <%
            
            try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/projectfull2","root","54112");
			PreparedStatement ps=con.prepareStatement("select * from loginrecord where role=?");
			ps.setString(1, "User");
			ResultSet rs=ps.executeQuery();
			while(rs.next()){%>
			<tr>
			<td><%=rs.getInt(1)%></td>
			<td><%=rs.getString(2) %></td>
			<td><%=rs.getString(5) %></td>
			</tr>
			<%}
			con.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}%>
        </table>
        
    </div>
    <div style="display:flex; justify-content:center;">
        <h6 style="position:absolute; bottom:-3vw;"><a href="admin.jsp" style="color:rgb(235, 196, 124); text-decoration:none;">back to admin</a></h6>
    	</div>
    
</body>
</html>