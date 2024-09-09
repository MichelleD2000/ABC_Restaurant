package com.abc.controller;

import com.abc.model.Reservation;
import com.abc.service.ReservationService;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/downloadReservationsPdf")
public class ReservationPdfDownloadController extends HttpServlet {
    private ReservationService reservationService;

    @Override
    public void init() {
        reservationService = ReservationService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=reservations.pdf");

        try {
            Document document = new Document();
            PdfWriter.getInstance(document, response.getOutputStream());
            document.open();

            Font titleFont = new Font(Font.FontFamily.HELVETICA, 16, Font.BOLD);
            Paragraph title = new Paragraph("Reservations List", titleFont);
            title.setAlignment(Element.ALIGN_CENTER);
            document.add(title);

            document.add(new Paragraph("\n"));

            // Generate tables for each category of reservations
            generateReservationTable(document, "Accepted Reservations", "Accepted", BaseColor.BLACK);
            generateReservationTable(document, "Rejected Reservations", "Rejected", BaseColor.BLACK);
            generateReservationTable(document, "Pending Reservations", "Pending", BaseColor.BLACK);

            document.close();
        } catch (DocumentException e) {
            throw new IOException("Error generating PDF", e);
        }
    }

    private void generateReservationTable(Document document, String title, String status, BaseColor headerColor) throws DocumentException {
        Font headerFont = new Font(Font.FontFamily.HELVETICA, 12, Font.BOLD, BaseColor.WHITE); // White font for the header
        Font dataFont = new Font(Font.FontFamily.HELVETICA, 12);

        Paragraph tableTitle = new Paragraph(title, new Font(Font.FontFamily.HELVETICA, 14, Font.BOLD));
        document.add(tableTitle);
        document.add(new Paragraph("\n"));

        PdfPTable table = new PdfPTable(8); // 8 columns for the reservation data
        table.setWidthPercentage(100);
        table.setSpacingBefore(10f);
        table.setSpacingAfter(10f);

        addTableHeader(table, headerFont, headerColor); // Custom colored header

        List<Reservation> reservations = reservationService.getReservationsByStatus(status); // Fetch reservations by status
        addRows(table, reservations, dataFont);

        document.add(table);
    }

    private void addTableHeader(PdfPTable table, Font font, BaseColor backgroundColor) {
        PdfPCell cell = new PdfPCell();
        cell.setPadding(5);
        cell.setBackgroundColor(backgroundColor); // Set background color for header

        String[] headers = {"ID", "Date", "Time", "Guests", "Name", "Phone", "Email", "Status"};
        for (String header : headers) {
            cell.setPhrase(new Phrase(header, font));
            table.addCell(cell);
        }
    }

    private void addRows(PdfPTable table, List<Reservation> reservations, Font font) {
        for (Reservation reservation : reservations) {
            table.addCell(new Phrase(String.valueOf(reservation.getId()), font));
            table.addCell(new Phrase(reservation.getDate().toString(), font));
            table.addCell(new Phrase(reservation.getTime(), font));
            table.addCell(new Phrase(String.valueOf(reservation.getGuests()), font));
            table.addCell(new Phrase(reservation.getName(), font));
            table.addCell(new Phrase(reservation.getPhone(), font));
            table.addCell(new Phrase(reservation.getEmail(), font));
            table.addCell(new Phrase(reservation.getStatus(), font));
        }
    }
}
