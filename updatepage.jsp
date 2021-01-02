<%-- 
    Document   : updatepage
    Created on : 4 Jul, 2018, 2:38:48 PM
    Author     : prabhakarthangappan
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
                height:1750px;
                margin-top:30px;
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
    border: 2px solid #000;
}

th, td {
    text-align: left;
    padding: 8px;
}

tr:nth-child(even){background-color: #f2f2f2}

        </style>
    
        <title>Update details page</title>
    </head>
    <body>
        <%
            Class.forName( "com.mysql.jdbc.Driver" );
            String projnum = session.getAttribute("projnumber").toString();
            Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/onepage", "root", "admin");
            
            SimpleDateFormat sm = new SimpleDateFormat("dd-MM-yyyy");
            SimpleDateFormat su = new SimpleDateFormat("yyyy-MM-dd");
                
            
            String type = projnum.substring(0,projnum.length()-5);
            
            String key = "a";
            
            if(type.equals("GAP")){key = "Grant-In-Aid";}
            if(type.equals("TSP")){key = "Technical Services";}
            if(type.equals("CLP")){key = "Collaborative";}
            if(type.equals("SSP")){key = "Sponsored";}
            if(type.equals("CNP")){key = "Consultancy";}
            if(type.equals("TT")){key = "Technology Transfer";}
            
        %>
        
        <div style="margin-left: 300px;">
        <!--<img src="CSIR-CLRI.png" alt="clri logo" align="center" >-->
        <font face="Serif" size="40" color="white" style="text-align: center; float: none">  CSIR-Central Leather Research Institute  </font><br>
        <br><font face="Serif"  style="text-align:center; color: white; font-size: 30px; float: none; margin-left: 50px;">  Project Planning and Business Development Department </font>
        </div>
        <div>
            <form action="updatepage.jsp" method="post" class="border">
            <div>  <font face="serif" size="40" color="white" style="margin-left:100px;">Update Ongoing <%out.println(key);%> Project  </font></div>
            <br> <div>  <font face="serif" size="40" color="white" style="margin-left:100px;">Project Number: <%out.println(projnum); %>  </font></div>
             <br><br>   <br><br>      
    
    <div class="container">
    <font face="serif" size="20" color="black" >Previous Payment installments</font>  <br>
    
    
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
        Statement state = con.createStatement();
        String qry = "select * from paymentdetails where project_number='"+projnum+"';";
        ResultSet r = state.executeQuery(qry);
        
        int insta = 0;
        Statement bs = con.createStatement();
            
            String q = "select * from paymentdetails where project_number = '"+ projnum +"';";
            
            ResultSet rs = bs.executeQuery(q);
            
            String[] install = new String[8];
            
            install[0]="First";
            install[1]="Second";
            install[2]="Third";
            install[3]="Fourth";
            install[4]="Fifth";
            install[5]="Sixth";
            install[6]="Seventh";
            install[7]="Eighth";
            
            rs.last();
            int trial = rs.getInt("installment");
            insta = trial+1 ;
            
        while (r.next()){
            int i = 0;
            i = Integer.parseInt(r.getString("installment"));
    %>
     <tr>
      <td><%out.println(install[i-1]);%></td>
      <td><%out.println(r.getString("ref_no"));%></td>
      <td><%out.println(sm.format(su.parse(r.getString("date"))));%></td>
      <td><%out.println("Rs." + r.getString("amount_received"));%></td>
      <td><%out.println("Rs." + r.getString("proj_amount"));%></td>
      <td><%out.println("Rs." + r.getString("gst"));%></td>
      <td><%out.println("Rs." + r.getString("tds"));%></td>
      <td><%out.println("Rs." + r.getString("gst_due"));%></td>
      <td><%out.println(r.getString("remarks"));%></td>
    </tr>
    <%}%>
    </table>
    <br><br><br><br>
    <font face="serif" style="font-size:30px;" color="black" >Project Extension if any : </font>  
    <label class="container" style="font-size: 30px; font-family: serif;">Yes
                <input type="radio"  name="radio" id="yes" value="yes" checked="checked">
                
            </label>
            <label class="container" style="font-size: 30px; font-family: serif;"> No
                <input type="radio" name="radio" id="no" value="no">
            </label>
    <%
            
    %>
    <br><br><br><br>
    <hr>
    
    <font face="serif" size="30" color="black" >Payment details</font>  <br><br>
    
    <br>
           <div class="row">
      <div class="col-25">
        <label for="inst">Installment</label>
      </div>
      <div class="col-25">
        <%out.println(install[insta-1]);%>
        
      </div> 
<!--      <div class="col-25">
        <label for="refno">Project Extension</label>
      </div>
      <div class="col-25">
        <input type="date" id="dt" name="date" required="">
      </div> -->
            </div> 
    
    <div class="row">
      <div class="col-25">
        <label for="refno">Bank details and Reference No.</label>
      </div>
      <div class="col-75">
        <input type="text" id="refno" name="refnum" placeholder="" required="">
      </div> 
            </div> 
    
    <div class="row">
      <div class="col-25">
        <label for="dt">Date</label>
      </div>
      <div class="col-75">
        <input type="date" id="dt" name="date" required="">
      </div> 
            </div> 
    
    <div class="row">
      <div class="col-25">
        <label for="amtrec">Amount Received(in Rupees)</label>
      </div>
      <div class="col-75">
        <input type="text" id="amtrec" name="amountrec" placeholder="" required="">
      </div> 
            </div> 
    
        <div class="row">
      <div class="col-25">
        <label for="projamt">Project Amount(in Rupees)</label>
      </div>
      <div class="col-75">
        <input type="text" id="projamt" name="projamount" placeholder="" required="">
      </div> 
            </div> 
    
    <div class="row">
      <div class="col-25">
        <label for="gst">GST(in Rupees) </label>
      </div>
      <div class="col-75">
        <input type="text" id="gst" name="gst" placeholder="" required="">
      </div> 
            </div> 
    
    <div class="row">
      <div class="col-25">
        <label for="tds">TDS(in Rupees) </label>
      </div>
      <div class="col-75">
        <input type="text" id="tds" name="tds" placeholder="" required="">
      </div> 
            </div> 
    
    <div class="row">
      <div class="col-25">
        <label for="gstdue">GST Due(in Rupees) </label>
      </div>
      <div class="col-75">
        <input type="text" id="gstdue" name="gstdue" placeholder="" required="">
      </div> 
            </div> 
    
    <div class="row">
      <div class="col-25">
        <label for="rem">Remarks</label>
      </div>
      <div class="col-75">
        <textarea id="rem" name="remarks" placeholder="Write something.." style="height:100px" required=""></textarea>         
      </div>
    </div>
              
       <br><br>
       <div class="row">
           <input type="submit" style="margin-right:16px;" value="Update details">
       </div>
            </div>
        <input type="button" style="margin-right:16px;" onclick="window.location.href='ongoingdisplayformjsp.jsp'" value="Go back to project display page" >
        
        
            </form>
        </div>
    
    <%
        
        String refnum = request.getParameter("refnum");
        String date = request.getParameter("date");
        String amountrec = request.getParameter("amountrec");
        String projamount = request.getParameter("projamount");
        String gst = request.getParameter("gst");
        String tds = request.getParameter("tds");
        String gstdue = request.getParameter("gstdue");
        String remarks = request.getParameter("remarks");
        
        Statement st = con.createStatement();
        
        if(refnum!=null){
        st.executeUpdate("insert into paymentdetails (project_number,installment,ref_no,date,amount_received,proj_amount,gst,tds,gst_due,remarks)values('"+projnum+"','"+insta+"','"+refnum+"','"+date+"','"+amountrec+"','"+projamount+"','"+gst+"','"+tds+"','"+gstdue+"','"+remarks+"');");
        response.sendRedirect("ongoingdisplayformjsp.jsp");
        }
        
                
    %>
    
    </body>
</html>
