<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Staff Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            background-color: #f4f4f4;
            font-family: 'Arial', sans-serif;
        }

        #wrapper {
            display: flex;
            flex-wrap: nowrap;
        }

        #sidebar-wrapper {
            min-width: 250px;
            max-width: 250px;
            background-color: #000;
            color: #fff;
            position: fixed;
            height: 100vh;
        }

        .sidebar-heading {
            padding: 1.5rem;
            background-color: #000;
            color: #D4AF37;
            font-size: 1.5rem;
            font-weight: bold;
            text-align: center;
        }

        .list-group-item {
            background-color: transparent;
            border: none;
            color: #fff;
            font-weight: bold;
            padding: 15px 20px;
            display: flex;
            align-items: center;
        }

        .list-group-item:hover {
            background-color: #333;
            color: #D4AF37;
        }

        .list-group-item.active {
            background-color: #D4AF37;
            color: #000;
        }

        .list-group-item i {
            margin-right: 10px;
        }

        #page-content-wrapper {
            margin-left: 250px;
            width: calc(100% - 250px);
            padding: 20px;
        }

        .navbar {
            background-color: #000;
            padding: 5px 20px;
            color: #D4AF37;
            border-bottom: 2px solid #D4AF37;
        }

        .navbar .navbar-toggler-icon {
            color: #D4AF37;
        }

        .navbar .nav-item {
            margin-right: 20px;
        }

        .navbar .search-bar {
            flex-grow: 1;
            margin-left: 10px;
        }

        .navbar .search-bar input {
            background-color: #333;
            border: none;
            color: #D4AF37;
            padding: 5px 15px;
            border-radius: 20px;
            width: 100%;
        }

        .navbar .search-bar input::placeholder {
            color: #aaa;
        }

        .navbar .nav-item .nav-link {
            color: #D4AF37;
            position: relative;
        }

        .navbar .nav-item .nav-link .badge {
            background-color: #ff5c5c;
            color: #fff;
            position: absolute;
            top: -5px;
            right: -10px;
            border-radius: 50%;
        }

        .navbar .nav-item .logout-link {
            color: #fff;
        }

        .navbar .nav-item .logout-link i {
            margin-left: 5px;
        }

        .card {
            border: none;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }

        .card-head {
            background-color: #D4AF37;
            color: #000;
            padding: 20px;
            border-radius: 8px 8px 0 0;
            text-align: center;
        }

        .card-head h2 {
            margin: 0;
        }

        .card-progress {
            padding: 20px;
            background-color: #fff;
            border-radius: 0 0 8px 8px;
        }

        .card-progress small {
            display: block;
            margin-bottom: 10px;
        }

        .card-progress .card-indicator {
            height: 5px;
            background-color: #eee;
            border-radius: 5px;
            overflow: hidden;
        }

        .card-progress .indicator.one {
            height: 100%;
            background-color: #D4AF37;
        }
    </style>
</head>

<body>

   
    
    <div id="wrapper">
        <!-- Sidebar -->
        <div id="sidebar-wrapper" class="bg-black text-white">
            <div class="sidebar-heading">ABC</div>
            <div class="list-group list-group-flush">
                <a href="#" class="list-group-item list-group-item-action active">
                    <i class="fas fa-tachometer-alt"></i> Dashboard
                </a>
                <a href="#" class="list-group-item list-group-item-action">
                    <i class="fas fa-calendar-alt"></i> Calendar
                </a>
                <a href="http://localhost:8085/abc_restaurant_final/reservations?action=list" class="list-group-item list-group-item-action">
                    <i class="fas fa-box-open"></i> Manage Reservations
                </a>
                <a href="http://localhost:8085/abc_restaurant_final/queries?action=list" class="list-group-item list-group-item-action">
                    <i class="fas fa-users"></i> Queries
                </a>
               
            </div>
        </div>
        <!-- /#sidebar-wrapper -->

        <!-- Page Content -->
        <div id="page-content-wrapper">
            <!-- Navigation Bar -->
            <nav class="navbar d-flex align-items-center">
                <ul class="navbar-nav ms-auto d-flex flex-row align-items-center">
                    <li class="nav-item">
                        <a class="nav-link" href="#">
                            <i class="fas fa-envelope"></i>
                            <span class="badge">4</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">
                            <i class="fas fa-bell"></i>
                            <span class="badge">3</span>
                        </a>
                    </li>
                </ul>
            </nav>

            <div class="container-fluid px-4">
                <div class="row g-3">
                    <div class="col-md-4">
                        <div class="card">
                            <div class="card-head">
                                <h2>107,200</h2>
                                <span class="fas fa-box-open fs-1 primary-text"></span>
                            </div>
                            <div class="card-progress">
                                <small>
                                    <a href="http://localhost:8085/abc_restaurant_final/reservation?action=list"
                                        style="text-decoration: none; color: inherit;">
                                        Table Bookings
                                    </a>
                                </small>
                                <div class="card-indicator">
                                    <div class="indicator one" style="width: 60%"></div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="card">
                            <div class="card-head">
                                <h2>107,200</h2>
                                <span class="fas fa-users fs-1 primary-text"></span>
                            </div>
                            <div class="card-progress">
                                <small>
                                    <a href="http://localhost:8085/abc_restaurant_final/queries?action=list"
                                        style="text-decoration: none; color: inherit;">
                                        Queries
                                    </a>
                                </small>
                                <div class="card-indicator">
                                    <div class="indicator one" style="width: 60%"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card">
                            <div class="card-head">
                                <h2>107,200</h2>
                                <span class="fas fa-users fs-1 primary-text"></span>
                            </div>
                    <div class="card-progress">
                                <small>
                                    <a href="http://localhost:8085/abc_restaurant_final/booking?action=list"
                                        style="text-decoration: none; color: inherit;">
                                        Event Bookings
                                    </a>
                                </small>
                                <div class="card-indicator">
                                    <div class="indicator one" style="width: 60%"></div>
                                </div>
                            </div>
                            
                               </div>
                        </div>
                    </div>

                    
                </div>
            </div>

        </div>
        <!-- /#page-content-wrapper -->
    </div>
    <!-- /#wrapper -->

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>
