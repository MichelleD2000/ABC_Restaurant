package com.abc.service;

import com.abc.dao.GalleryDAO;
import com.abc.model.GalleryImage;

import java.sql.SQLException;
import java.util.List;

public class GalleryService {
    private static GalleryService instance;
    private final GalleryDAO galleryDAO;

    private GalleryService() {
        galleryDAO = new GalleryDAO();
    }

    public static GalleryService getInstance() {
        if (instance == null) {
            instance = new GalleryService();
        }
        return instance;
    }

    public List<GalleryImage> getAllImages() throws SQLException {
        return galleryDAO.getAllImages();
    }

    public void addImage(GalleryImage image) throws SQLException {
        galleryDAO.addImage(image);
    }

    public void deleteImage(int id) throws SQLException {
        galleryDAO.deleteImage(id);
    }

    public GalleryImage getImageById(int id) throws SQLException {
        return galleryDAO.getImageById(id);
    }

    public void updateImage(GalleryImage image) throws SQLException {
        galleryDAO.updateImage(image);
    }
}
