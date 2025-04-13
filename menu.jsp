<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <style>
        html,body{
            color: white;
            height:100%;
            padding:0px;
            margin:0px;
            
        }
        .main{
        	min-height:100vh;
        }
        .main::before{
            left: 0;
            top: 0;
            bottom:0;
            content:"";
            height: 100%;
            width: 100%;
            position: absolute;
            background: url("https://images.unsplash.com/photo-1447078806655-40579c2520d6?q=80&w=1770&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D") no-repeat center center/cover;
        	opacity: 0.7;
            /* object-fit: cover; */
            z-index: -1;
            
            
        }
        .elem{
            height: 20vw;
            width: 20vw;
            /* background-color: red; */
            border: 1px solid white;
            padding: 1vw;
            border-radius: 10px;
        }
        .second{
            height: 70vh;
            display: flex;
            justify-content: space-around;
            align-items: center;
        }
        .elem a{
            text-decoration: none;
            color: white;
        }
        
    </style>
</head>
<body>
    <div class="main">
        <h1 style="text-align: center; padding-bottom:0vw; font-size: 4vw;">Menu Section</h1>
        <hr>
        <div class="second">
            <div class="elem">
                <img src="https://static1.s123-cdn-static-a.com/uploads/7084115/800_63f6ffa24cfc6.jpg" alt="" style="height: 200px; width: 200px; border-radius: 50%; margin-left: 2vw;">
                <h3 style="text-align: center; font-size: 2vw; margin-top: 0.8vw;"><a href="maincourse.jsp">Main course</a></h3>
            </div>
            <div class="elem">
                <img src="https://images.unsplash.com/photo-1585032226651-759b368d7246?q=80&w=1892&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" alt="" style="height: 200px; width: 200px; border-radius: 50%; margin-left: 2vw;">
                <h3 style="text-align: center; font-size: 2vw; margin-top: 0.8vw;"><a href="chinese.jsp">Chinese</a></h3>
            </div>
            <div class="elem">
                <img src="https://images.unsplash.com/photo-1556679343-c7306c1976bc?q=80&w=1964&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" alt="" style="height: 200px; width: 200px; border-radius: 50%; margin-left: 2vw;">
                <h3 style="text-align: center; font-size: 2vw; margin-top: 0.8vw;"><a href="beverage.jsp">Beverages</a></h3>
            </div>
        </div>
        <div style="display:flex; justify-content:center;">
        <h6 style="position:relative; bottom:1vw;"><a href="home.jsp" style="color:rgb(235, 196, 124); text-decoration:none;">back to home</a></h6>
    	</div>
    </div>
    

</body>
</html>