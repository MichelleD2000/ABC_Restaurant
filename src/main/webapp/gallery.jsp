<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gallery</title>
    <link rel="stylesheet" href="<c:url value='/css/style.css' />">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #000; /* Black background */
            color: #fff; /* White text color */
        }

        h1 {
            font-size: 48px;
            font-weight: bold;
            color: #D4AF37; /* Gold color */
            margin-top: 70px;
            text-align: center;
            font-family: 'Arial', sans-serif;
        }

        .gallery-header {
            background: url('/path/to/your/background-image.jpg') no-repeat center center/cover;
            padding: 100px 0;
            color: #fff; /* White text color */
            text-align: center;
            background-color: #000; /* Black background for header */
        }

        .breadcrumb {
            margin: 20px 0;
            font-size: 16px;
            color: #D4AF37; /* Gold color */
            text-align: center;
        }

        .breadcrumb a {
            color: #D4AF37; /* Gold color */
            text-decoration: none;
        }

        .breadcrumb a:hover {
            text-decoration: underline;
        }

        .gallery-categories {
            margin: 40px 0;
            text-align: center;
            font-size: 18px;
        }

        .gallery-categories a {
            margin: 0 15px;
            color: #D4AF37; /* Gold color */
            text-decoration: none;
        }

        .gallery-categories a:hover {
            text-decoration: underline;
        }

        .gallery {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 30px;
            padding: 20px;
        }

        .gallery-item {
            background-color: #222; /* Dark grey background */
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.5); /* Darker shadow */
            padding: 15px;
            max-width: 300px;
            text-align: center;
            border-radius: 10px;
        }

        .gallery-item img {
            width: 100%;
            border-radius: 10px;
            border: 2px solid #D4AF37; /* Gold border */
        }

        .gallery-item h3 {
            margin-top: 15px;
            color: #D4AF37; /* Gold color */
            font-size: 22px;
        }

        .gallery-item p {
            margin: 10px 0;
            color: #ccc; /* Light grey color */
        }
    </style>
</head>

<body>

    <jsp:include page="./nav.jsp" />

   <div class="gallery-header">
        <h1>Gallery</h1>
        <div class="breadcrumb">
            <a href="home.jsp">Home</a> &gt; Gallery
        </div>
    </div>

    <div class="gallery">
        <c:forEach var="image" items="${images}">
            <div class="gallery-item">
                <img src="${pageContext.request.contextPath}/${image.imageUrl}" alt="${image.title}">
                <h3>${image.title}</h3>
                <p>${image.description}</p>
            </div>
        </c:forEach>
    </div>

</body>
</html>
