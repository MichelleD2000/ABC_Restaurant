package com.abc.dao;

import com.abc.model.GalleryImage;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class GalleryDAO {

    // Retrieve all images from the gallery
    public List<GalleryImage> getAllImages() throws SQLException {
        List<GalleryImage> imageList = new ArrayList<>();
        String query = "SELECT * FROM gallery";
        try (Connection connection = DBConnection.getInstance().getConnection();
             PreparedStatement statement = connection.prepareStatement(query);
             ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String title = resultSet.getString("title");
                String description = resultSet.getString("description");
                String imageUrl = resultSet.getString("imageUrl");
                imageList.add(new GalleryImage(id, title, description, imageUrl));
            }
        }
        return imageList;
    }

    // Add a new image to the gallery
    public void addImage(GalleryImage image) throws SQLException {
        String query = "INSERT INTO gallery (title, description, imageUrl) VALUES (?, ?, ?)";
        try (Connection connection = DBConnection.getInstance().getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, image.getTitle());
            statement.setString(2, image.getDescription());
            statement.setString(3, image.getImageUrl());
            statement.executeUpdate();
        }
    }

    // Delete an image from the gallery by its ID
    public void deleteImage(int id) throws SQLException {
        String query = "DELETE FROM gallery WHERE id = ?";
        try (Connection connection = DBConnection.getInstance().getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, id);
            statement.executeUpdate();
        }
    }

    // Retrieve an image by its ID
    public GalleryImage getImageById(int id) throws SQLException {
        String query = "SELECT * FROM gallery WHERE id = ?";
        try (Connection connection = DBConnection.getInstance().getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, id);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    String title = resultSet.getString("title");
                    String description = resultSet.getString("description");
                    String imageUrl = resultSet.getString("imageUrl");
                    return new GalleryImage(id, title, description, imageUrl);
                }
            }
        }
        return null;
    }

    // Update an existing image in the gallery
    public void updateImage(GalleryImage image) throws SQLException {
        String query = "UPDATE gallery SET title = ?, description = ?, imageUrl = ? WHERE id = ?";
        try (Connection connection = DBConnection.getInstance().getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, image.getTitle());
            statement.setString(2, image.getDescription());
            statement.setString(3, image.getImageUrl());
            statement.setInt(4, image.getId());
            statement.executeUpdate();
        }
    }
}