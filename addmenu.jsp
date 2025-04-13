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
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .container{
            height: 38vw;
            width: 35vw;
            /* border: 1px solid black; */
            box-shadow: rgb(38, 57, 77) 0px 20px 30px -10px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content:center;
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
        p{
            animation: change 1s ease-in-out 3s infinite;
        }
        @keyframes change {
            from{
                transform: scale(0.8);
            }
            to{
                transform: scale(1);
            }
            
        }
    </style>
</head>
<body>
    <div class="main">
        <div class="container">
        <h1 style="margin: 2vw 0vw; text-align: center; color: rgb(235, 196, 124);">Add Menu</h1>
        <form action="SerConnect" method="post" enctype="multipart/form-data">
            <input type="text" placeholder="Enter Product" name="product" class="form-control">
            <select name="dish" class="form-control">
                <option value="select ">Select Category</option>
                <option value="maincourse">Main Course</option>
                <option value="chinese">Chinese</option>
                <option value="beverage">Beverage</option>
            </select>
            <input type="url" placeholder="Url of the image" name="file" class="form-control" style="margin-bottom: 0.5vw;">
            <input type="text" placeholder="Price" name="price" class="form-control" style="margin-bottom: 0.5vw;">
            <input type="submit" value="Add" class="btn btn-primary" style="margin-bottom: 0.5vw; width:27vw;background-color: rgb(235, 196, 124); border: 1px solid  rgb(235, 196, 124);">
        </form>

        <p style="color: rgb(221, 70, 70);">Note: Please mention the product name in title case</p>
        <a href="admin.jsp" style="text-decoration: none; color:rgb(235, 196, 124) ; position:relative; top:-1vw;">Back to home</a>
    </div>
</div>
</body>
</html>