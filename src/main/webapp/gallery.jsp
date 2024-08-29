<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gallery</title>
    <link rel="stylesheet" href="<c:url value='/css/style.css' />">
</head>
<body>
    <h1>Gallery</h1>
    <div class="gallery">
        <c:forEach var="image" items="${images}">
            <div class="gallery-item">
                <img src="${pageContext.request.contextPath}/${image.imageUrl}" alt="${image.title}" width="300">
                <h3>${image.title}</h3>
                <p>${image.description}</p>
            </div>
        </c:forEach>
    </div>
    
</body>
</html>
