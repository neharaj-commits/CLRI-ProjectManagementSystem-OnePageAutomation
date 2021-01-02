<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<html>
    <head>
        <title>CLRI login page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            body {

                background-image: url('./leather.jpg');
                
                background-position: top center ;

            }
           
/*            #Button1 {

                height: 30px;
                width: 180px;
                background-color: #000000;
                font-family: Arial, Helvetica, sans-serif;
                font-size: 18px;
                color: #FFFFFF;

            }

            #Button1:hover {

                background-color: #CCCCCC;

            }*/
             label{
                font-family: serif, Helvetica, sans-serif;
                
                
            }
            .border{
                border-radius: 25px;
                background: #ffffff;/*linear-gradient(#661a00, #FFFFFF );*/
                width:350px;
                height:550px;
                margin-top:30px;
                margin-left: 200px;
                border: 5px groove #000000;
/*                background-color: #000000;*/
                padding: 50px;
            }
            
            * {
    box-sizing: border-box;
}

input[type=text], select, textarea {
    width: 100%;
    padding: 12px;
    border: 2px groove #ccc;
    border-radius: 4px;
    resize: vertical;
}

input[type=password] {
    width: 100%;
    padding: 12px;
    border: 2px groove #ccc;
    border-radius: 4px;
    resize: vertical;
}

label {
    padding: 8px 12px 8px 0;
    display: inline-block;
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

.container {
    border-radius: 5px;
    background-color: #f2f2f2;
    padding: 20px;
}

.col-25 {
    float: left;
    width: 25%;
    margin-top: 6px;
}

.col-75 {
    float: left;
    width: 75%;
    margin-top: 6px;
}

/* Clear floats after the columns */
.row:after {
    content: "";
    display: table;
    clear: both;
}

/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
    .col-25, .col-75, input[type=submit] {
        width: 100%;
        margin-top: 0;
    }
}
    </style>
    </head>
    <body style="margin-left: 300px;">
        

         <div>
        <!--<img src="CSIR-CLRI.png" alt="clri logo" align="center" >-->
        <font face="Serif" size="40" color="white" style="text-align: center; float: none">  CSIR-Central Leather Research Institute  </font><br>
        <br><font face="Serif"  style="text-align:center; color: white; font-size: 30px; float: none; margin-left: 50px;">  Project Planning and Business Development Department </font>
        </div>
        
        <form action="Login.jsp" style="text-align:center" class="border" method="post">
                <div>
                    <img src="CSIR-CLRI.png" alt="clri logo" align="center" >
                <p><strong><LABEL FOR="tb1" class="label">USERNAME:</LABEL></strong></p>
              <input id= "tb1" type="text" name="username" placeholder="Enter username" size="20" >
               
                
               <p> <strong><LABEL FOR="tb2" class="label">PASSWORD: </LABEL></strong></p>
                <p><input id="tb2" type="password" name="password" placeholder="Enter password" size="20"></p>
                 
                 
                <p><input type="submit" value="Login" id="Button1"></p> 
                </div>
            
            <%
            try{
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                boolean Userfound = false ;
//                boolean UN = false;
//                boolean PW = false;        
                Class.forName( "com.mysql.jdbc.Driver" );
                Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/onepage", "root", "admin");
                Statement st = con.createStatement();
                String query = "select * from username_and_password_validation where username='"+username+"' and password='"+password+"';";
                ResultSet rs= st.executeQuery(query);
                
                while(rs.next()){
                    
                    Userfound = true;
                    break;
                }
               
//                while(rs.next()){
//                    String sql_username = rs.getString("username");
//                    if(username.equals(sql_username)){
//                        UN = true;
//                        break;
//                        }
//                    }
//
//                rs.first();
//                
//                while(rs.next()){
//                    String sql_password = rs.getString("password");
//                    if(password.equals(sql_password)){
//                        PW = true;
//                        break;
//                        }
//                    }

                

                if( !Userfound){%>
               <font color="red" >INVALID USERNAME OR PASSWORD</font>
               </form>
                 
                   <% }else{
                    response.sendRedirect("projtype.html");
                    System.out.println("Login Successful");
                    }
                rs.close();
                con.close();
            } catch(Exception e){
                out.println(e);
            }   
        %>
            
               

            
        
    </body>
</html>
