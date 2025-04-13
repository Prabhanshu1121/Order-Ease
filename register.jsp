<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        body{
            height: 100vh;
            background:url("https://images.unsplash.com/photo-1515003197210-e0cd71810b5f?q=80&w=1770&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D") no-repeat center center/cover;
        }
        .container{
            height: 32vw;
            width: 35vw;
            /* border: 1px solid black; */
            box-shadow: rgb(38, 57, 77) 0px 20px 30px -10px;
            position: relative;
            margin-left: 5vw;
            top: 5vw;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        
        input{
            height: 3vw;
            width: 20vw;
            margin: 2vw 0vw;
        }
        select{
            height: 3vw;
            margin-top: 2vw;
            width: 20vw;
        }
    </style>
</head>
<body>
 <h1 style="text-align: center; padding: 2vw;">Foodies</h1>
    <div class="container">
        <h1 style="margin: 2vw 0vw; text-align: center; color: rgb(235, 196, 124);">Sign Up</h1>
        <form action="registerrecord.jsp" method="post">
            <input type="text" placeholder="Enter username" name="name" class="form-control">
            <input type="password" placeholder="password" name="password" class="form-control">
            <select name="role" class="form-control">
                <option value="select role">Select Role</option>
                <option value="User">User</option>
                <option value="Admin">Admin</option>
            </select>
            <input type="submit" value="Sign Up" class="btn btn-primary" style="margin-bottom: 0.5vw; background-color: rgb(235, 196, 124); border: 1px solid  rgb(235, 196, 124);">
        </form>
        <a href="register.jsp" style="text-decoration: none; color:rgb(235, 196, 124) ;">Log in</a>
    </div>
</body>
</html>