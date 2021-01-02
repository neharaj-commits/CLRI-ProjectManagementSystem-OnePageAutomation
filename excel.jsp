<%-- 
    Document   : jspexcel
    Created on : May 31, 2018, 10:45:31 PM
    Author     : Neha
--%>
<%@page import="org.apache.poi.ss.usermodel.Row"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFCell"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.sql.*"%>
<%@page import="org.apache.poi.hssf.usermodel.*"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFRow"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFSheet"%>
<%@page import="org.apache.poi.hssf.usermodel.HSSFWorkbook"%>

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
                HSSFWorkbook wb = new HSSFWorkbook();
                HSSFSheet sheet = wb.createSheet("new_sheet");
                String projectnum = session.getAttribute("projnumber").toString();
 
                
                Class.forName("com.mysql.jdbc.Driver");
                Connection co = DriverManager.getConnection("jdbc:mysql://localhost:3306/onepage", "root", "admin");
                
                Statement st = co.createStatement();
                Statement be = co.createStatement();
                
                String s = "select * from paymentdetails where project_number='"+projectnum+"';";
                
                String query = "select * from projdetails where project_number='"+projectnum+"';";
                
                ResultSet rs= st.executeQuery(query);
                ResultSet bs= be.executeQuery(s);
                
                int rowcount = 0;
                out.print(projectnum);
                    rs.next();
                    HSSFRow row = sheet.createRow((short)1);
                    HSSFRow row1 = sheet.createRow((short)0);
                    HSSFCell cell = row.createCell((short)0);
                    HSSFCell cell1 = row1.createCell((short)0);
                    
                    cell1.setCellValue("Project Title");
                    row1.createCell((short)1).setCellValue("Project Number");
                    row1.createCell((short)2).setCellValue("Project Leader and Division");
                     row1.createCell((short)3).setCellValue("Project Cost");
                    row1.createCell((short)4).setCellValue("Revised Project Cost");
                     row1.createCell((short)5).setCellValue("Client Details");
                    row1.createCell((short)6).setCellValue("Date of signing");
                     row1.createCell((short)7).setCellValue("Start date");
                   row1.createCell((short)8).setCellValue("Project Duration");
                     row1.createCell((short)9).setCellValue("Financial Arrangement");
                    row1.createCell((short)10).setCellValue("Project Extension");
                    row1.createCell((short)11).setCellValue("Details of Accord");
                    
                    
                    cell.setCellValue(rs.getString("project_title"));
                    row.createCell((short)1).setCellValue(rs.getString("project_number"));
                    row.createCell((short)2).setCellValue(rs.getString("project_leader_and_division"));
                     row.createCell((short)3).setCellValue(rs.getString("project_cost"));
                    row.createCell((short)4).setCellValue(rs.getString("revised_project_cost"));
                     row.createCell((short)5).setCellValue(rs.getString("client_details"));
                    row.createCell((short)6).setCellValue(rs.getString("date_of_signing"));
                     row.createCell((short)7).setCellValue(rs.getString("start_date"));
                   row.createCell((short)8).setCellValue(rs.getString("project_duration"));
                     row.createCell((short)9).setCellValue(rs.getString("financial_arrangement"));
                    row.createCell((short)10).setCellValue(rs.getString("project_extension"));
                    row.createCell((short)11).setCellValue(rs.getString("details_of_accord"));
                    
                HSSFRow row3 = sheet.createRow((short)3);
                
                    row3.createCell((short)0).setCellValue("Installment");
                     row3.createCell((short)1).setCellValue("Reference number");
                    row3.createCell((short)2).setCellValue("Date");
                     row3.createCell((short)3).setCellValue("Amount Received");
                    row3.createCell((short)4).setCellValue("Project Amount");
                     row3.createCell((short)5).setCellValue("GST");
                   row3.createCell((short)6).setCellValue("TDS");
                     row3.createCell((short)7).setCellValue("GST Due");
                     
                     int i = 4;
                     HSSFRow row4 = sheet.createRow((short)4);
                     HSSFRow row5 = sheet.createRow((short)5);
                     HSSFRow row6 = sheet.createRow((short)6);
                     HSSFRow row7 = sheet.createRow((short)7);
                     HSSFRow row8 = sheet.createRow((short)8);
                     HSSFRow row9 = sheet.createRow((short)9);
                     HSSFRow row10 = sheet.createRow((short)10);
                     
                     while(bs.next()){
                         if(bs.getString("ref_no").equals("finish")){break;}
                         else{
                    if(i==4){
                    row4.createCell((short)0).setCellValue(bs.getString("installment"));
                    row4.createCell((short)1).setCellValue(bs.getString("ref_no"));
                    row4.createCell((short)2).setCellValue(bs.getString("date"));
                    row4.createCell((short)3).setCellValue(bs.getString("amount_received"));
                    row4.createCell((short)4).setCellValue(bs.getString("proj_amount"));
                    row4.createCell((short)5).setCellValue(bs.getString("gst"));
                    row4.createCell((short)6).setCellValue(bs.getString("tds"));
                    row4.createCell((short)7).setCellValue(bs.getString("gst_due"));
                    }
                    
                    if(i==5){
                    row5.createCell((short)0).setCellValue(bs.getString("installment"));
                    row5.createCell((short)1).setCellValue(bs.getString("ref_no"));
                    row5.createCell((short)2).setCellValue(bs.getString("date"));
                    row5.createCell((short)3).setCellValue(bs.getString("amount_received"));
                    row5.createCell((short)4).setCellValue(bs.getString("proj_amount"));
                    row5.createCell((short)5).setCellValue(bs.getString("gst"));
                    row5.createCell((short)6).setCellValue(bs.getString("tds"));
                    row5.createCell((short)7).setCellValue(bs.getString("gst_due"));
                    }
                    
                    if(i==6){
                    row6.createCell((short)0).setCellValue(bs.getString("installment"));
                    row6.createCell((short)1).setCellValue(bs.getString("ref_no"));
                    row6.createCell((short)2).setCellValue(bs.getString("date"));
                    row6.createCell((short)3).setCellValue(bs.getString("amount_received"));
                    row6.createCell((short)4).setCellValue(bs.getString("proj_amount"));
                    row6.createCell((short)5).setCellValue(bs.getString("gst"));
                    row6.createCell((short)6).setCellValue(bs.getString("tds"));
                    row6.createCell((short)7).setCellValue(bs.getString("gst_due"));
                    }
                    
                    if(i==7){
                    row7.createCell((short)0).setCellValue(bs.getString("installment"));
                    row7.createCell((short)1).setCellValue(bs.getString("ref_no"));
                    row7.createCell((short)2).setCellValue(bs.getString("date"));
                    row7.createCell((short)3).setCellValue(bs.getString("amount_received"));
                    row7.createCell((short)4).setCellValue(bs.getString("proj_amount"));
                    row7.createCell((short)5).setCellValue(bs.getString("gst"));
                    row7.createCell((short)6).setCellValue(bs.getString("tds"));
                    row7.createCell((short)7).setCellValue(bs.getString("gst_due"));
                    }
                    
                    if(i==8){
                    row8.createCell((short)0).setCellValue(bs.getString("installment"));
                    row8.createCell((short)1).setCellValue(bs.getString("ref_no"));
                    row8.createCell((short)2).setCellValue(bs.getString("date"));
                    row8.createCell((short)3).setCellValue(bs.getString("amount_received"));
                    row8.createCell((short)4).setCellValue(bs.getString("proj_amount"));
                    row8.createCell((short)5).setCellValue(bs.getString("gst"));
                    row8.createCell((short)6).setCellValue(bs.getString("tds"));
                    row8.createCell((short)7).setCellValue(bs.getString("gst_due"));
                    }
                    
                    if(i==9){
                    row9.createCell((short)0).setCellValue(bs.getString("installment"));
                    row9.createCell((short)1).setCellValue(bs.getString("ref_no"));
                    row9.createCell((short)2).setCellValue(bs.getString("date"));
                    row9.createCell((short)3).setCellValue(bs.getString("amount_received"));
                    row9.createCell((short)4).setCellValue(bs.getString("proj_amount"));
                    row9.createCell((short)5).setCellValue(bs.getString("gst"));
                    row9.createCell((short)6).setCellValue(bs.getString("tds"));
                    row9.createCell((short)7).setCellValue(bs.getString("gst_due"));
                    }
                    
                    if(i==10){
                    row10.createCell((short)0).setCellValue(bs.getString("installment"));
                    row10.createCell((short)1).setCellValue(bs.getString("ref_no"));
                    row10.createCell((short)2).setCellValue(bs.getString("date"));
                    row10.createCell((short)3).setCellValue(bs.getString("amount_received"));
                    row10.createCell((short)4).setCellValue(bs.getString("proj_amount"));
                    row10.createCell((short)5).setCellValue(bs.getString("gst"));
                    row10.createCell((short)6).setCellValue(bs.getString("tds"));
                    row10.createCell((short)7).setCellValue(bs.getString("gst_due"));
                    }
                    
                    if(1==4){
                    row4.createCell((short)0).setCellValue(bs.getString("installment"));
                    row4.createCell((short)1).setCellValue(bs.getString("ref_no"));
                    row4.createCell((short)2).setCellValue(bs.getString("date"));
                    row4.createCell((short)3).setCellValue(bs.getString("amount_received"));
                    row4.createCell((short)4).setCellValue(bs.getString("proj_amount"));
                    row4.createCell((short)5).setCellValue(bs.getString("gst"));
                    row4.createCell((short)6).setCellValue(bs.getString("tds"));
                    row4.createCell((short)7).setCellValue(bs.getString("gst_due"));
                    }
                    
                    i++;
                         }
                     }
                     rs.close();
                     bs.close();
                     co.close();

                                       
                
                FileOutputStream fileout = new FileOutputStream("D:\\"+projectnum+".xls");
                wb.write(fileout);
                fileout.close();
        
        
            } catch(Exception ex){
                out.println(ex);
            }
        %>
    </body>
</html>
