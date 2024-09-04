<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Image</title>
    <link rel="stylesheet" href="<c:url value='/css/style.css' />">
    <style>
        body {
            background-color: #000; /* Black background */
            color: #FFD700; /* Gold text color */
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        h1 {
            text-align: center;
            color: #FFD700; /* Gold color */
            margin-top: 50px;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            background-color: #333; /* Dark grey background for the form container */
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(255, 215, 0, 0.5); /* Gold shadow for the container */
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            display: block;
            color: #FFD700; /* Gold color for labels */
            margin-bottom: 5px;
        }
        .form-group input, 
        .form-group textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #444; /* Dark grey border */
            border-radius: 5px;
            background-color: #000; /* Black background */
            color: #FFD700; /* Gold text color */
        }
        .form-group input[type="file"] {
            padding: 0; /* Remove padding for file input */
        }
        .form-group input[type="submit"] {
            background-color: #FFD700; /* Gold button */
            border: none;
            color: #000; /* Black text color */
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        .form-group input[type="submit"]:hover {
            background-color: #E6BE8A; /* Slightly darker gold for hover */
        }
        .form-group img {
            margin-top: 10px;
            border: 2px solid #FFD700; /* Gold border for the image */
            border-radius: 5px;
        }
        a {
            color: #FFD700; /* Gold color for links */
            text-decoration: none;
            display: block;
            text-align: center;
            margin-top: 20px;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Edit Image</h1>
        <form action="gallery" method="post" enctype="multipart/form-data">
            <input type="hidden" name="id" value="${image.id}">
            <div class="form-group">
                <label for="title">Title:</label>
                <input type="text" id="title" name="title" value="${image.title}" required>
            </div>
            <div class="form-group">
                <label for="description">Description:</label>
                <textarea id="description" name="description" required>${image.description}</textarea>
            </div>
            <div class="form-group">
                <label for="image">Image:</label>
                <input type="file" id="image" name="image">
                <img src="${pageContext.request.contextPath}/${image.imageUrl}" alt="${image.title}" width="100">
            </div>
            <div class="form-group">
                <input type="submit" value="Update Image">
            </div>
            <input type="hidden" name="action" value="update">
        </form>
        <a href="gallery?action=list">Back to Gallery List</a>
    </div>
</body>
</html>
