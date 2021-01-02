<%-- 
    Document   : finish
    Created on : 4 Jul, 2018, 3:31:17 PM
    Author     : prabhakarthangappan
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Class.forName( "com.mysql.jdbc.Driver" );
            String projnum = session.getAttribute("projnumber").toString();
            Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/onepage", "root", "admin");
            
            int i = 0;
            
            Statement state = con.createStatement();
            String qry = "select * from paymentdetails where project_number='"+projnum+"';";
            ResultSet r = state.executeQuery(qry);
            
            while(r.next()){i++;}
          
            String finish = "finish";
            
            Statement st = con.createStatement();
            
            st.executeUpdate("insert into paymentdetails (project_number,ref_no)values('"+projnum+"','"+finish+"');");
            
//            if(i==1){response.sendRedirect("generationpg.jsp");}
            
//            else{response.sendRedirect("ongoingdisplayformjsp.jsp");}

            response.sendRedirect("ongoingdisplayformjsp.jsp");
            
        %>
    </body>
</html>
