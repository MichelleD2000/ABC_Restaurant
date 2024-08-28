package com.abc.controller;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.abc.service.GalleryService;

@WebServlet("/gallery")
public class Gallery extends HttpServlet { 
    private static final long serialVersionUID = 1L;
    private GalleryService galleryService;

    @Override
    public void init() throws ServletException {
        galleryService = GalleryService.getInstance(); // Using Singleton pattern
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            request.setAttribute("images", galleryService.getAllImages());
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle the exception, e.g., forward to an error page or display an error message
        }
        
        request.getRequestDispatcher("gallery.jsp").forward(request, response);
    }
}
