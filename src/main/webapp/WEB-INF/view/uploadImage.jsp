<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Upload Image</title>
    <link rel="stylesheet" href="<c:url value='/css/style.css' />">
</head>
<body>
    <h1>Upload New Image</h1>
    <form action="gallery" method="post" enctype="multipart/form-data">
        <div>
            <label for="title">Title:</label>
            <input type="text" id="title" name="title" required>
        </div>
        <div>
            <label for="description">Description:</label>
            <textarea id="description" name="description" required></textarea>
        </div>
        <div>
            <label for="image">Image:</label>
            <input type="file" id="image" name="image" required>
        </div>
        <div>
            <input type="submit" value="Upload Image">
        </div>
        <input type="hidden" name="action" value="upload">
    </form>
    <a href="gallery?action=list">Back to Gallery List</a>
</body>
</html>
