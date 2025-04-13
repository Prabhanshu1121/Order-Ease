<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
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
        body{
            height: 100%;
            margin: 0;
            padding: 0;
            background:url("https://images.unsplash.com/photo-1515003197210-e0cd71810b5f?q=80&w=1770&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D") no-repeat center center/cover;
        }
        .container{
            background-color: white;
            height: 50%;
            width: 60vw;
            padding: 2vw;
            /* box-sizing: border-box; */
        }
        th,td,tr{
            border: 1px solid black;
        }
        
    </style>
</head>
<body>
    <h1 style="text-align: center; margin-top: 4vw; padding:2vw; ">Bill Section</h1>
    <div class="container">
        <table class="table" style="border: 1px solid black;">
            <tr>
                <th>S.no</th>
                <th>ProductName</th>
                <th>Quantity</th>
                <th>Price Per Unit</th>
                <th>Total</th>
            </tr>
            <%int c=1;
            int sum=0;%>
            <%try{
                Class.forName("com.mysql.cj.jdbc.Driver");
    			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/projectfull2","root","54112");
    			String q="select * from cart where userid=?";
    			PreparedStatement ps=con.prepareStatement(q);
    			ps.setString(1,userid);
    			ResultSet rs=ps.executeQuery();
				while(rs.next()){%>
				<tr>
                    <td><%=c++%></td>
                        <td><h6><%=rs.getString(5) %></h6></td>
                        <td><h6><%=rs.getString(2) %></h6></td>
                        <td><h6><%=rs.getString(4) %></h6></td>
                        <td><h6><%=Integer.parseInt(rs.getString(4))*Integer.parseInt(rs.getString(2)) %></h6></td>
                       <% sum+=Integer.parseInt(rs.getString(4))*Integer.parseInt(rs.getString(2));%>
                </tr>
                <%
                	}
					con.close();
					}
					catch(Exception e) {
					e.printStackTrace();
					}
        			%>
        			<tr>
        			<td></td>
        			<td></td>
        			<td></td>
        			<td></td>
        			<td>Total=<%=sum %></td>
        			<%session.setAttribute("tota", String.valueOf(sum)); %>
        			
        </table>
        
        <div class="second" style="display: flex; justify-content: space-between; align-items: center;">
            <div>
                <button  class="btn btn-info"><a href="cartpage.jsp" style="text-decoration: none; color: black;">Back to cart</a></button>
            </div>
            <div>
                <button onclick="printPage()" class="btn btn-secondary">Print</button>
                <button class="btn btn-primary" onclick="passValue(this,'<%=String.valueOf(sum)%>')">Proceed to payment</button>
            </div>
        </div>
    </div>
    <script>
        function printPage() {
            window.print();
        }
        function passValue(button,sum) {
            window.location.href = "payment.jsp?total" + sum;
        }
    </script>
        

</body>
</html>