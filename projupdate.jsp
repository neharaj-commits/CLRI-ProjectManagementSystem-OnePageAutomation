<%-- 
    Document   : projupdate
    Created on : 17 Jul, 2018, 3:03:48 AM
    Author     : prabhakarthangappan
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>New Project Form</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
            body {

                background-image: url('./leather.jpg');
                
                background-position: center center;

            }
            label{
                font-family: Arial, Helvetica, sans-serif;
            }
            .border{
                border-radius: 25px;
                /*background: linear-gradient(#ff8c66, #FFFFFF, #ff8c66);*/
                width:1100px;
                height:1000px;
                margin-top:50px;
                margin-left: 110px;
                border: 5px groove #000000;
                background-color: #000000;
                padding: 50px;
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
    background-color: #992600;
    color: white;
    padding: 12px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    float: right;
}

input[type=submit]:hover {
    background-color: #cc3300;
}

input[type=button] {
    background-color: #992600;
    color: white;
    padding: 12px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    float: right;
}

input[type=button]:hover {
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

.col-20 {
    float: left;
    width: 20%;
    margin-top: 6px;
}

.col-75 {
    float: left;
    width: 75%;
    margin-top: 6px;
}

.col-15 {
    float: left;
    width: 15%;
    margin-top: 6px;
}

.col-5 {
    float: left;
    width: 5%;
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
    <body>
        <%
        String type = session.getAttribute("type").toString();
        
        Class.forName( "com.mysql.jdbc.Driver" );
        String projnum = session.getAttribute("projnumber").toString();
        Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/onepage", "root", "admin");
        Statement state = con.createStatement();
        String query = "select * from projdetails where project_number = '"+ projnum +"';";
        ResultSet rs = state.executeQuery(query);
        
        rs.next();

        %> 
       
       <div style="margin-left: 300px;">
        <!--<img src="CSIR-CLRI.png" alt="clri logo" align="center" >-->
        <font face="Serif" size="40" color="white" style="text-align: center; float: none">  CSIR-Central Leather Research Institute  </font><br>
        <br><font face="Serif"  style="text-align:center; color: white; font-size: 30px; float: none; margin-left: 50px;">  Project Planning and Business Development Department </font>
        </div>
            
        
        <div>
            <form action="projupdate.jsp"  method="post" class="border" >
               
           <font face="serif"  color="white" style="font-size:30px;">Project details</font>
            
          <div class="container">
  
    <div class="row">
        <div class="col-25">
        <label for="projtitle">Project Title</label>
      </div>
      <div class="col-75">
        <input type="text" value ="<%out.println(rs.getString("project_title"));%>" id="projtitle" name="projecttitle" placeholder="" required="" >
      </div>
    </div>
              
              
    <div class="row">
        <div class="col-25">
        <label for="projno">Project Number</label>
        
      </div>
        <div class="col-25" style="">
            <input type="text" value ="<%out.println(rs.getString("project_number"));%>" id="projno" name="projectnum" placeholder="" readonly >
          
      </div>
    </div>
      
      
    <div class="row">
      <div class="col-25">
        <label for="projleaddiv">Project Leader & Division</label>
      </div>
      <div class="col-75">
        <input type="text" id="projleaddiv" name="projld" placeholder="" value ="<%out.println(rs.getString("project_leader_and_division"));%>" required="" >
      </div>
    </div>
      
      <div class="row">
      <div class="col-25">
        <label for="supervisor">Supervisor</label>
      </div>
      <div class="col-75">
        <input type="text" id="supervisor" name="super" placeholder="" required="" value ="<%out.println(rs.getString("supervisor"));%>" >
      </div>
    </div>
      
    <div class="row">
      <div class="col-25">
        <label for="projcost">Project Cost (in Rupees)</label>
      </div>
      <div class="col-25">
        <input type="text" id="projcost" name="projc" placeholder="" value ="<%out.println(rs.getString("project_cost"));%>" required="">
      </div>
        <div class="col-25">
            <label for="revprojcost">&nbsp;&nbsp;&nbsp;&nbsp;Revised Project Cost (in Rupees if any)</label>
      </div>
        <div class="col-25">
        <input type="text" id="revprojcost" name="revprojc" placeholder="" required="" value ="<%out.println(rs.getString("revised_project_cost"));%>">
      </div> 
    </div>
      
      
      
<!--    <div class="row">
      <div class="col-25">
        <label for="revprojcost">Revised Project Cost (if any)</label>
      </div>
      <div class="col-75">
        <input type="text" id="revprojcost" name="revprojc" placeholder="" required="">
      </div> 
        </div>-->
        
        <div class="row">
      <div class="col-25">
        <label for="cdetls">Client Details</label>
      </div>
      <div class="col-75">
          <input type="text" id="cdetls" name="cdet" placeholder="" required="" value ="<%out.println(rs.getString("client_details"));%>">
          
      </div>
    </div>

    <div class="row">
      <div class="col-25">
        <label for="contact">Contact person & designation</label>
      </div>
      <div class="col-75">
          <input type="text" id="contact" name="contact" placeholder="" required="" value ="<%out.println(rs.getString("contact"));%>">
                
      </div>
    </div>


        <div class="row">
      <div class="col-25">
        <label for="dtagreement">Date of signing agreement</label>
      </div>
      <div class="col-25">
        <input type="date" id="dtagreement" name="dtagr" value ="<%out.println(rs.getString("date_of_signing"));%>" required="">
      </div> 
             <div class="col-25">
        <label for="dtcommence">&nbsp;&nbsp;&nbsp;&nbsp;Date of Commencement</label>
      </div>
      <div class="col-25">
        <input type="date" id="dtcommence" name="dtcomm" value ="<%out.println(rs.getString("start_date"));%>" required="">
      </div> 
            </div> 
              
<!--       <div class="row">
     
            </div> 
       -->
     <div class="row">
      <div class="col-25">
        <label for="projdur">Project Duration (in months)</label>
      </div>
      <div class="col-75">
        <input type="text" id="projdur" name="projd" placeholder="" required="" value ="<%out.println(rs.getString("project_duration"));%>">
      </div>
      </div>
      
      <div class="row">
         <div class="col-25">
             <label for="projext" style="text-align: right;">Project Extension</label>
      </div>
      <div class="col-75">
        <input type="text" id="projext" name="pext" placeholder="" required="" value ="<%out.println(rs.getString("project_extension"));%>" >
      </div> 
      </div>
    
      
      <div class="row">
         <div class="col-25">
        <label for="farrange">Financial Arrangement</label>
      </div>
      <div class="col-75">
        <input type="text" id="farrange" name="farr" placeholder="" value ="<%out.println(rs.getString("financial_arrangement"));%>">
      </div> 
            </div> 
              
              
<!--    <div class="row">
      
            </div> 
         -->
<!--    <div class="row">
      
            </div> -->
    <%if(type.equals("Grant-In-Aid")){%>          
    <div class="row">
      <div class="col-25">
        <label for="accorddet">Details of Approval </label>
      </div>
      <div class="col-75">
        <input type="text" id="accorddet" name="accdet" placeholder="" value ="<%out.println(rs.getString("details_of_accord"));%>">
      </div> 
            </div>
    <%}%>
<!--          </div>-->
          
    <div class="row">
        <br>
      <input type="submit" name="submit" value="Submit"  >
       <input type="button" style="margin-right:16px;" onclick="window.location.href='ongoingdisplayformjsp.jsp'" value="Go back to project display page" >
      <br>
      
      
    </div>

            </form>
</div>          
    <%
                String projecttitle = request.getParameter("projecttitle");
                String projld = request.getParameter("projld");
                String supervisor = request.getParameter("super");
                String projc = request.getParameter("projc");
                String revprojc = request.getParameter("revprojc");
                String cdet = request.getParameter("cdet");
                String dtagr = request.getParameter("dtagr");
                String dtcomm = request.getParameter("dtcomm");
                String projd = request.getParameter("projd");
                String farr = request.getParameter("farr");
                String pext = request.getParameter("pext");
                String accdet = request.getParameter("accdet");
                String contact = request.getParameter("contact");   


                Statement st = con.createStatement();
                if(projecttitle!=null){
                st.executeUpdate("update projdetails set project_title='"+projecttitle+"',project_leader_and_division ='"+projld+"',project_cost='"+projc+"',revised_project_cost='"+revprojc+"',client_details='"+cdet+"',date_of_signing='"+dtagr+"',start_date='"+dtcomm+"',project_duration='"+projd+"',financial_arrangement='"+farr+"',project_extension='"+pext+"',details_of_accord='"+accdet+"',supervisor='"+supervisor+"',contact='"+contact+"' where project_number='"+projnum+"';");
     
                response.sendRedirect("ongoingdisplayformjsp.jsp");
                }
               
    %>    
    </body>
    <script>
        var farrange = Document.getElementById("farrange");
        farrange.addEventListener("focus", function(){
            if(!isNaN(farrange.value)){
                farrange.value = "";
            }
        }, true);
    </script>
</html>
