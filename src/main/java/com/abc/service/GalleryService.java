package com.abc.service;

import com.abc.dao.GalleryDAO;
import com.abc.model.GalleryImage;

import java.sql.SQLException;
import java.util.List;

public class GalleryService {
    private static GalleryService instance;
    private GalleryDAO galleryDAO;

    private GalleryService() {
        galleryDAO = new GalleryDAO();
    }

    // Singleton pattern to ensure only one instance of GalleryService
    public static synchronized GalleryService getInstance() {
        if (instance == null) {
            instance = new GalleryService();
        }
        return instance;
    }

    // Retrieve all images from the database
    public List<GalleryImage> getAllImages() throws SQLException {
        return galleryDAO.getAllImages();
    }

    // Add a new image to the database
    public void addImage(GalleryImage image) throws SQLException {
        galleryDAO.addImage(image);
    }

    // Delete an image from the database by ID
    public void deleteImage(int id) throws SQLException {
        galleryDAO.deleteImage(id);
    }

    // Retrieve a specific image by ID
    public GalleryImage getImageById(int id) throws SQLException {
        return galleryDAO.getImageById(id);
    }

    // Update an existing image in the database
    public void updateImage(GalleryImage image) throws SQLException {
        galleryDAO.updateImage(image);
    }
}
