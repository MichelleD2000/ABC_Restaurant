<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gallery List</title>
    <link rel="stylesheet" href="<c:url value='/css/style.css' />">
</head>
<body>
    <h1>Gallery List</h1>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Title</th>
            <th>Description</th>
            <th>Image</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="image" items="${images}">
            <tr>
                <td>${image.id}</td>
                <td>${image.title}</td>
                <td>${image.description}</td>
                <td><img src="${pageContext.request.contextPath}/${image.imageUrl}" alt="${image.title}" width="100"></td>
                <td>
                    <a href="gallery?action=edit&id=${image.id}">Edit</a> |
                    <a href="gallery?action=delete&id=${image.id}" onclick="return confirm('Are you sure you want to delete this image?');">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
    <a href="gallery?action=upload">Upload New Image</a>
</body>
</html>
