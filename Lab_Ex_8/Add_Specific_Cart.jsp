<%-- 
    Document   : Add_Specific_Cart
    Created on : 29 May, 2022, 8:12:19 PM
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
        <div id="rigthbox">
        <%
            Connection c;
            Statement st;
            c=DriverManager.getConnection("jdbc:derby://localhost:1527/User_Table","root","123");
            st=c.createStatement();
            ResultSet rs=null;
         
            String genre=(String)session.getAttribute("genre");
            if(genre.equals("CSE"))
            {
                if(request.getParameter("1")!=null)
                {
                    rs=st.executeQuery("select * from Book where id=1");
                    session.setAttribute("id","1");
                }
               
            }
            else if(genre.equals("ECE"))
            {
                if(request.getParameter("2")!=null)
                {
                    rs=st.executeQuery("select * from Book where id=2");
                    session.setAttribute("id","2");
                }
               
            }
            else
            {
                if(request.getParameter("3")!=null)
                {
                    rs=st.executeQuery("select * from Book where id=3");
                    session.setAttribute("id","3");
                }
               
            }
            out.println("<center>");
            out.println("<form action='http://localhost:8080/WebApplication2/LAB_8_HTML/Add_Cart.jsp'>");
            while(rs.next())
            {
                out.println("<h2>"+rs.getString(2).toUpperCase()+" by "+rs.getString(3)+"</h2>");
                out.println("<h3>Rs."+rs.getInt(4)+"/-</h3>");
       
                out.println("<h3>Enter quantity</h3><input type=number max="+rs.getInt(5)+" min=1 name='qty'><br><br>");
            }
            out.println("<input type='submit' name='cart' value='Add to Cart'>");
            out.println("</form>");
            out.println("</center>");
        %>
        </div>
    </body>
</html>
