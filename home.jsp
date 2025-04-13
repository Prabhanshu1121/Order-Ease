<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String userid=(String)session.getAttribute("userid");
    String username=(String)session.getAttribute("username");
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
    <style>
        body{
            color: white;
        }
        .main::before{
            left: 0;
            top: 0;
            content:"";
            height: 100vh;
            width: 100%;
            position: absolute;
            background: url("https://images.unsplash.com/photo-1447078806655-40579c2520d6?q=80&w=1770&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D") no-repeat center center/cover;
            /* object-fit: cover; */
            z-index: -1;
            opacity: 0.8;
            
        }
        .navbar{
            height: 3vw;
            display: flex;
            padding: 1vw;
            justify-content: space-between;
            align-items: center;
        }
        a{
            margin-right: 5vw;
            font-size: 1.3vw;
            text-decoration: none;
            color: white;
        }
    </style>
</head>
<body>
    <div class="main">
    <div class="navbar">
        <h1 style="font-family: Georgia, 'Times New Roman', Times, serif; margin-left: 10vw;">Foodies</h1>
        <div class="an">
        <a href="home.jsp">Home</a>
        <a href="menu.jsp">Menu</a>
        <a href="about.jsp">About Us</a>
        <a href="cartpage.jsp">Cart</a>
        <a href="login.jsp">Logout</a>
        </div>
    </div>
    <div class="second">
        <h1 style="font-size: 4vw; text-align: center; margin-top: 6vw;">CHOOSE BEST FOOD </h1>
        <h2 style="font-size: 2vw; text-align: center; padding: 2vw 6vw;">Welcome to Flavorful Delights, your ultimate destination for all things food-related! Whether you're a passionate home cook, a culinary adventurer, or simply someone who loves to eat, you'll find plenty to satisfy your cravings here.</h2>
    </div>
    </div>

</body>
</html>