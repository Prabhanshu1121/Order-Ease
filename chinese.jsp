<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    <%
    String username=(String)session.getAttribute("username");
    String userid=(String)session.getAttribute("userid");
    if(username==null){
        response.sendRedirect("login.jsp");}
    session.setAttribute("username",username);
    session.setAttribute("userid",userid);%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
    .btnd {
        background-color: white; /* Green */
        border: none;
        color: black;
        padding: 5px 10px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        margin: 4px 2px;
        cursor: pointer;
        border-radius: 5px;
    	}
        body{
        	margin:0px;
        	padding:0px;
            color: white;
            height:100%;
        }
        .main{
        	min-height:100vh;
        }
        .main::before{
            left: 0;
            top: 0;
            content:"";
            height: 100%;
            width: 100%;
            position: absolute;
            background: url("https://images.unsplash.com/photo-1447078806655-40579c2520d6?q=80&w=1770&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D") no-repeat center center/cover;
            /* object-fit: cover; */
            z-index: -1;
            opacity: 0.9;
            
        }
        .elem{
            height: 28vw;
            width: 20vw;
            /* background-color: red; */
            border: 1px solid white;
            padding: 1vw;
            border-radius: 10px;
            margin: 2vw;
        }
        .second{
            height: 70vh;
            display: flex;
            justify-content: flex-start;
            align-items: center;
            flex-wrap: wrap;
        }
        .elem a{
            text-decoration: none;
            color: white;
        }
        
    </style>
</head>
<body>
    <div class="main">
        <h1 style="text-align: center; font-size: 4vw;">Chinese</h1>
        <hr >
        <div class="second">
        <% 
        try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/projectfull2","root","54112");
			String q="select * from menu where category=?";
			PreparedStatement ps=con.prepareStatement(q);
			ps.setString(1, "chinese");
			ResultSet rs=ps.executeQuery();
			while(rs.next()){%>
				<div class="elem">
                <img src=<%= rs.getString(4) %> alt="" style="height: 150px; width: 150px; border-radius: 50%; margin-left: 3vw;">
                <h3 style="text-align: center; font-size: 2vw; margin-top: 0vw;"><%=rs.getString(2) %></h3>
                <h3 style="text-align: center;">Rs <%=rs.getString(5) %></h3>
                <div style="position:relative; left:5.3vw; margin-bottom:1vw;">
                <button onclick="decreaseValue(this)" class="btnd">-</button>
				<span class="value" style="padding:0px 5px;">0</span>
				<button onclick="increaseValue(this)" class="btnd">+</button>
                </div>
                <button class="btn btn-dark" onclick="passValue(this,'<%=rs.getString(2)%>','<%=rs.getString(5)%>','<%=rs.getString(4)%>','<%=userid %>')" style="position:relative; left: 4.8vw;">Add to Cart</button>
            </div>
			<%	
			}
			con.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
        %>              
        </div>
        <div style="display:flex; justify-content:center;">
        <h6 style="position:relative; bottom:-5vw;"><a href="menu.jsp" style="color:rgb(235, 196, 124); text-decoration:none;">back to menu</a></h6>
    	</div>
    </div>
<script>
//JavaScript functions to handle the plus and minus button clicks for each item
function increaseValue(button) {
    var valueElement = button.parentElement.querySelector('.value');
    var value = parseInt(valueElement.innerHTML);
    valueElement.innerHTML = value + 1;
}

function decreaseValue(button) {
    var valueElement = button.parentElement.querySelector('.value');
    var value = parseInt(valueElement.innerHTML);
    if (value > 0) {
        valueElement.innerHTML = value - 1;
    }
}

function passValue(button,productname, price,filename,userid) {
    var quantity = button.parentElement.querySelector('.value').innerHTML;
    window.location.href = "cart.jsp?quantity=" + quantity + "&productname=" + productname + "&price=" + price + "&filename=" + filename+"&category="+"chinese"+"&userid="+userid;
}

</script>


</body>
</html>