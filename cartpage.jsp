<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        html,body{
            height: 100%;
            color: white;
            margin: 0px;

        }
        .main{
            min-height: 100vh;
            position: relative;
        }
        .main::before{
            left: 0;
            top: 0;
            content:"";
            height: 100%;
            width: 100%;
            position: absolute;
            background: url("https://images.unsplash.com/photo-1447078806655-40579c2520d6?q=80&w=1770&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D") no-repeat center center/cover;
            background-size: cover;
            /* object-fit: cover; */
            z-index: -1;
            opacity: 0.7;
            
        }
        .second{
            display: flex;
            flex-direction: column;
        }

        .elem{
            /* display: flex; */
            /* justify-content: space-evenly; */
            /* align-items: center; */
            /* margin: 2vw; */
            /* border: 1px solid white; */
        }
        td,th{
            padding: 1vw;
        }
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
        
    </style>
</head>
<body>
    <div class="main">
        <div class="content">
            <h1 style="text-align: center; font-size: 4vw;">Cart</h1>
        <hr>
        <div class="second" style="margin: 3vw; margin-left: 6vw;">
            <table class="table-hover">
                <tr>
                    <th>sno</th>
                    <th>Product Image</th>
                    <th>product name</th>
                    <th>Quantity</th>
                    <th>price</th>
                    <th>Total</th>
                </tr>
                <%
                try{
                Class.forName("com.mysql.cj.jdbc.Driver");
    			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/projectfull2","root","54112");
    			String q="select * from cart where userid=?";
    			PreparedStatement ps=con.prepareStatement(q);
    			ps.setString(1,userid);
    			ResultSet rs=ps.executeQuery();
				while(rs.next()){%>
                <tr>
                    <td><%=rs.getString(1)%></td>
                    <td>
                        <img src=<%=rs.getString(3) %> alt="" style="height: 100px; width: 125px; border-radius: 50%; margin-top: 0.5vw;"></td>
                        <td><h2><%=rs.getString(5) %></h2></td>
                        <td><div style="display: flex; flex-direction: column; align-items: center; justify-content: center; position: relative; left: -5vw;">
                            <div><h4><button onclick="decreaseValue(this)" class="btnd">-</button>
                            <span class="value" style="padding:0px 5px;"><%=rs.getString(2) %></span>
                            <button onclick="increaseValue(this)" class="btnd">+</button></h4></div>
                            <div><button class="btn btn-dark" onclick="passValue(this,'<%=rs.getString(5)%>','<%=rs.getString(5)%>','<%=rs.getString(4)%>','<%=userid %>')" style="">Update</button></div></td>
                        </div>
                        <td><h4><%=rs.getString(4) %></h4></td>
                        <td><h4><%=Integer.parseInt(rs.getString(4))*Integer.parseInt(rs.getString(2)) %></h4></td>
                </tr>
                <%
                	}
					con.close();
					}
					catch(Exception e) {
					e.printStackTrace();
					}
        			%>
            </table>
        </div>
        <div style="display:flex; justify-content:center;">
        <h6 style="position:absolute; bottom:1vw;"><a href="menu.jsp" style="color:rgb(235, 196, 124); text-decoration:none;">back to menu</a></h6>
        </div>
        
    </div>
    <div style="position:relative; left:80vw;top:-1vw">
    <button class="btn btn-info"><a href="bill.jsp" style="text-decoration:none; color:white;">Proceed to bill</a></button>
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
        	var row = button.closest('tr'); // Find the closest <tr> ancestor
            var quantity = row.querySelector('.value').innerHTML;
            window.location.href = "update.jsp?quantity=" + quantity + "&productname=" + productname + "&price=" + price + "&filename=" + filename+"&category="+"cartpage"+"&userid=" +userid;
        }
</script>
        

</body>
</html>