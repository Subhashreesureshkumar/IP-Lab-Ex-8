<%-- 
    Document   : Catelogue
    Created on : 29 May, 2022, 7:38:49 PM
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
       <h1>Get your favourite books here..!!</h1>
        <nav>
            <a href="Home_Page.html">HOME</a>
            <a href="Login_Page.html" >LOGIN</a>
            <a href="Registration_Page.html">REGISTRATION</a>
            <a href="#" id="currentPage">CATALOGUE</a>
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
            ResultSet rs;
            session.setAttribute("genre", "General");
            if(request.getParameter("CSE")!=null)
            {
                rs=st.executeQuery("select * from Book where genre='CSE'");  
                session.setAttribute("genre","CSE");
            }
            else if(request.getParameter("ECE")!=null)
            {
                rs=st.executeQuery("select * from Book where genre='ECE'");
                session.setAttribute("genre","ECE");
            }
            else if(request.getParameter("EEE")!=null)
            {
                rs=st.executeQuery("select * from Book where genre='EEE'");
                session.setAttribute("genre","EEE");
            }
            else{
                rs=st.executeQuery("select * from Book");
                
            }
            out.println("<center><table border=1 style='text-align:center'><tr><th>ID</th><th>DETAILS</th><th>PRICE</th><th>OPTION</th></tr>");
            out.println("<form action='http://localhost:8080/WebApplication2/LAB_8_HTML/Add_Specific_Cart.jsp'>");
            while(rs.next())
            {
                out.println("<tr ><td>"+rs.getInt(1)+"'/></td><td><p>Title:"+rs.getString(2)+"</p><p>Author:"+rs.getString(3)+"</p></td><td>Rs."+rs.getInt(4)+"/-</td><td><input type='submit' name='"+rs.getInt(1)+"' value='Add to Cart'></td></tr>");
            }
            out.println("</form>");
            out.println("</table>\n</center>");
            
        %>
        </div>
    </body>
</html>
