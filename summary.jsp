<%-- 
    Document   : summary
    Created on : 11 Jul, 2018, 3:03:31 PM
    Author     : prabhakarthangappan
--%>

<%@page import="java.io.DataOutputStream"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="com.itextpdf.text.pdf.PdfPTable"%>
<%@page import="com.itextpdf.text.PageSize"%>
<%@page import="com.itextpdf.text.Document"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="org.apache.tomcat.util.http.fileupload.ByteArrayOutputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%try{
        response.setContentType("application/pdf");
        Document document = new Document(PageSize.A4) ;
        ByteArrayOutputStream buffer = new ByteArrayOutputStream();
        PdfWriter writer = PdfWriter.getInstance(document , buffer); 
        document.open();
        PdfPTable table = new PdfPTable(10);
        table.setWidthPercentage(100);
        
        Class.forName( "com.mysql.jdbc.Driver" );
        Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/onepage", "root", "admin");
        Statement state = con.createStatement();
//        SimpleDateFormat sm = new SimpleDateFormat("dd-MM-yyyy");
//        SimpleDateFormat su = new SimpleDateFormat("yyyy-MM-dd");
        
        String what = request.getParameter("what");
//        
//        String sdate1 = request.getParameter("date1"); 
//        
//        Date date1 = new SimpleDateFormat("dd/MM/yyyy").parse(sdate1);  
//        
//        String sdate2 = request.getParameter("date2"); 
//        
//        Date date2 = new SimpleDateFormat("dd/MM/yyyy").parse(sdate2);
//        
        
        if (what.equals("all")){
        
        String[] types = new String[6];
        
        types[0] = "GAP";
        types[1] = "TSP";
        types[2] = "CLP";
        types[3] = "SSP";
        types[4] = "CNP";
        types[5] = "TT";
        
        int i = 0;
            
        
        table.addCell("Project Number");
        table.addCell("Project Title");
        table.addCell("1st Installment");
        table.addCell("2nd Installment");
        table.addCell("3rd Installment");
        table.addCell("4th Installment");
        table.addCell("5th Installment");
        table.addCell("6th Installment");
        table.addCell("7th Installment");
        table.addCell("8th Installment");
        
        
        
        while(i<6){
        
            String proj = "select * from projdetails;";
        
            ResultSet project = state.executeQuery(proj);
            
            String pnum="" ; String ptitle="" ;
            
            Statement s = con.createStatement();
           
            while (project.next()){
        
            pnum = project.getString("project_number");
        
            ptitle = project.getString("project_title");

            String pay = "select * from paymentdetails where project_number = '"+ pnum +"';";
        
            ResultSet payment = s.executeQuery(pay);
            
            int j = 0 ;
            
            table.addCell(pnum);
            table.addCell(ptitle);
            
            
            while(payment.next()){
                String insta = payment.getString("installment");
                
                String amount = payment.getString("amount_received");
                
                table.addCell("Installment - "+insta+" = "+amount);
                
                j++;
            }
            
            if(j!=8){
                int k = 0;
                while(k < (8-j)){
                    table.addCell("-");
                    k++;
                }
            }
            }   
        i++;
        }
        
        
//        else{
//            String proj = "select * from projdetails where project_number like '"+ what +"%' and start_date between '"+ sdate1 +"' and '"+ sdate2 +"';";
//        
//            ResultSet project = state.executeQuery(proj);
//            String pnum = "" ; String ptitle="" ;
//            
//            if(project.next()){
//        
//             pnum = project.getString("project_number");
//        
//             ptitle = project.getString("project_title");
//            }
//        
//            Statement s = con.createStatement();
//        
//            String pay = "select * from paymentdetails where project_number = '"+ pnum +"';";
//        
//            ResultSet payment = s.executeQuery(pay);
//            
//            int j = 0 ;
//            
//            table.addCell(pnum);
//            table.addCell(ptitle);
//            
//            
//            while(payment.next()){
//                String insta = payment.getString("installment");
//                
//                String amount = payment.getString("amount_received");
//                
//                table.addCell("Installment - " + insta + " = " + amount);
//                
//                j++;
//            }
//            
//            if(j!=8){
//                int k = 0;
//                while(k < (8-j)){
//                    table.addCell("-");
//                    k++;
//                }
//            }    
//        }
//        
                FileOutputStream fileout = new FileOutputStream("D:\\summary.pdf");
                DataOutputStream dataOutput = new DataOutputStream(response.getOutputStream());
                byte[] bytes = buffer.toByteArray();
                response.setContentLength(bytes.length);
                for(int x = 0; x < bytes.length; x++){
                    dataOutput.writeByte(bytes[x]);
                    fileout.write(bytes[x]);
                }
                dataOutput.flush();
                dataOutput.close();
                fileout.flush();
                fileout.close();
                return;
        
        }
        }
        catch(Exception e){
            out.println(e);
        }
        %>
    </body>
</html>
