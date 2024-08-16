<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/css/line-awesome.min.css">
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
        }

        header {
            background-color: black;
            color: white;
            padding: 10px 20px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .header-content {
            display: flex;
            align-items: center;
            width: 100%;
        }

        .search-bar {
            display: flex;
            align-items: center;
            margin-left: 20px;
            flex-grow: 1;
        }

        .search-bar input {
            padding: 5px 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            margin-left: 10px;
            width: 100%;
            max-width: 400px;
        }

        .header-icons {
            display: flex;
            align-items: center;
        }

        .notify-icon {
            position: relative;
            margin-right: 20px;
            font-size: 20px;
        }

        .notify {
            position: absolute;
            top: -5px;
            right: -10px;
            background-color: red;
            color: white;
            font-size: 12px;
            padding: 2px 6px;
            border-radius: 50%;
        }

        .user {
            display: flex;
            align-items: center;
            cursor: pointer;
        }

        .bg-img {
            width: 30px;
            height: 30px;
            border-radius: 50%;
            background-size: cover;
            background-position: center;
            margin-right: 10px;
        }

        .las.la-power-off {
            font-size: 20px;
            margin-right: 5px;
        }

        .user span {
            color: white;
            font-size: 16px;
        }
    </style>
</head>
<body>
<header>
    <div class="header-content">
        <!-- Sidebar toggle button -->
        <label for="menu-toggle">
            <span class="las la-bars"></span>
        </label>
        
        <!-- Centered search bar -->
        <div class="search-bar">
            <span class="las la-search"></span>
            <input type="text" placeholder="Search...">
        </div>

        <!-- Right-side icons (notification and logout) -->
        <div class="header-icons">
            <div class="notify-icon">
                <span class="las la-envelope"></span>
                <span class="notify">4</span>
            </div>
            
            <div class="notify-icon">
                <span class="las la-bell"></span>
                <span class="notify">3</span>
            </div>
            
            <div class="user">
                <div class="bg-img" style="background-image: url('img/1.jpeg')"></div>
                <span class="las la-power-off"></span>
                <span>Logout</span>
            </div>
        </div>
    </div>
</header>
</body>
</html>
