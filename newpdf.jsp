<%-- 
    Document   : jsppdf
    Created on : May 31, 2018, 12:12:59 PM
    Author     : Neha
--%>
<%@page import="com.itextpdf.text.pdf.FontSelector"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.itextpdf.text.pdf.ColumnText"%>
<%@page import="com.itextpdf.text.pdf.ColumnText"%>
<%@page import="com.itextpdf.text.pdf.PdfPageEventHelper"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="com.itextpdf.text.*"%>
<%@page import="com.itextpdf.text.pdf.PdfPCell"%>
<%@page import="com.itextpdf.text.Element"%>
<%@page import="com.itextpdf.text.Paragraph"%>
<%@page import="com.itextpdf.text.PageSize"%>
<%@page import="com.itextpdf.text.pdf.BaseFont"%>
<%@page import="com.itextpdf.text.pdf.PdfContentByte"%>
<%@page import="com.itextpdf.text.DocumentException"%>
<%@page import="com.itextpdf.text.Document"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="com.itextpdf.text.pdf.PdfPTable"%>

<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="java.util.*"%>
<%@page import="java.io.DataOutputStream"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@ page trimDirectiveWhitespaces="true" %> 
        <%@ page import="java.sql.*" %> 
        
        
        
        
        
        
        <%
            response.setContentType("application/pdf");
            Document document = new Document(PageSize.A4) ;
            
            try
            {       
                String type = session.getAttribute("type").toString();
                String age = session.getAttribute("age").toString() ;
                String projectnum = session.getAttribute("projnumber").toString();
                
                SimpleDateFormat sm = new SimpleDateFormat("dd-MM-yyyy");
                SimpleDateFormat su = new SimpleDateFormat("yyyy-MM-dd");
                
                ByteArrayOutputStream buffer = new ByteArrayOutputStream();
                PdfWriter writer = PdfWriter.getInstance(document , buffer); 
                document.open();
                float[] columnWidths = {1, 9, 9};
                PdfPTable table = new PdfPTable(columnWidths);
                table.setWidthPercentage(100);
                int pwidth = 19;

                Rectangle rectangle = new Rectangle(30, 30, 550, 800);
                writer.setBoxSize("rectangle", rectangle);
                
                Class.forName("com.mysql.jdbc.Driver");
                Connection co = DriverManager.getConnection("jdbc:mysql://localhost:3306/onepage", "root", "admin");
                Statement st = co.createStatement();
                Statement s = co.createStatement();
                Statement stmt = co.createStatement();
                Statement stmtp = co.createStatement();
                Statement stmtgd = co.createStatement();
                Statement stmtg = co.createStatement();
                Statement stmtt = co.createStatement();
                String q = "select * from paymentdetails where project_number='"+projectnum+"';";
                String query = "select * from projdetails where project_number='"+projectnum+"';";
                String sumamt = "select sum(amount_received) as amtsum from paymentdetails where project_number='"+projectnum+"';";
                String sumproj = "select sum(proj_amount)  as projsum from paymentdetails where project_number='"+projectnum+"';";
                String sumgstdue = "select sum(gst_due) as gstduesum from paymentdetails where project_number='"+projectnum+"';";
                String sumgst = "select sum(gst) as gstsum from paymentdetails where project_number='"+projectnum+"';";
                String sumtds = "select sum(tds) as tdssum from paymentdetails where project_number='"+projectnum+"';";
                
                ResultSet rs= st.executeQuery(query);
                ResultSet r = s.executeQuery(q);
                ResultSet ramt = stmt.executeQuery(sumamt);
                ResultSet rproj = stmtp.executeQuery(sumproj);
                ResultSet rgstdue = stmtgd.executeQuery(sumgstdue);
                ResultSet rgst = stmtg.executeQuery(sumgst);
                ResultSet rtds = stmtt.executeQuery(sumtds);
                
                
                ramt.next();
                rproj.next();
                rgst.next();
                rgstdue.next();
                rtds.next();
                
                String[] install = new String[8];
            
                install[0]="First";
                install[1]="Second";
                install[2]="Third";
                install[3]="Fourth";
                install[4]="Fifth";
                install[5]="Sixth";
                install[6]="Seventh";
                install[7]="Eighth";
                
                Paragraph para=new Paragraph("Project Planning and Business Development \n");
                Paragraph space=new Paragraph(" ");
                Paragraph title=new Paragraph(age+" "+type+" Project \n");
                
                title.setAlignment(Element.ALIGN_CENTER);
                
                para.setAlignment(Element.ALIGN_CENTER);
                document.add(para);
                document.add(title);
                document.add(space);
                
                FontSelector selector1 = new FontSelector();
                Font f1 = FontFactory.getFont(FontFactory.TIMES_ROMAN, 10);
                selector1.addFont(f1);
                
                if(type.equals("Grant-In-Aid")){
                
                rs.next();
                
                    table.addCell("1");
                    table.addCell("Project title");
                    table.addCell(rs.getString("project_title"));
                    table.addCell("2");
                    table.addCell("Project Number");
                    table.addCell(rs.getString("project_number"));
                    table.addCell("3");
                    table.addCell("Project Leader and Division");
                    table.addCell(rs.getString("project_leader_and_division"));
                    table.addCell("4");
                    table.addCell("Supervisor");
                    table.addCell(rs.getString("supervisor"));
                    table.addCell("5");
                    table.addCell("Project Cost");
                    table.addCell("Rs." + rs.getString("project_cost"));
                    table.addCell("6");
                    table.addCell("Revised Project cost");
                    table.addCell("Rs." + rs.getString("revised_project_cost"));
                    table.addCell("7");
                    table.addCell("Client Details");
                    table.addCell(rs.getString("client_details"));
                    table.addCell("8");
                    table.addCell("Contact Person & Designation");
                    table.addCell(rs.getString("contact"));
                    table.addCell("9");
                    table.addCell("Date of Signing Agreement");
                    table.addCell(sm.format(su.parse(rs.getString("date_of_signing"))));
                    table.addCell("10");
                    table.addCell("Date of Commencement");
                    table.addCell(sm.format(su.parse(rs.getString("start_date"))));
                    table.addCell("11");
                    table.addCell("Project Duration");
                    table.addCell(rs.getString("project_duration") + " months");
                    table.addCell("12");
                    table.addCell("Financial Arrangement");
                    table.addCell(rs.getString("financial_arrangement"));
                    table.addCell("13");
                    table.addCell("Project Extension");
                    table.addCell(rs.getString("project_extension"));
                    table.addCell("14");
                    table.addCell("Details of Accord of Financial Approval and Sanction of Grant");
                    table.addCell(rs.getString("details_of_accord"));
        
                  
        PdfPTable innerTable1 = new PdfPTable(8);
        PdfPCell innercell = new PdfPCell();
        innercell.setColspan(8);
        Paragraph paragraph = new Paragraph("Payment Details");
        paragraph.setAlignment(Element.ALIGN_CENTER);
        innercell.addElement( paragraph );
        
        PdfPCell innercell1 = new PdfPCell();
        innercell1.setColspan(3);
        Paragraph paragraph1 = new Paragraph("Total Amount received as on date");
        paragraph1.setAlignment(Element.ALIGN_CENTER);
        innercell1.addElement( paragraph1 );
        
        
        
        innerTable1.setWidths(new float[] { 75,75,75,80,80,65,65,65 });
        innerTable1.addCell(innercell);
        innerTable1.addCell("Installment");
        innerTable1.addCell("Bank details and Reference number");
        innerTable1.addCell("Date");
        innerTable1.addCell("Amount received (in Rs.)");
        innerTable1.addCell("Project amount (in Rs.)");
        innerTable1.addCell("GST (in Rs.)");
        innerTable1.addCell("TDS (in Rs.)");
        innerTable1.addCell("GST Due (in Rs.)");
        
//        PdfPCell innercell2 = new PdfPCell();
//        innercell2.setColspan(3);
//        innerTable1.addCell(innercell2);
//        innercell2.addElement("Total Amount received as on date");
//        
        
        
        while(r.next()){
            if(r.getString("ref_no").equals("finish")){break;}
            
            else{
            innerTable1.addCell(install[r.getInt("installment")-1]);
            innerTable1.addCell(r.getString("ref_no"));
            innerTable1.addCell(sm.format(su.parse(r.getString("date"))));
            innerTable1.addCell(r.getString("amount_received"));
            innerTable1.addCell(r.getString("proj_amount"));
            innerTable1.addCell(r.getString("gst"));
            innerTable1.addCell(r.getString("tds"));
            innerTable1.addCell(r.getString("gst_due"));
            }
        }
        
        innerTable1.addCell(innercell1);
        innerTable1.addCell(ramt.getString("amtsum"));
        innerTable1.addCell(rproj.getString("projsum"));
        innerTable1.addCell(rgst.getString("gstsum"));
        innerTable1.addCell(rtds.getString("tdssum"));
        innerTable1.addCell(rgstdue.getString("gstduesum"));
        
        
        PdfPCell cell;
        cell = new PdfPCell(innerTable1);
        cell.setColspan(3);
//        table.addCell("15");
        table.addCell(cell);
//        table.addCell("15");
        PdfPCell remarks = new PdfPCell() ;
        Paragraph rem = new Paragraph("Remarks");
        remarks.addElement(rem);
        remarks.setColspan(2);
        table.addCell(remarks);
        r.previous();
        table.addCell(r.getString("remarks"));
        cell.setColspan(3);
                }
                
                else{
                    rs.next();
                
                    table.addCell("1");
                    table.addCell("Project title");
                    table.addCell(rs.getString("project_title"));
                    table.addCell("2");
                    table.addCell("Project Number");
                    table.addCell(rs.getString("project_number"));
                    table.addCell("3");
                    table.addCell("Project Leader and Division");
                    table.addCell(rs.getString("project_leader_and_division"));
                    table.addCell("4");
                    table.addCell("Supervisor");
                    table.addCell(rs.getString("supervisor"));
                    table.addCell("5");
                    table.addCell("Project Cost");
                    table.addCell("Rs." +  rs.getString("project_cost"));
                    table.addCell("6");
                    table.addCell("Revised Project cost");
                    table.addCell("Rs." + rs.getString("revised_project_cost"));
                    table.addCell("7");
                    table.addCell("Client Details");
                    table.addCell(rs.getString("client_details"));
                    table.addCell("8");
                    table.addCell("Contact Person & Designation");
                    table.addCell(rs.getString("contact"));
                    table.addCell("9");
                    table.addCell("Date of Signing Agreement");
                    table.addCell(sm.format(su.parse(rs.getString("date_of_signing"))));
                    table.addCell("10");
                    table.addCell("Date of Commencement");
                    table.addCell(sm.format(su.parse((rs.getString("start_date")))));
                    table.addCell("11");
                    table.addCell("Project Duration");
                    table.addCell(rs.getString("project_duration") + " months");
                    table.addCell("12");
                    table.addCell("Financial Arrangement");
                    table.addCell(rs.getString("financial_arrangement"));
                    table.addCell("13");
                    table.addCell("Project Extension");
                    table.addCell(rs.getString("project_extension"));
                    
                  
        PdfPTable innerTable1 = new PdfPTable(8);
        PdfPCell innercell = new PdfPCell();
        innercell.setColspan(8);
        Paragraph paragraph = new Paragraph("Payment Details");
        paragraph.setAlignment(Element.ALIGN_CENTER);
        innercell.addElement( paragraph );
        
        PdfPCell innercell1 = new PdfPCell();
        innercell1.setColspan(3);
        Paragraph paragraph1 = new Paragraph("Total Amount received as on date");
        paragraph1.setAlignment(Element.ALIGN_CENTER);
        innercell1.addElement( paragraph1 );
        
        
        
        innerTable1.setWidths(new float[] { 75,75,75,75,75,57,75,75 });
        innerTable1.addCell(innercell);
        innerTable1.addCell("Installment");
        innerTable1.addCell("Bank details and Reference number");
        innerTable1.addCell("Date");
        innerTable1.addCell("Amount received (in Rs.)");
        innerTable1.addCell("Project amount (in Rs.)");
        innerTable1.addCell("GST (in Rs.)");
        innerTable1.addCell("TDS (in Rs.)");
        innerTable1.addCell("GST Due (in Rs.)");
        
//        PdfPCell innercell2 = new PdfPCell();
//        innercell2.setColspan(3);
//        innerTable1.addCell(innercell2);
//        innercell2.addElement("Total Amount received as on date");
//        
        
        
        while(r.next()){
            if(r.getString("ref_no").equals("finish")){break;}
            
            else{
            innerTable1.addCell(install[r.getInt("installment")-1]);
            innerTable1.addCell(r.getString("ref_no"));
            innerTable1.addCell(sm.format(su.parse(r.getString("date"))));
            innerTable1.addCell(r.getString("amount_received"));
            innerTable1.addCell(r.getString("proj_amount"));
            innerTable1.addCell(r.getString("gst"));
            innerTable1.addCell(r.getString("tds"));
            innerTable1.addCell(r.getString("gst_due"));
            }
        }
        
        innerTable1.addCell(innercell1);
        innerTable1.addCell(ramt.getString("amtsum"));
        innerTable1.addCell(rproj.getString("projsum"));
        innerTable1.addCell(rgst.getString("gstsum"));
        innerTable1.addCell(rtds.getString("tdssum"));
        innerTable1.addCell(rgstdue.getString("gstduesum"));
        
        
        PdfPCell cell;
        cell = new PdfPCell(innerTable1);
        cell.setColspan(3);
//        table.addCell("15");
        table.addCell(cell);
//        table.addCell("15");
        PdfPCell remarks = new PdfPCell() ;
        Paragraph rem = new Paragraph("Remarks");
        remarks.addElement(rem);
        remarks.setColspan(2);
        table.addCell(remarks);
        r.previous();
        table.addCell(r.getString("remarks"));
        cell.setColspan(3);        
                }
                
        
        java.util.Date dt=new java.util.Date();
        SimpleDateFormat format2 = new SimpleDateFormat("MMMMM dd, yyyy");
        String date="Date: "+ format2.format(dt) ;
        String sig = "Authorised Signatory" ;
        
        document.add(space);
        document.add(space);

        document.add(table);
        document.add(space);
        document.add(space);
        document.add(space);
        document.add(space);
        document.add(space);
        
        Paragraph pg= new Paragraph(sig);
        pg.setAlignment(Element.ALIGN_RIGHT);
        document.add(pg);
        ColumnText.showTextAligned(writer.getDirectContent(),
        Element.ALIGN_LEFT, new Phrase(date ),
        rectangle.getRight() /8, rectangle.getBottom()+40, 0);
        
        ColumnText.showTextAligned(writer.getDirectContent(),
        Element.ALIGN_CENTER, new Phrase("Copy to: 1.Sr.COA     2.COFA/FAO-with a request to send receipt to party"),
        rectangle.getRight() / 2, rectangle.getBottom()+15, 0);
        
        ColumnText.showTextAligned(writer.getDirectContent(),
        Element.ALIGN_CENTER, new Phrase("                      3.Project Leader  4.PPBD  5.GST Tax File  6.ERP & File copy(2 Nos.)"),
        rectangle.getRight() / 2, rectangle.getBottom(), 0);
 
                
         
         document.close(); 

                FileOutputStream fileout = new FileOutputStream("D:\\"+projectnum+".pdf");
                DataOutputStream dataOutput = new DataOutputStream(response.getOutputStream());
                byte[] bytes = buffer.toByteArray();
                response.setContentLength(bytes.length);
                for(int i = 0; i < bytes.length; i++){
                    dataOutput.writeByte(bytes[i]);
                    fileout.write(bytes[i]);
                }
                dataOutput.flush();
                dataOutput.close();
                fileout.flush();
                fileout.close();
                return;
                
            }
           

            catch(DocumentException e)
            {
                 e.printStackTrace();
            }

%>
    </body>
</html>
