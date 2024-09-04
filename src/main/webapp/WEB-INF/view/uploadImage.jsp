<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Upload Image</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.3.3/css/bootstrap.min.css">
    <style>
        body {
            background-color: #000; /* Black background */
            color: #fff; /* White text color */
            padding: 20px;
        }
        h1 {
            color: #D4AF37; /* Gold color for heading */
            margin-bottom: 20px;
        }
        form {
            background-color: #333; /* Dark grey background for form */
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3); /* Subtle shadow */
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            color: #D4AF37; /* Gold color for labels */
        }
        input[type="text"], textarea, input[type="file"] {
            background-color: #444; /* Slightly lighter grey background for form inputs */
            color: #fff; /* White text color */
            border: 1px solid #D4AF37; /* Gold border */
            border-radius: 4px;
            padding: 10px;
            width: 100%;
        }
        input[type="submit"] {
            background-color: #D4AF37; /* Gold color for submit button */
            border: none;
            color: #000; /* Black text color */
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 4px;
        }
        input[type="submit"]:hover {
            background-color: #b09f3f; /* Slightly darker gold for hover */
        }
        a {
            color: #D4AF37; /* Gold color for links */
            text-decoration: none;
            margin-top: 20px;
            display: inline-block;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h1>Upload New Image</h1>
    <form action="gallery" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label for="title">Title:</label>
            <input type="text" id="title" name="title" required>
        </div>
        <div class="form-group">
            <label for="description">Description:</label>
            <textarea id="description" name="description" required></textarea>
        </div>
        <div class="form-group">
            <label for="image">Image:</label>
            <input type="file" id="image" name="image" required>
        </div>
        <div class="form-group">
            <input type="submit" value="Upload Image">
        </div>
        <input type="hidden" name="action" value="upload">
    </form>
    <a href="gallery?action=list">Back to Gallery List</a>

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.3/js/bootstrap.bundle.min.js"></script>
</body>
</html>
