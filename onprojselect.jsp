<%-- 
    Document   : onprojselect
    Created on : 19 Jun, 2018, 11:53:22 AM
    Author     : prabhakarthangappan
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
         body {

                background-image: url('./leather.jpg');
                
                background-position: center center;

            }
            .border{
                border-radius: 25px;
                background: #ffffff;/*linear-gradient(#ff8c66, #FFFFFF);*/
                width:350px;
                height:300px;
                margin-top:100px;
                margin-left: 470px;
                border: 5px groove #000000;
                /*background-color: #000000;*/
                padding: 30px;
            }
            
/*            #Button1 {

                height: 30px;
                width: 180px;
                background-color: #339933;
                font-family: Arial, Helvetica, sans-serif;
                font-size: 18px;
                color: #ffffff;

            }*/
input[type=text], select, textarea {
    width: 75%;
    align-content: center;
    padding: 12px;
    border: 2px groove #ccc;
    border-radius: 4px;
    resize: vertical;
}
input[type=submit] {
    background-color: #992600;
    color: white;
    padding: 12px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    float: none;
}

input[type=submit]:hover {
    background-color: #cc3300;
}
label{
                font-family: serif, Helvetica, sans-serif;
                
                
            }
        </style>    
    </head>
    <body>
        <div style="margin-left: 300px;">
        <!--<img src="CSIR-CLRI.png" alt="clri logo" align="center" >-->
        <font face="Serif" size="40" color="white" style="text-align: center; float: none">  CSIR-Central Leather Research Institute  </font><br>
        <br><font face="Serif"  style="text-align:center; color: white; font-size: 30px; float: none; margin-left: 50px;">  Project Planning and Business Development Department </font>
        </div>
            
        <form action="onprojselect.jsp" style=text-align:center method="post" class="border">
            <font   face="serif" size="40" color="black" >Ongoing Projects</font>
            <br><br> <br><br>
            
            <label for="projnum" style="font-size:30px;">  Please enter project number:</label><br><br>
            <div style="margin-left:5px;">  <input type="text" id="projnum" name="pnum" placeholder="Enter project number"></div>
            
            <br><br>
            
            <input align="center" type="submit" value="Next" id="Button1"><br><br>

<%
        String projnum = request.getParameter("pnum");
        Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/onepage", "root", "admin");
        Statement state = con.createStatement();
        String query = "select * from projdetails where project_number = '"+ projnum +"';";
        ResultSet rs = state.executeQuery(query);
        if(query == null || rs.next()== false){
           %>
		<font color="red" >Invalid Project number. Please try again.</font>
            <%}
        else{
        session.setAttribute("projnumber",projnum);
        response.sendRedirect("ongoingdisplayformjsp.jsp");
        }
        %>
            
        </form>
    </body>
</html>
