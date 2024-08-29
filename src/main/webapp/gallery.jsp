<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Gallery</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="CSS/gallery.css">
</head>
<body>

    <jsp:include page="navigationbar.jsp" />

    <section class="gallery-section">
        <div class="container">
            <h1>Gallery</h1>

            <!-- Displaying the list of gallery images -->
            <div class="row">
                <c:forEach var="image" items="${images}">
                    <div class="col-lg-4 col-md-6 mb-4">
                        <div class="card">
                            <img src="${image.imageUrl}" alt="${image.title}" class="card-img-top">
                            <div class="card-body">
                                <h5 class="card-title">${image.title}</h5>
                                <p class="card-text">${image.description}</p>
                                <a href="imageGallery?action=delete&id=${image.id}" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this image?');">Delete</a>
                                <a href="imageGallery?action=edit&id=${image.id}" class="btn btn-primary">Edit</a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </section>
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="script.js"></script>
    
    <footer>
        <jsp:include page="footer.jsp" />
    </footer>
</body>
</html>
