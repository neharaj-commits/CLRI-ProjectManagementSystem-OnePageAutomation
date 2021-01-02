<%-- 
    Document   : projtype
    Created on : 18 Jun, 2018, 1:44:38 AM
    Author     : prabhakarthangappan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try{
                String type = request.getParameter("radio");
                
                session.setAttribute("age", type);
                
                if(type.equals("New")){
                response.sendRedirect("newprojcategory.html");
                }
                
                if(type.equals("Ongoing")){
                response.sendRedirect("onprojselect.html");
                }
                
                if(type.equals("Summary")){
                response.sendRedirect("searchparameters.jsp");
                }
                
                else{out.println("error"); }
                
                
            } catch(Exception e){
                out.println(e);
            }   
        %>
    </body>
</html>
