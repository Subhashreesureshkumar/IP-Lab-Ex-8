<%-- 
    Document   : Add_Cart
    Created on : 29 May, 2022, 8:06:54 PM
    Author     : SUBHAHARINI
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Welcome to our website!!</h1>
        <nav>
              <a href="Home_Page.html">HOME</a>
            <a href="Login_Page.html" >LOGIN</a>
            <a href="Registration_Page.html">REGISTRATION</a>
            <a href="Catelogue.jsp" id="currentPage">CATALOGUE</a>
            <a href="Cart.jsp">CART</a>
        </nav>
        <div id="leftbox">
            <ul>
                <form action="http://localhost:8080/WebApplication2/LAB_8_HTML/Catelogue.jsp">
                     <li><input type="submit" name="CSE" value="CSE"></li>
                    <li><input type="submit" name="ECE" value="ECE"></li>
                    <li><input type="submit" name="EEE" value="EEE"></li>
                  
                </form>
            </ul>
        </div>
        <div id="rightbox">
        <%
            
            Connection c;
            Statement st;
            c=DriverManager.getConnection("jdbc:derby://localhost:1527/User_Table","root","123");
            st=c.createStatement();
            ResultSet rs;
            String name=(String)session.getAttribute("name");
            String pwd=(String)session.getAttribute("pwd");
            String id=(String)session.getAttribute("id");
            
            String qty=request.getParameter("qty");
            String cartItems="";
            
            rs=st.executeQuery("select Cartitems from User_Details where name='"+name+"' and password='"+pwd+"'");
            while(rs.next())
            {
                cartItems=rs.getString(1);
            }
            cartItems+=id+":"+qty+",";
            st.executeUpdate("update User_Details set Cartitems='"+cartItems+"' where name='"+name+"' and password='"+pwd+"'");
            out.println("<center><h1>Added to Cart Successfully..!!</h1></center>");
        
        %>
        </div>
    </body>
</html>
