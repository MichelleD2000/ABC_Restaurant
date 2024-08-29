<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Image</title>
    <link rel="stylesheet" href="<c:url value='/css/style.css' />">
</head>
<body>
    <h1>Edit Image</h1>
    <form action="gallery" method="post" enctype="multipart/form-data">
        <input type="hidden" name="id" value="${image.id}">
        <div>
            <label for="title">Title:</label>
            <input type="text" id="title" name="title" value="${image.title}" required>
        </div>
        <div>
            <label for="description">Description:</label>
            <textarea id="description" name="description" required>${image.description}</textarea>
        </div>
        <div>
            <label for="image">Image:</label>
            <input type="file" id="image" name="image">
            <img src="${pageContext.request.contextPath}/${image.imageUrl}" alt="${image.title}" width="100">
        </div>
        <div>
            <input type="submit" value="Update Image">
        </div>
        <input type="hidden" name="action" value="update">
    </form>
    <a href="gallery?action=list">Back to Gallery List</a>
</body>
</html>
