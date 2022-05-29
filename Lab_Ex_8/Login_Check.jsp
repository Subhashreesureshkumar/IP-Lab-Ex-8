<%-- 
    Document   : Login_Check
    Created on : 29 May, 2022, 7:19:13 PM
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
        <title>Login Check</title>
    </head>
    <body>
        <%
            Connection c;
            Statement st;
            c=DriverManager.getConnection("jdbc:derby://localhost:1527/User_Table","root","123");
            st=c.createStatement();
            if(request.getParameter("loginSubmit")!=null)
            {
                String name=request.getParameter("uname");
                String pwd=request.getParameter("password");
                session.setAttribute("name",name);
                session.setAttribute("pwd",pwd);
                boolean flag=true;
                ResultSet rs=st.executeQuery("select * from User_Details");
                while(rs.next())
                {
                    if(name.equals(rs.getString(1)) && pwd.equals(rs.getString(2)))
                    {
                        flag=false;
                        response.sendRedirect("http://localhost:8080/WebApplication2/LAB_8_HTML/Catelogue.jsp");
                    }
                }
                if(flag)
                {
                    response.sendRedirect("Registration_Page.html");
                }
            }
            else if(request.getParameter("registerSubmit")!=null)
            {
                String name=request.getParameter("name");
                String pwd=request.getParameter("password");
                st.executeUpdate("insert into User_Details(Name,Password) values('"+name+"','"+pwd+"')");
                response.sendRedirect("Login_Page.html");
            }
            else
            {
                out.println("Wrong");
            }
        %>
    </body>
</html>
