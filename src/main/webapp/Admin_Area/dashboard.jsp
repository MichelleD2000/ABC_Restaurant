<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="./CSS/styles.css">
    <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
</head>
<body>
   <input type="checkbox" id="menu-toggle">
    <div class="sidebar">
        <div class="side-header">
            <h3><span>ABC</span></h3>
        </div>
        <jsp:include page="./sidebar.jsp" />
    </div>
   
    <div class="main-content">
        <jsp:include page="./navbar.jsp" />
        
        <main>
           
            <div class="page-content">
                <div class="analytics">

                    <!-- Card 1 -->
                    <div class="card">
                        <div class="card-head">
                            <h2>107,200</h2>
                            <span class="las la-box"></span>
                        </div>
                        <div class="card-progress">
                            <small><a href="http://localhost:8085/abc_restaurant_final/product?action=list" style="text-decoration:none;color:inherit;">Manage Products</a></small>
                            <div class="card-indicator">
                                <div class="indicator one" style="width: 60%"></div>
                            </div>
                        </div>
                    </div>

                    <!-- Card 2 -->
                    <div class="card">
                        <div class="card-head">
                            <h2>340,230</h2>
                            <span class="las la-eye"></span>
                        </div>
                        <div class="card-progress">
                            <small><a href="http://localhost:8085/abc_restaurant_final/customer?action=list" style="text-decoration:none;color:inherit;">Manage Customers</a></small>
                            <div class="card-indicator">
                                <div class="indicator two" style="width: 80%"></div>
                            </div>
                        </div>
                    </div>

                    <!-- Card 3 -->
                    <div class="card">
                        <div class="card-head">
                            <h2>$653,200</h2>
                            <span class="las la-calendar-check"></span>
                        </div>
                        <div class="card-progress">
                            <small><a href="http://localhost:8085/abc_restaurant_final/reservation?action=list" style="text-decoration:none;color:inherit;">Manage Reservations</a></small>
                            <div class="card-indicator">
                                <div class="indicator three" style="width: 65%"></div>
                            </div>
                        </div>
                    </div>

                    <!-- Card 4 -->
                    <div class="card">
                        <div class="card-head">
                            <h2>47,500</h2>
                            <span class="las la-envelope"></span>
                        </div>
                        <div class="card-progress">
                            <small><a href="http://localhost:8085/abc_restaurant_final/booking?action=list" style="text-decoration:none;color:inherit;">
                            Manage Services</a></small>
                            <div class="card-indicator">
                                <div class="indicator four" style="width: 90%"></div>
                            </div>
                        </div>
                    </div>

                    <!-- Card 5 -->
                 <!-- Updated Card 5 in Admin Dashboard -->
<div class="card">
    <div class="card-head">
        <h2>47,500</h2>
        <span class="las la-chart-bar"></span>
    </div>
    <div class="card-progress">
        <small><a href="http://localhost:8085/abc_restaurant_final/gallery?action=upload" style="text-decoration:none;color:inherit;">Manage Offers and Gallery</a></small>
        <div class="card-indicator">
            <div class="indicator five" style="width: 90%"></div>
        </div>
    </div>
</div>


                    <!-- Card 6 -->
                    <div class="card">
                        <div class="card-head">
                            <h2>50,000</h2>
                            <span class="las la-wallet"></span>
                        </div>
                        <div class="card-progress">
                            <small>Reports</small>
                            <div class="card-indicator">
                                <div class="indicator six" style="width: 70%"></div>
                            </div>
                        </div>
                    </div>

                </div>

                

                    
                </div>
            
            </div>
        </main>
        
    </div>
</body>
</html>
