<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Gallery</title>
    <jsp:include page="./navigationbar.jsp" />
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            color: #fff;
            background: url('') no-repeat center center fixed;
            background-size: cover;
        }

        .container {
            max-width: 500px;
            margin: 100px auto;
            background-color: rgba(0, 0, 0, 0.8);
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.5);
            margin-top:120px;
        }

        h1 {
            font-size: 36px;
            margin-bottom: 20px;
            color: #ffd700;
            text-align: center;
        }

        .gallery {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
        }

        .gallery-item {
            max-width: 300px;
            margin-bottom: 20px;
            text-align: center;
        }

        .gallery-item img {
            max-width: 100%;
            height: auto;
            border-radius: 8px;
            box-shadow: 0px 0px 10px rgba(255, 215, 0, 0.5);
        }

        .gallery-item p {
            font-size: 18px;
            margin-top: 10px;
            color: #fff;
        }

        footer {
            margin-top: 20px;
            text-align: center;
            color: #ddd;
        }
    </style>
</head>
<body>
   <div class="container">
        <h1>Gallery</h1>
        <div class="gallery">
            <c:forEach var="image" items="${images}">
                <div class="gallery-item">
                    <img src="${image.imageUrl}" alt="${image.title}">
                    <p>${image.title}</p>
                    <p>${image.description}</p>
                </div>
            </c:forEach>
        </div>
    </div>
</body>
</html>
