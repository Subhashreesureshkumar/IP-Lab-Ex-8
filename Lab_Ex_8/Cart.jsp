<%-- 
    Document   : Cart
    Created on : 29 May, 2022, 7:46:21 PM
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
      
        <title>Cart Page</title>
    </head>
    <body>
        <h1>Welcome to our website!!</h1>
        <nav>
            <a href="Home_Page.html">HOME</a>
            <a href="Login_Page.html" >LOGIN</a>
            <a href="Registration_Page.html">REGISTRATION</a>
            <a href="Catalogue.jsp">CATALOGUE</a>
            <a href="#" id="currentPage">CART</a>
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
        <div id="rigthbox">
            <%
                Connection c;
                Statement st;
                c=DriverManager.getConnection("jdbc:derby://localhost:1527/User_Table","root","123");
                st=c.createStatement();
                ResultSet rs;
                String name=(String)session.getAttribute("name");
                String pwd=(String)session.getAttribute("pwd");
                String Cartitems[]=null,Ibook[];
                int id,qty,price,tqty=0,tprice=0;
                rs=st.executeQuery("select Cartitems from User_Details where name='"+name+"' and password='"+pwd+"'");
                while(rs.next())
                {
                     Cartitems=rs.getString(1).split(",");
                }
                out.println("<center>");
                out.println("<table border=1 style='text-align:center'><tr><th>Book Name</th><th>Price</th><th>Quantity</th><th>Amount</th></tr>");
                out.println("<form action='http://localhost:8080/WebApplication2/LAB_8_HTML/Book_Check.jsp'>");
                for(int items=0; items<Cartitems.length-1;items++)
                {
                    Ibook=Cartitems[items].split(":");
                    id=Integer.parseInt(Ibook[0]);
                    qty=Integer.parseInt(Ibook[1]);
                    tqty+=qty;
                    
                    rs=st.executeQuery("select title,price from Book where id="+id);
                    
                    while(rs.next())
                    {
                        price=qty*rs.getInt(2);
                        tprice+=price;
                        out.println("<tr><td>"+rs.getString(1)+"</td><td>Rs."+rs.getInt(2)+"/-</td><td>"+qty+"</td><td>Rs."+price+"/-</td></tr>");
                    }
                    
                }
                out.println("<tr style='font-size:larger;font-weight:bolder;'><td></td><td>Total</td><td>"+tqty+"</td><td>"+tprice+"/-</td></tr>");
                out.println("</table>");
                out.println("<br><br><input type='submit' value='Checkout'>");
                out.println("</form>");
                
                
                out.println("</center>");
            %>
        </div>
    </body>
</html>
