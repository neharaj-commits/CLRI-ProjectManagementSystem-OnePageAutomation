<%-- 
    Document   : searchparpameters
    Created on : 11 Jul, 2018, 3:02:56 PM
    Author     : prabhakarthangappan
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Summary page</title>
        <style>
          body {

                background-image: url('./leather.jpg');
                
                background-position: top center;

            }
            .border{
                border-radius: 25px;
                background:#ffffff ;/*linear-gradient(#ff8c66, #FFFFFF);*/
                width : 300px;
                height: 360px;
                margin-top:30px;
                margin-left: 500px;
                border: 5px groove #000000;
                background-color: #ffffff;
                padding: 50px;
            }
            
           /* The container */
/*.container {
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

 Hide the browser's default radio button 
.container input {
    position: absolute;
    opacity: 0;
    cursor: pointer;
}

 Create a custom radio button 
.checkmark {
    position: absolute;
    top: 0;
    left: 0;
    height: 25px;
    width: 25px;
    background-color: #bfbfbf;
    border-radius: 50%;
}

 On mouse-over, add a grey background color 
.container:hover input ~ .checkmark {
    background-color: #a6a6a6;
}

 When the radio button is checked, add a blue background 
.container input:checked ~ .checkmark {
    background-color: #992600;
}

 Create the indicator (the dot/circle - hidden when not checked) 
.checkmark:after {
    content: "";
    position: absolute;
    display: none;
}

 Show the indicator (dot/circle) when checked 
.container input:checked ~ .checkmark:after {
    display: block;
}

 Style the indicator (dot/circle) 
.container .checkmark:after {
 	top: 9px;
	left: 9px;
	width: 8px;
	height: 8px;
	border-radius: 50%;
	background: white;*/
/*}*/
/*    #Button1 {

                height: 30px;
                width: 180px;
                background-color: #339933;
                font-family: Arial, Helvetica, sans-serif;
                font-size: 18px;
                color: #ffffff;

            }*/
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
    .custom-select {
                background-color: rgba(153, 38, 0, 0.7);
                color:#ffffff;
                font-family: serif;
                font-size: 20px;
                text-align: center;
            }
            option{
                background-color: rgba(153, 38, 0, 0.4);
            }
            .custom-select:visited{
                background-color: rgba(153, 38, 0, 0.7);
            }      
            

            
        </style>
    </head>
    <body>
        <div style="margin-left: 300px;">
        <!--<img src="CSIR-CLRI.png" alt="clri logo" align="center" >-->
        <font face="Serif" size="40" color="white" style="text-align: center; float: none">  CSIR-Central Leather Research Institute  </font><br>
        <br><font face="Serif"  style="text-align:center; color: white; font-size: 30px; float: none; margin-left: 50px;">  Project Planning and Business Development Department </font>
        </div>
        
           <div>  
               <form action="summary.jsp" method="post"  style="text-align:center" class="border" >
            <font   face="serif"  color="black" style="text-align:center; font-size: 40px;" >Summary</font><br>
            <font   face="serif"  color="black" style="text-align:center; font-size: 40px;" >of</font>
            <br>
           
             <select name="what" class="form-control custom-select" style="text-align:center">
    <option value="all">All</option>
    <option value="GAP">Grant-In-Aid</option>
    <option value="TSP">Technical Services</option>
    <option value="COP">Collaborative</option>
    <option value="SSP">Sponsored</option>
    <option value="CNP">Consultancy</option>
    <option value="TT">Technology Transfer</option>
             </select><br>
     <font   face="serif"  color="black" style="text-align:center; font-size: 40px;" >Projects</font>        
            
            <br><br>
            <font   face="serif"  color="black" style="text-align:center; font-size: 40px;" >between</font><br>
            
            <input type="date" id="dtagreement" name="date1" placeholder="Start Date" required=""> <br>
            <font   face="serif"  color="black" style="text-align:center; font-size: 40px;" >and  </font><br>
            <input type="date" id="dtagreement" name="date2" required="" placeholder="End Date"><br><br>
            <input align="center" type="submit" value="Generate PDF" id="Button1">
           
            
<!--            <label class="container">New Project-->
                <!--<input type="text"  name="radio" value="New" checked="checked">-->
<!--                <span class="checkmark"></span>
            </label>
            <br>
            <label class="container">Ongoing Project
                <input type="radio" name="radio" value="Ongoing">
                <span class="checkmark"></span>
            </label> <br> <br>
            <input align="center" type="submit" value="Next" id="Button1">
        -->

        </form>   
           </div>
        
        
    </body>
</html>
