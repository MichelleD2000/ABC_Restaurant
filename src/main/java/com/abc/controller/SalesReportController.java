package com.abc.controller;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.abc.model.SalesData;
import com.abc.service.OrderService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

@WebServlet("/downloadSalesReport")
public class SalesReportController extends HttpServlet {

    private OrderService orderService;

    @Override
    public void init() throws ServletException {
        orderService = OrderService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=SalesReport.pdf");

        try {
            OutputStream out = response.getOutputStream();
            Document document = new Document();
            PdfWriter.getInstance(document, out);
            document.open();

            // Add title
            Font fontTitle = new Font(Font.FontFamily.TIMES_ROMAN, 18, Font.BOLD);
            Paragraph title = new Paragraph("Sales Report", fontTitle);
            title.setAlignment(Element.ALIGN_CENTER);
            document.add(title);

            // Add a line break
            document.add(new Paragraph("\n"));

            // Add a table with 4 columns
            PdfPTable table = new PdfPTable(4);
            table.setWidthPercentage(100); // Full width
            table.setSpacingBefore(10f);   // Space before table
            table.setSpacingAfter(10f);    // Space after table

            // Set column widths (optional)
            float[] columnWidths = {2f, 2f, 3f, 2f};
            table.setWidths(columnWidths);

            // Set column titles
            addTableHeader(table);

            // Fetch data from the database
            List<SalesData> salesDataList = orderService.getSalesData();

            // Add data to the table
            for (SalesData data : salesDataList) {
                addTableCell(table, data.getDate(), Element.ALIGN_CENTER);
                addTableCell(table, String.valueOf(data.getTotalOrders()), Element.ALIGN_CENTER);

                // Display only the name of the best-selling item
                String bestSellingItem = (data.getBestSellingItem() != null && !data.getBestSellingItem().isEmpty())
                        ? data.getBestSellingItem().split("\\s+")[0] // Only first word
                        : "N/A";
                addTableCell(table, bestSellingItem, Element.ALIGN_CENTER);

                addTableCell(table, String.valueOf(data.getTotalDailyIncome()), Element.ALIGN_RIGHT);
            }

            document.add(table);
            document.close();
        } catch (DocumentException e) {
            e.printStackTrace();
        }
    }

    private void addTableHeader(PdfPTable table) {
        Font fontHeader = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.BOLD);
        PdfPCell header;

        // Header Cell for Date
        header = new PdfPCell(new Phrase("Date", fontHeader));
        styleHeaderCell(header);
        table.addCell(header);

        // Header Cell for Total Orders
        header = new PdfPCell(new Phrase("Total Orders", fontHeader));
        styleHeaderCell(header);
        table.addCell(header);

        // Header Cell for Best-selling Item
        header = new PdfPCell(new Phrase("Best-selling Item", fontHeader));
        styleHeaderCell(header);
        table.addCell(header);

        // Header Cell for Total Daily Income
        header = new PdfPCell(new Phrase("Total Daily Income", fontHeader));
        styleHeaderCell(header);
        table.addCell(header);
    }

    private void addTableCell(PdfPTable table, String text, int alignment) {
        Font fontCell = new Font(Font.FontFamily.TIMES_ROMAN, 12);
        PdfPCell cell = new PdfPCell(new Phrase(text, fontCell));
        cell.setPadding(8);
        cell.setHorizontalAlignment(alignment);
        cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
        table.addCell(cell);
    }

    private void styleHeaderCell(PdfPCell cell) {
        cell.setPadding(8);
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
        cell.setBackgroundColor(new com.itextpdf.text.BaseColor(200, 200, 200)); // Light gray background
    }
}
