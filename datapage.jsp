 <%-- 
    Document   : datapage
    Created on : 18 Jun, 2018, 2:23:32 PM
    Author     : prabhakarthangappan
--%>

<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
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
                height:1600px;
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
    <body >
        <%try{
            String type = request.getParameter("type");
            
            String prom = type;
            String key = "";
            session.setAttribute("type", type);
            
            if(prom.equals("Grant-In-Aid")){key = "GAP";}
            if(prom.equals("Technical Services")){key = "TSP";}
            if(prom.equals("Collaborative")){key = "CLP";}
            if(prom.equals("Sponsored")){key = "SSP";}
            if(prom.equals("Consultancy")){key = "CNP";}
            if(prom.equals("Technology Transfer")){key = "TT";}
            
            java.util.Date dt = new java.util.Date();
            int year = 1900 + dt.getYear();
            int month = dt.getMonth();
            int fiscalyear = 0;
        
            if(month>=4){fiscalyear = year;}
        
            if(month<4){fiscalyear = year-1;}   
            
            String yr = Integer.toString(fiscalyear%100);
            
            String initial = key + "-" + yr;
            
            String fin = "a";
            
            String[] install = new String[8];
            
            install[0]="First";
            install[1]="Second";
            install[2]="Third";
            install[3]="Fourth";
            install[4]="Fifth";
            install[5]="Sixth";
            install[6]="Seventh";
            install[7]="Eighth";
            
            int insta = 1; 
            
            Class.forName( "com.mysql.jdbc.Driver" );
            Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/onepage", "root", "admin");
            Statement state = con.createStatement();
            
//            String qry = "select project_number from projdetails where project_number like '"+ initial +"%';";
//            int zoo = 0;
//            ResultSet set = state.executeQuery(qry);
//            
//            if(set != null && set.next()){ 
//                set.last();
//                String string = set.getString("project_number");
//                String number = string.substring(string.length()-2,string.length());
//                zoo = Integer.parseInt(number)+ 1;
//                if(zoo>=10){fin = Integer.toString(zoo);}
//                else {fin = "0"+Integer.toString(zoo);}
//            }
//            
//            else{
//                fin = "01";
//            }
     
 
            
            
            %>
            <div style="margin-left: 300px;">
        <!--<img src="CSIR-CLRI.png" alt="clri logo" align="center" >-->
        <font face="Serif" size="40" color="white" style="text-align: center; float: none">  CSIR-Central Leather Research Institute  </font><br>
        <br><font face="Serif"  style="text-align:center; color: white; font-size: 30px; float: none; margin-left: 50px;">  Project Planning and Business Development Department </font>
        </div>
            
            <div>
            <form action="datapage.jsp"  method="post" class="border" >
                <div>  <font face="serif" size="40" color="white" style="margin-left:200px;"> New <%out.println(type);%> Project </font></div>
            <br><br>
           <font face="serif"  color="white" style="font-size:30px;">Project details</font>
            
          <div class="container">
  
    <div class="row">
        <div class="col-25">
        <label for="projtitle">Project Title</label>
      </div>
      <div class="col-75">
        <textarea id="projtitle" name="projecttitle" placeholder="Write something.." style="height:100px" required></textarea>
      </div>
    </div>
              
              
    <div class="row">
        <div class="col-25">
        <label for="projno">Project Number</label>
      </div>
      <div class="col-75">
          <input type="text" id="pnum" name="pnum" placeholder="" required="" >
      </div>
    </div>
      
      
    <div class="row">
      <div class="col-25">
        <label for="projleaddiv">Project Leader & Division</label>
      </div>
      <div class="col-75">
        <input type="text" id="projleaddiv" name="projld" placeholder="" required="" >
      </div>
    </div>
      
      <div class="row">
      <div class="col-25">
        <label for="supervisor">Supervisor</label>
      </div>
      <div class="col-75">
        <input type="text" id="supervisor" name="super" placeholder="" required="" >
      </div>
    </div>
      
    <div class="row">
      <div class="col-25">
        <label for="projcost">Project Cost (in Rupees)</label>
      </div>
      <div class="col-25">
        <input type="text" id="projcost" name="projc" placeholder="" required="">
      </div>
        <div class="col-25">
            <label for="revprojcost">&nbsp;&nbsp;&nbsp;&nbsp;Revised Project Cost (in Rupees if any)</label>
      </div>
        <div class="col-25">
        <input type="text" id="revprojcost" name="revprojc" placeholder="" required="">
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
        <textarea id="cdetls" name="cdet" placeholder="Write something.." style="height:100px" required=""></textarea>         
      </div>
    </div>

    <div class="row">
      <div class="col-25">
        <label for="contact">Contact person & designation</label>
      </div>
      <div class="col-75">
          <textarea id="contact" name="contact" placeholder="Write something.." style="height:100px" required="" ></textarea>         
      </div>
    </div>


        <div class="row">
      <div class="col-25">
        <label for="dtagreement">Date of signing agreement</label>
      </div>
      <div class="col-25">
        <input type="date" id="dtagreement" name="dtagr" >
      </div> 
             <div class="col-25">
        <label for="dtcommence">&nbsp;&nbsp;&nbsp;&nbsp;Date of Commencement</label>
      </div>
      <div class="col-25">
        <input type="date" id="dtcommence" name="dtcomm">
      </div> 
            </div> 
              
<!--       <div class="row">
     
            </div> 
       -->
     <div class="row">
      <div class="col-25">
        <label for="projdur">Project Duration (in months)</label>
      </div>
      <div class="col-5">
        <input type="text" id="projdur" name="projd" placeholder="" required="">
      </div> 
         <div class="col-20">
             <label for="projext" style="text-align: right;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Project Extension</label>
      </div>
      <div class="col-5">
        <input type="text" id="projext" name="pext" placeholder="" required="">
      </div> 
         <div class="col-25">
        <label for="farrange">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Financial Arrangement</label>
      </div>
      <div class="col-15">
        <input type="text" id="farrange" name="farr" placeholder="">
      </div> 
            </div> 
              
              
<!--    <div class="row">
      
            </div> 
         -->
<!--    <div class="row">
      
            </div> -->
              <%if(key.equals("GAP")){%>
    <div class="row">
      <div class="col-25">
        <label for="accorddet">Details of Approval </label>
      </div>
      <div class="col-75">
        <input type="text" id="accorddet" name="accdet" placeholder="">
      </div> 
            </div>
              <%}%>
     <br> <hr>       
     <strong> <font face="serif"  color="black" style="font-size:30px;" >Payment details</font>  </strong>
    <br><br>
           <div class="row">
      <div class="col-25">
        <label for="inst">Installment </label>
      </div>
      <div class="col-75">
          <%out.print("First");%> 
          
      </div> 
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
        <label for="amtrec">Amount Received (in Rupees)</label>
      </div>
      <div class="col-75">
        <input type="text" id="amtrec" name="amountrec" placeholder="" required="">
      </div> 
            </div> 
    
        <div class="row">
      <div class="col-25">
        <label for="projamt">Project Amount (in Rupees) </label>
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
        <label for="tds">TDS (in Rupees) </label>
      </div>
      <div class="col-75">
        <input type="text" id="tds" name="tds" placeholder="" required="">
      </div> 
            </div> 
    
    <div class="row">
      <div class="col-25">
        <label for="gstdue">GST Due (in Rupees) </label>
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
        <textarea id="rem" name="remarks" placeholder="Write something.." style="height:200px" required=""></textarea>         
      </div>
    </div>
              
       <br><br>
    
       <!--<input type="hidden" name="type" value="<% out.println(type);%>">-->
       <input type="hidden" name="type" value="<%=type%>" />
    <div class="row">
      <input type="submit" name="submit" value="Submit"  >
      <br><br>
      
      
    </div>
              
       </div>     
  </form>
          
          </div>
            
                <%
                
                String projecttitle = request.getParameter("projecttitle");
                String projld = request.getParameter("projld");
                String supervisor = request.getParameter("super");
                String projnum = request.getParameter("pnum");
                session.setAttribute("projnumber", projnum);
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
                
                String refnum = request.getParameter("refnum");
                String date = request.getParameter("date");
                String amountrec = request.getParameter("amountrec");
                String projamount = request.getParameter("projamount");
                String gst = request.getParameter("gst");
                String tds = request.getParameter("tds");
                String gstdue = request.getParameter("gstdue");
                String remarks = request.getParameter("remarks");
                session.setAttribute("projnumber", projnum);
                
                Statement st = con.createStatement();
                
                
                if(projecttitle!=null){
                st.executeUpdate("insert into projdetails (project_title,project_number,project_leader_and_division,project_cost,revised_project_cost,client_details,date_of_signing,start_date,project_duration,financial_arrangement,project_extension,details_of_accord,supervisor,contact)values ('"+projecttitle+"','"+projnum+"','"+projld+"','"+projc+"','"+revprojc+"','"+cdet+"','"+dtagr+"','"+dtcomm+"','"+projd+"','"+farr+"','"+pext+"','"+accdet+"','"+supervisor+"','"+contact+"')");
                st.executeUpdate("insert into paymentdetails (project_number,installment,ref_no,date,amount_received,proj_amount,gst,tds,gst_due,remarks)values('"+projnum+"','"+insta+"','"+refnum+"','"+date+"','"+amountrec+"','"+projamount+"','"+gst+"','"+tds+"','"+gstdue+"','"+remarks+"');"); 
                %><br><br><font color="red"><%out.println("Your data has been stored");%></font>
               
                <%
                response.sendRedirect("generationpg.jsp");
                }
            
            }catch(Exception e){
                e.printStackTrace();
                out.println(e);
            }   
%> 
    </body>

</html>
