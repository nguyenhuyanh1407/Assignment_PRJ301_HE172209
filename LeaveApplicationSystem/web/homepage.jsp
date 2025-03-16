<%-- 
    Document   : homepage
    Created on : Mar 2, 2025, 8:37:41 AM
    Author     : ibm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <!-- Basic -->
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <!-- Mobile Metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <!-- Site Metas -->
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <meta name="author" content="" />

        <title>Inance</title>

        <!-- slider stylesheet -->
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
        <!-- bootstrap core css -->
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
        <!-- font awesome style -->
        <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css" />

        <!-- Custom styles for this template -->
        <link href="css/style.css" rel="stylesheet" />
        <!-- responsive style -->
        <link href="css/responsive.css" rel="stylesheet" />
        <!-- Thư viện Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Thư viện Bootstrap JS (cần để hoạt động các hiệu ứng) -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

        <style>
       /* Cố định kích thước ảnh */
       .carousel-inner img {
           width: 100%;  /* Ảnh sẽ chiếm toàn bộ bề ngang */
           height: 300px; /* Chiều cao cố định (thay đổi tùy nhu cầu) */
           object-fit: cover; /* Cắt ảnh để không bị méo */
       }
        </style>

        <style>
            .carousel-item {
                transition: transform 3s ease-in-out !important; /* Làm chậm chuyển động */
            }
        </style>
        
     

        
    </head>

    <body>
        <div class="hero_area">
            <!-- header section strats -->
            <header class="header_section">
                <div class="header_top">
                    <div class="container-fluid">
                        <div class="contact_nav">
                            <a href="">
                                <i class="fa fa-phone" aria-hidden="true"></i>
                                <span>
                                    Call : +0866650703
                                </span>
                            </a>
                            <a href="">
                                <i class="fa fa-envelope" aria-hidden="true"></i>
                                <span>
                                    Email : bami'sking@gmail.com
                                </span>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="header_bottom">
                    <div class="container-fluid">
                        <nav class="navbar navbar-expand-lg custom_nav-container ">
                            <a class="navbar-brand" href="index.html">
                                <span style="font-family: 'Pacifico', cursive; font-size: 34px; font-weight: bold; color: #ff6600;
                                      text-transform: uppercase; letter-spacing: 2px; text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.3);
                                      display: inline-flex; align-items: center; gap: 5px; margin-left: -20px;">
                                    <img src="images/logo.png" alt="Logo" width="80" height="55" style="margin-right: 2px;">
                                    BAMI'S KING
                                </span>


                            </a>

                            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                                <span class=""> </span>
                            </button>

                            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                                <ul class="navbar-nav d-flex align-items-center">
                                    <li class="nav-item active">
                                        <a class="nav-link" href="">Home <span class="sr-only">(current)</span></a>
                                    </li>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="login">Contact Us</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="login">News</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="login">Login</a>
                                    </li>
                                    <li class="nav-item">
                                            <a class="nav-link">Hello ${sessionScope.user.displayname}!</a>
                                    </li>
                                        
                                    
                                </ul>
                            </div>

                        </nav>
                    </div>
                </div>
            </header>
            <!-- end header section -->
            <!-- slider section -->
            
            <section class="slider_section ">
                <div class="container ">
                    <div class="row">
                        <div class="col-md-6 d-flex flex-column justify-content-center align-items-center">
                            <div class="detail-box">
                                <h1>
                                    </br>
                                    </br>   
                                    DELICIOUS <br>
                                    NUTRITIOUS <br>
                                    AFFORDABLE
                                </h1>
                                <p>
                                    "Bread is not just food; it is a story of flavor, </br>
                                    love, and creativity in every crispy layer." 🥖✨
                                </p>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div id="imageCarousel" class="carousel slide" data-bs-ride="carousel" data-bs-interval="3000">
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <img src="images/homepage.png" class="carousel-inner img" alt="Image 1">
                                    </div>
                                    <div class="carousel-item">
                                        <img src="images/homepage1.png" class="carousel-inner img" alt="Image 2">
                                    </div>
                                    <div class="carousel-item">
                                        <img src="images/homepage2.png" class="carousel-inner img" alt="Image 3">
                                    </div>
                                </div>

                                <!-- Nút điều hướng -->
                                
                                <button class="carousel-control-prev" type="button" data-bs-target="#imageCarousel" data-bs-slide="prev">
                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                </button>
                                <button class="carousel-control-next" type="button" data-bs-target="#imageCarousel" data-bs-slide="next">
                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                </button>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- end slider section -->
        </div>
        </br>
        </br>
        </br>
        </br>
        </br>
        </br>
        </br>
        </br>
        </br>
        </br>
        </br>
        </br>
        </br>
        </br>
        
        <!-- feature section -->
       


        <footer class="footer_section">
            <div class="container">
                <p>
                    &copy; <span id="displayDateYear"></span> All Rights Reserved By
                    <a href="https://html.design/">Free Html Templates</a>
                </p>
            </div>
        </footer>
        <!-- footer section -->

        <script src="js/jquery-3.4.1.min.js"></script>
        <script src="js/bootstrap.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js">
        </script>
        <script src="js/custom.js"></script>
        <!-- Google Map -->
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCh39n5U-4IoWpsVGUHWdqB6puEkhRLdmI&callback=myMap"></script>
        <!-- End Google Map -->


    </body>

</html>
