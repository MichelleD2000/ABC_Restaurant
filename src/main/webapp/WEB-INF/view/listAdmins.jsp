<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        body {
            background-color: #000; /* Black background for the page */
            color: #fff; /* White text color */
            font-family: Arial, sans-serif;
        }
        h1 {
            color: #D4AF37; /* Gold color for the heading */
            text-align: center;
            margin-top: 30px;
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 0 auto;
            background-color: #222; /* Dark grey background for the table */
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(212, 175, 55, 0.5); /* Gold shadow for the table */
        }
        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #444; /* Dark grey border */
        }
        th {
            background-color: #333; /* Dark grey background for headers */
            color: #D4AF37; /* Gold color for headers */
        }
        tr:nth-child(even) {
            background-color: #444; /* Dark grey background for even rows */
        }
        a {
            color: #D4AF37; /* Gold color for links */
            text-decoration: none;
            padding: 5px;
            border-radius: 5px;
        }
        a:hover {
            background-color: #b09f3f; /* Slightly darker gold for hover effect */
            color: #fff; /* White color on hover */
        }
        .btn-container {
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <h1>Admin List</h1>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Username</th>
                <th>Email</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="admin" items="${admins}">
                <tr>
                    <td>${admin.adminId}</td>
                    <td>${admin.username}</td>
                    <td>${admin.email}</td>
                    <td>
                        <a href="admin?action=edit&id=${admin.adminId}">Edit</a>
                        <a href="admin?action=delete&id=${admin.adminId}" onclick="return confirm('Are you sure?');">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <div class="btn-container">
        <a href="admin?action=add" class="btn btn-success">Add New Admin</a>
    </div>
</body>
</html>
