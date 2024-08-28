package com.abc.controller;

import com.abc.model.GalleryImage;
import com.abc.service.GalleryService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/gallery")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 10,      // 10MB
                 maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class GalleryController extends HttpServlet {
    private GalleryService galleryService;

    @Override
    public void init() throws ServletException {
        galleryService = GalleryService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        try {
            switch (action) {
                case "list":
                    listImages(request, response);
                    break;
                case "delete":
                    deleteImage(request, response);
                    break;
                case "edit":
                    showEditForm(request, response);
                    break;
                case "upload":
                    redirectToUploadPage(request, response);
                    break;
                case "view":
                    showImageDetails(request, response);
                    break;
                case "gallery":  // New action to display images in gallery.jsp
                    showGalleryView(request, response);
                    break;
                default:
                    listImages(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }
    
    
    private void showGalleryView(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<GalleryImage> images = galleryService.getAllImages();
        request.setAttribute("images", images);  // Make sure "images" is used here
        RequestDispatcher dispatcher = request.getRequestDispatcher("gallery.jsp");
        dispatcher.forward(request, response);
    }

    
    
    private void listImages(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<GalleryImage> images = galleryService.getAllImages();
        request.setAttribute("images", images);
        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/view/listGallery.jsp");
        dispatcher.forward(request, response);
    }

    private void deleteImage(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        galleryService.deleteImage(id);
        response.sendRedirect("gallery?action=list");
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        GalleryImage image = galleryService.getImageById(id);
        request.setAttribute("image", image);
        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/view/editGallery.jsp");
        dispatcher.forward(request, response);
    }

    private void redirectToUploadPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/view/uploadImage.jsp");
        dispatcher.forward(request, response);
    }

    private void showImageDetails(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        GalleryImage image = galleryService.getImageById(id);
        request.setAttribute("image", image);
        RequestDispatcher dispatcher = request.getRequestDispatcher("gallery.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        try {
            if ("update".equals(action)) {
                updateImage(request, response); // Handle image update
            } else {
                addImage(request, response); // Handle new image upload
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void addImage(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        String title = request.getParameter("title");
        String description = request.getParameter("description");

        Part filePart = request.getPart("image");
        if (filePart != null && filePart.getSize() > 0) {
            String fileName = extractFileName(filePart);
            String uploadPath = getServletContext().getRealPath("/") + "uploads" + File.separator + fileName;
            File fileSaveDir = new File(uploadPath);
            fileSaveDir.getParentFile().mkdirs();
            filePart.write(uploadPath);

            GalleryImage newImage = new GalleryImage();
            newImage.setTitle(title);
            newImage.setDescription(description);
            newImage.setImageUrl("uploads/" + fileName);

            galleryService.addImage(newImage);
        }
        response.sendRedirect("gallery?action=list");
    }

    private void updateImage(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        String description = request.getParameter("description");

        GalleryImage image = galleryService.getImageById(id);

        Part filePart = request.getPart("image");
        if (filePart != null && filePart.getSize() > 0) {
            String fileName = extractFileName(filePart);
            String uploadPath = getServletContext().getRealPath("/") + "uploads" + File.separator + fileName;
            File fileSaveDir = new File(uploadPath);
            fileSaveDir.getParentFile().mkdirs();
            filePart.write(uploadPath);
            image.setImageUrl("uploads/" + fileName);
        }

        image.setTitle(title);
        image.setDescription(description);

        galleryService.updateImage(image);
        response.sendRedirect("gallery?action=list");
    }

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1).replace("\"", "");
            }
        }
        return "";
    }
}
