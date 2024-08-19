<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add User</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        body {
            background-color: #000;
            color: #fff;
        }
        .container {
            margin-top: 50px;
        }
        .form-label {
            color: #D4AF37;
        }
        .form-control {
            background-color: #333;
            color: #fff;
            border: 1px solid #444;
        }
        .form-control:focus {
            border-color: #D4AF37;
            box-shadow: 0 0 0 0.2rem rgba(212, 175, 55, 0.25);
        }
        .btn-success {
            background-color: #D4AF37;
            border-color: #D4AF37;
        }
        .btn-success:hover {
            background-color: #b09f3f;
        }
        .btn-secondary {
            background-color: #444;
            border-color: #444;
        }
        .btn-secondary:hover {
            background-color: #333;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="text-center">Add User</h1>
        <form action="user?action=register" method="post">
            <div class="mb-3">
                <label for="username" class="form-label">Username</label>
                <input type="text" class="form-control" id="username" name="username" required>
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <input type="email" class="form-control" id="email" name="email" required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>
            <button type="submit" class="btn btn-success">Register User</button>
            <a href="user?action=list" class="btn btn-secondary">Cancel</a>
        </form>
    </div>
</body>
</html>
