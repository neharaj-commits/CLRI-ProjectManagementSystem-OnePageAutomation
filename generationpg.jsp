<%-- 
    Document   : generationpg
    Created on : 21 Jun, 2018, 2:22:27 PM
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Generation format</title>
        <style>
            body {

                background-image: url('./leather.jpg');
                
                background-position: center center;

            }
            label{
                font-family: serif, Helvetica, sans-serif;
            }
            .border{
                border-radius: 25px;
                background: #ffffff;/*linear-gradient(#ff8c66, #FFFFFF, #ff8c66);*/
                width:600px;
                height:550px;
                margin-top:10px;
                margin-left: 400px;
                border: 5px groove #000000;
                background-color: #000000;
                padding: 30px;
            }
            
            * {
    box-sizing: border-box;
}

input[type=text], select, textarea {
    width: 100%;
    padding: 12px;
    border: 1px solid #ccc;
    border-radius: 4px;
    resize: vertical;
}

label {
    padding: 12px 12px 12px 0;
    display: inline-block;
}

input[type=submit] {
    background-color: #339933;
    color: white;
    padding: 12px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    /*float: right;*/
}

input[type=submit]:hover {
    background-color: #45a049;
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

 Clear floats after the columns 
.row:after {
    content: "";
    display: table;
    clear: both;
}

 /*Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other*/ 
@media screen and (max-width: 600px) {
    .col-25, .col-75, input[type=submit] {
        width: 100%;
        margin-top: 0;
    }
}
.container {
    display: block;
    position: relative;
    padding-left: 35px;
    margin-bottom: 12px;
    cursor: pointer;
    font-size: 22px;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    font-family: serif, Helvetica, sans-serif;
    font-size: 30px;
}

/* Hide the browser's default radio button */
.container input {
    position: absolute;
    opacity: 0;
    cursor: pointer;
}

/* Create a custom radio button */
.checkmark {
    position: absolute;
    top: 0;
    left: 0;
    height: 25px;
    width: 25px;
    background-color: #eee;
    border-radius: 50%;
}

/* On mouse-over, add a grey background color */
.container:hover input ~ .checkmark {
    background-color: #ccc;
}

/* When the radio button is checked, add a blue background */
.container input:checked ~ .checkmark {
    background-color: #339933;
}

/* Create the indicator (the dot/circle - hidden when not checked) */
.checkmark:after {
    content: "";
    position: absolute;
    display: none;
}

/* Show the indicator (dot/circle) when checked */
.container input:checked ~ .checkmark:after {
    display: block;
}

/* Style the indicator (dot/circle) */
.container .checkmark:after {
 	top: 9px;
	left: 9px;
	width: 8px;
	height: 8px;
	border-radius: 50%;
	background: white;
}

        </style>
    </head>
    <body>
        <%
        Class.forName( "com.mysql.jdbc.Driver" );
        String projnum = session.getAttribute("projnumber").toString();
        Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/onepage", "root", "admin");
        Statement st = con.createStatement();
        String qry = "select * from paymentdetails where project_number='"+projnum+"';";
        String finish = "a";
        ResultSet r = st.executeQuery(qry);
        while (r.next()){
            if(r.getString("ref_no").equals("finish")){finish = "finish" ;break;}
        }
        %>
        <div style="margin-left: 300px;">
        <font face="Serif" size="40" color="white" style="text-align: center; float: none">  CSIR-Central Leather Research Institute  </font><br>
        <br><font face="Serif"  style="text-align:center; color: white; font-size: 30px; float: none; margin-left: 50px;">  Project Planning and Business Development Department </font>
        </div>
        <br>
         
        <form class="border"> 
            <div> <font face="serif"  color="white" style=" font-size: 35px; margin-left: 150px;" > Generation format: </font><br></div><br><br>

            <a href="newpdf.jsp" class="container" style="text-align:center; color: black;">PDF

            </a>
            <a href="excel.jsp" class="container" style="text-align:center; color: black;">
            Excel
            </a>
             <%if(!finish.equals("finish")){%>
            <a href="finish.jsp" class="container" style="text-align:center; color: black;">
            Finish project
            </a>
            <%}%>
           
            
            <a href="projtype.html" class="container" style="text-align:center; color: black;">
            Go back to New or Ongoing select page

            
            </a>

<br> <br>
        </form>
            
    </body>
</html>
