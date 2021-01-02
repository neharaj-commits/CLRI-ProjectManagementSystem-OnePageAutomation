<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Ongoing Project details</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
                width:1100px;
                height:1400px;
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
table {
    border-collapse: collapse;
    border-spacing: 0;
    width: 100%;
    border: 3px solid #000;
}

th, td {
    text-align: left;
    padding: 8px;
}

tr:nth-child(even){background-color: #f2f2f2}

        </style>
    </head>
    <body>
        <%
            Class.forName( "com.mysql.jdbc.Driver" );
            String projnum = session.getAttribute("projnumber").toString();
            Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/onepage", "root", "admin");
            Statement state = con.createStatement();
            String query = "select * from projdetails where project_number = '"+ projnum +"';";
            ResultSet rs = state.executeQuery(query);
            
            SimpleDateFormat sm = new SimpleDateFormat("dd-MM-yyyy");
            SimpleDateFormat su = new SimpleDateFormat("yyyy-MM-dd");

            rs.next();
            
            
            String type = projnum.substring(0,projnum.length()-5);
            
            String key = "a";
            
            if(type.equals("GAP")){key = "Grant-In-Aid";}
            if(type.equals("TSP")){key = "Technical Services";}
            if(type.equals("CLP")){key = "Collaborative";}
            if(type.equals("SSP")){key = "Sponsored";}
            if(type.equals("CNP")){key = "Consultancy";}
            if(type.equals("TT")){key = "Technology Transfer";}
            
            session.setAttribute("type", key);
        %>
        
        <div style="margin-left: 300px;">
        <!--<img src="CSIR-CLRI.png" alt="clri logo" align="center" >-->
        <font face="Serif" size="40" color="white" style="text-align: center; float: none">  CSIR-Central Leather Research Institute  </font><br>
        <br><font face="Serif"  style="text-align:center; color: white; font-size: 30px; float: none; margin-left: 50px;">  Project Planning and Business Development Department </font>
        </div>
        <form  method="post" class="border">
            <div>  <font face="serif" size="40" color="white" style="margin-left:200px;">Ongoing <%out.println(key);%> Project</font></div>
            <br><br>
            <font face="serif"  color="white" style="font-size:30px;">Project details</font>
            
          <div class="container">
  
    <div class="row">
      <div class="col-25">
        <label for="projtitle">Project Title : </label>
      </div>
      <div class="col-75">
        <%out.println(rs.getString("project_title"));%>
      
      </div>
    </div>
              
              
    <div class="row">
      <div class="col-25">
        <label for="projno">Project Number : </label>
      </div>
      <div class="col-75">
          <%out.println(projnum);%>
      </div>
    </div>
      
      
    <div class="row">
      <div class="col-25">
        <label for="projleaddiv">Project Leader & Division : </label>
      </div>
      <div class="col-75">
            <%out.println(rs.getString("project_leader_and_division"));%>      
      </div>
    </div>
      
      <div class="row">
      <div class="col-25">
        <label for="supervisor">Supervisor : </label>
      </div>
      <div class="col-75">
            <%out.println(rs.getString("supervisor"));%>      
      </div>
    </div>
      
    <div class="row">
      <div class="col-25">
        <label for="projcost">Project Cost : </label>
      </div>
      <div class="col-75">
        <%out.println("Rs." + rs.getString("project_cost"));%>      
      </div>
    </div>
      
      
    <div class="row">
      <div class="col-25">
        <label for="revprojcost">Revised Project Cost (if any) : </label>
      </div>
      <div class="col-75">
            <%out.println("Rs." + rs.getString("revised_project_cost"));%>
      </div> 
        </div>
        
        <div class="row">
      <div class="col-25">
        <label for="cdetls">Client Details : </label>
      </div>
      <div class="col-75">
            <%out.println(rs.getString("client_details"));%>
      </div>
    </div>
      
      <div class="row">
      <div class="col-25">
        <label for="contact">Contact Person & Designation : </label>
      </div>
      <div class="col-75">
            <%out.println(rs.getString("contact"));%>
      </div>
    </div>
      
      
      
        <div class="row">
      <div class="col-25">
        <label for="dtagreement">Date of signing agreement : </label>
      </div>
      <div class="col-75">
            <%out.println(sm.format(su.parse(rs.getString("date_of_signing"))));%>
      </div> 
            </div> 
              
       <div class="row">
      <div class="col-25">
        <label for="dtcommence">Date of Commencement : </label>
      </div>
      <div class="col-75">
        <%out.println(sm.format(su.parse(rs.getString("start_date"))));%>
      </div> 
            </div> 
       
     <div class="row">
      <div class="col-25">
        <label for="projdur">Project Duration (in months) : </label>
      </div>
      <div class="col-75">
        <%out.println(rs.getString("project_duration"));%>
      </div> 
            </div> 
              
              
    <div class="row">
      <div class="col-25">
        <label for="farrange">Financial Arrangement : </label>
      </div>
      <div class="col-75">
        <%out.println(rs.getString("financial_arrangement"));%>
      </div> 
            </div> 
         
    <div class="row">
      <div class="col-25">
        <label for="projext">Project Extension : </label>
      </div>
      <div class="col-75">
        <%out.println(rs.getString("project_extension"));%>
      </div> 
            </div> 
      
            
        <%if(type.equals("Grant-In-Aid")){%><div class="row">
      <div class="col-25">
        <label for="accorddet">Details of Approval : </label>
      </div>
      <div class="col-75">
        <%out.println(rs.getString("details_of_accord"));%>
      </div> 
            </div>
      <%}%>
 
      
     <br><br> <hr>  <br>    
    <strong> <font face="serif"  color="black" style="font-size:30px;" >Payment details</font>  </strong>
    <br><br><br><br>
           
       <br><br>   
       
       <table>
    <tr>
      <th>Installment</th>
      <th>Bank details and Reference number</th>
      <th>Date</th>
      <th>Amount Received</th>
      <th>Project Amount</th>
      <th>GST</th>
      <th>TDS</th>
      <th>GST Due</th>
      <th>Remarks</th>
      
    </tr>
    <% 
        Statement st = con.createStatement();
        String qry = "select * from paymentdetails where project_number='"+projnum+"';";
        String finish = "a";
        ResultSet r = st.executeQuery(qry);
        
                
        String[] install = new String[8];
            
            install[0]="First";
            install[1]="Second";
            install[2]="Third";
            install[3]="Fourth";
            install[4]="Fifth";
            install[5]="Sixth";
            install[6]="Seventh";
            install[7]="Eighth";
            
        while (r.next()){
            if(r.getString("ref_no").equals("finish")){finish = "finish" ;break;}
            
            else{
    %>
     <tr>
      <td><%out.println(install[r.getInt("installment")-1]);%></td>
      <td><%out.println(r.getString("ref_no"));%></td>
      <td><%out.println(sm.format(su.parse(r.getString("date"))));%></td>
      <td><%out.println("Rs." + r.getString("amount_received"));%></td>
      <td><%out.println("Rs." + r.getString("proj_amount"));%></td>
      <td><%out.println("Rs." + r.getString("gst"));%></td>
      <td><%out.println("Rs." + r.getString("tds"));%></td>
      <td><%out.println("Rs." + r.getString("gst_due"));%></td>
      <td><%out.println(r.getString("remarks"));%></td>
    </tr>
    <%}}
    
    %>
    </table>
    <br><br>
              
    <div class="row">
      <%if(!finish.equals("finish")){%>
      <input type="button" style="margin-right:16px;" onclick="window.location.href='updatepage.jsp'" value="Update payment details" >
      <%}%>
      <input type="button" style="margin-right:16px;" onclick="window.location.href='excel.jsp'" value="Generate excel file" >
      <input type="button" value="Generate PDF file" style="margin-right:16px;" onclick="window.location.href='newpdf.jsp'" >
      <%if(!finish.equals("finish")){%>
      <input type="button" id="finish" style="margin-right:16px;" value="Finish project" onclick="myFunction()">
    <script>
    function myFunction() {
        if (confirm("Do you want to finish this project?")) {
            window.location = "finish.jsp";
        }
        else{}
        document.getElementById("finish");
    }
    </script>
      <%}%>
      <%if(!finish.equals("finish")){%>
      <input type="button" style="margin-right:16px;" value="Change project details" onclick="window.location.href='projupdate.jsp'">
      <%}%>
    </div>
              
           
  </form>
        

       
        
        
    </body>
</html>
