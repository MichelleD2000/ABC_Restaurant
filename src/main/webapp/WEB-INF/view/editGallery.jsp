<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Image</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 50%;
            margin: auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-top: 50px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
        }
        .form-group input, .form-group textarea {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
        }
        .btn {
            background-color: #007BFF;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border: none;
            cursor: pointer;
        }
        .btn:hover {
            background-color: #0056b3;
        }
        .back-link {
            display: inline-block;
            margin-top: 15px;
            color: #333;
            text-decoration: none;
        }
        .back-link:hover {
            color: #007BFF;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Edit Image</h1>
    <form action="gallery?action=update" method="post" enctype="multipart/form-data">
        <input type="hidden" name="id" value="${image.id}">
        <div class="form-group">
            <label for="title">Title:</label>
            <input type="text" name="title" id="title" value="${image.title}" required>
        </div>
        <div class="form-group">
            <label for="description">Description:</label>
            <textarea name="description" id="description" required>${image.description}</textarea>
        </div>
        <div class="form-group">
            <label for="image">Current Image:</label>
            <img src="${image.imageUrl}" alt="${image.title}" style="max-width: 200px; display: block; margin-bottom: 10px;">
            <input type="file" name="image" id="image">
            <small>If you don't want to change the image, leave this blank.</small>
        </div>
        <button type="submit" class="btn">Update Image</button>
    </form>
    <a class="back-link" href="gallery?action=list">Back to Gallery</a>
</div>
</body>
</html>
