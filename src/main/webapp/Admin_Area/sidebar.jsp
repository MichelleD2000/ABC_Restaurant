<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/line-awesome/1.3.0/css/line-awesome.min.css">

</head>
<body>
    <div class="side-menu">
        <ul>
            <!-- Dashboard -->
            <li>
                <a href="dashboard.jsp" class="active">
                    <span class="las la-tachometer-alt"></span>
                    <small>Dashboard</small>
                </a>
            </li>

            <!-- Manage Products -->
            <li>
                <a href="manageProducts.jsp">
                    <span class="las la-box"></span>
                    <small>Manage Products</small>
                </a>
            </li>

            <!-- Manage Users -->
            <li>
                <a href="manageUsers.jsp">
                    <span class="las la-user-friends"></span>
                    <small>Manage Users</small>
                </a>
            </li>
                    
            <!-- Manage Reservations -->
            <li>
                <a href="manageReservations.jsp">
                    <span class="las la-calendar-check"></span>
                    <small>Manage Reservations</small>
                </a>
            </li>
                    
            <!-- Query Management -->
            <li>
                <a href="queryManagement.jsp">
                    <span class="las la-envelope"></span>
                    <small>Query Management</small>
                </a>
            </li>
                    
            <!-- Reports -->
            <li>
                <a href="reports.jsp">
                    <span class="las la-chart-bar"></span>
                    <small>Reports</small>
                </a>
            </li>
                    
            <!-- Payments -->
            <li>
                <a href="payments.jsp">
                    <span class="las la-wallet"></span>
                    <small>Payments</small>
                </a>
            </li>
        </ul>
    </div>
</body>
</html>
