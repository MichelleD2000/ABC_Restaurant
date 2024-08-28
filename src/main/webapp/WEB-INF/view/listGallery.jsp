<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Gallery List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 80%;
            margin: auto;
            overflow: hidden;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: left;
        }
        th {
            background-color: #f4f4f4;
        }
        img {
            max-width: 150px;
            height: auto;
        }
        a {
            text-decoration: none;
            color: #333;
        }
        a:hover {
            color: #007BFF;
        }
        .header {
            background-color: #007BFF;
            color: white;
            padding: 15px;
            text-align: center;
        }
        .header a {
            color: white;
        }
        .btn, .btn-delete {
            padding: 8px 16px;
            margin: 4px;
            color: white;
            text-decoration: none;
            border-radius: 4px;
        }
        .btn {
            background-color: #007BFF;
        }
        .btn-delete {
            background-color: #FF4136;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Gallery</h1>
        <a href="gallery?action=upload">Upload New Image</a>
    </div>

    <div class="container">
        <table>
            <thead>
                <tr>
                    <th>Image</th>
                    <th>Title</th>
                    <th>Description</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="image" items="${images}">
                    <tr>
                        <td><img src="${image.imageUrl}" alt="${image.title}" /></td>
                        <td>${image.title}</td>
                        <td>${image.description}</td>
                        <td>
                            <a href="gallery?action=edit&id=${image.id}" class="btn">Edit</a>
                            <a href="gallery?action=delete&id=${image.id}" class="btn-delete" onclick="return confirm('Are you sure you want to delete this image?');">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
