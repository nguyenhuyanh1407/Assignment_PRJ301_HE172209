<%-- 
    Document   : teamleader
    Created on : Mar 10, 2025, 8:59:50 AM
    Author     : ibm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- 
    Document   : divisionsleader
    Created on : Mar 6, 2025, 12:50:26 PM
    Author     : ibm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <title>Divisions Leader Dashboard</title>
        <meta
            content="width=device-width, initial-scale=1.0, shrink-to-fit=no"
            name="viewport"
            />
        <!-- Fonts and icons -->
        <script src="../../js/plugin/webfont/webfont.min.js"></script>
        <script>
            WebFont.load({
                google: {families: ["Public Sans:300,400,500,600,700"]},
                custom: {
                    families: [
                        "Font Awesome 5 Solid",
                        "Font Awesome 5 Regular",
                        "Font Awesome 5 Brands",
                        "simple-line-icons",
                    ],
                    urls: ["../../css/fonts.min.css"],
                },
                active: function () {
                    sessionStorage.fonts = true;
                },
            });
        </script>

        <!-- CSS Files -->
        <link rel="stylesheet" href="../../css/bootstrap.min.css" />
        <link rel="stylesheet" href="../../css/plugins.min.css" />
        <link rel="stylesheet" href="../../css/kaiadmin.min.css" />

        <!-- CSS Just for demo purpose, don't include it in your project -->
        <link rel="stylesheet" href="../../css/demo.css" />
    </head>
    <body>
        <div class="wrapper">
            <!-- Sidebar -->
            <div class="sidebar" data-background-color="dark">
                <div class="sidebar-logo">
                    <!-- Logo Header -->
                    <div class="logo-header" data-background-color="dark" 
                         style="display: flex; align-items: center; justify-content: flex-start; padding: 10px;">

                        <a href="homepage.jsp" class="logo" 
                           style="display: flex; align-items: center; text-decoration: none; margin-left: -4px;">

                            <img src="../../images/logo.png" alt="navbar brand" class="navbar-brand" height="40" />

                            <span style="color: #ff6600; font-size: 20px; font-weight: bold; margin-left: -4px;
                                  font-family: 'Pacifico', cursive;">
                                BAMI'S KING
                            </span>
                        </a>

                        <div class="nav-toggle">
                            <button class="btn btn-toggle toggle-sidebar">
                                <i class="gg-menu-right"></i>
                            </button>
                            <button class="btn btn-toggle sidenav-toggler">
                                <i class="gg-menu-left"></i>
                            </button>
                        </div>

                        <button class="topbar-toggler more">
                            <i class="gg-more-vertical-alt"></i>
                        </button>
                    </div>

                    <!-- End Logo Header -->
                </div>
                <div class="sidebar-wrapper scrollbar scrollbar-inner">
                    <div class="sidebar-content">
                        <ul class="nav nav-secondary">
                            <li class="nav-item active">
                                <a
                                    data-bs-toggle="collapse"
                                    href="#dashboard"
                                    class="collapsed"
                                    aria-expanded="false"
                                    >
                                    <i class="fas fa-home"></i>
                                    <p>Divisions Dashboard</p>
                                    
                                </a>

                            </li>
                            <li class="nav-section">
                                <span class="sidebar-mini-icon">
                                    <i class="fa fa-ellipsis-h"></i>
                                </span>
                                <h4 class="text-section">Components</h4>
                            </li>







                            <li class="nav-item">
                                <a data-bs-toggle="collapse" href="#forms">
                                    <i class="fas fa-pen-square"></i>
                                    <p>Leave Request</p>
                                    <span class="caret"></span>
                                </a>
                                <div class="collapse" id="forms">
                                    <ul class="nav nav-collapse">
                                        <li>
                                            <a href="../../application/request/create">
                                                <span class="sub-item">Create</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="../../application/request/review">
                                                <span class="sub-item">Review</span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </li>




                            <li class="nav-item">
                                <a data-bs-toggle="collapse" href="#charts">
                                    <i class="far fa-chart-bar"></i>
                                    <p>Charts</p>
                                    <span class="caret"></span>
                                </a>
                                <div class="collapse" id="charts">
                                    <ul class="nav nav-collapse">
                                        <li>
                                            <a href="../../application/request/agenda">
                                                <span class="sub-item">Agenda </span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </li>


                            <li class="nav-item">
                                <a href="view/admin/listNews.jsp">
                                    <i class="fas fa-layer-group"></i>
                                    <p>News Management</p>
                                </a>
                            </li>


                    </div>
                </div>
            </div>
            <!-- End Sidebar -->

            <div class="main-panel">
                <div class="main-header">
                    <div class="main-header-logo">
                        <!-- Logo Header -->
                        <div class="logo-header" data-background-color="dark">
                            <a href="index.html" class="logo">
                                <img
                                    src="assets/img/kaiadmin/logo_light.svg"
                                    alt="navbar brand"
                                    class="navbar-brand"
                                    height="20"
                                    />
                            </a>
                            <div class="nav-toggle">
                                <button class="btn btn-toggle toggle-sidebar">
                                    <i class="gg-menu-right"></i>
                                </button>
                                <button class="btn btn-toggle sidenav-toggler">
                                    <i class="gg-menu-left"></i>
                                </button>
                            </div>
                            <button class="topbar-toggler more">
                                <i class="gg-more-vertical-alt"></i>
                            </button>
                        </div>
                        <!-- End Logo Header -->
                    </div>
                    <!-- Navbar Header -->
                    <nav
                        class="navbar navbar-header navbar-header-transparent navbar-expand-lg border-bottom"
                        >
                        <div class="container-fluid">
                            <nav
                                class="navbar navbar-header-left navbar-expand-lg navbar-form nav-search p-0 d-none d-lg-flex"
                                >
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <button type="submit" class="btn btn-search pe-1">
                                            <i class="fa fa-search search-icon"></i>
                                        </button>
                                    </div>
                                    <input
                                        type="text"
                                        placeholder="Search ..."
                                        class="form-control"
                                        />
                                </div>
                            </nav>

                            <ul class="navbar-nav topbar-nav ms-md-auto align-items-center">
                                <li
                                    class="nav-item topbar-icon dropdown hidden-caret d-flex d-lg-none"
                                    >
                                    <a
                                        class="nav-link dropdown-toggle"
                                        data-bs-toggle="dropdown"
                                        href="#"
                                        role="button"
                                        aria-expanded="false"
                                        aria-haspopup="true"
                                        >
                                        <i class="fa fa-search"></i>
                                    </a>
                                    <ul class="dropdown-menu dropdown-search animated fadeIn">
                                        <form class="navbar-left navbar-form nav-search">
                                            <div class="input-group">
                                                <input
                                                    type="text"
                                                    placeholder="Search ..."
                                                    class="form-control"
                                                    />
                                            </div>
                                        </form>
                                    </ul>
                                </li>
                                <li class="nav-item topbar-icon dropdown hidden-caret">
                                    <a
                                        class="nav-link dropdown-toggle"
                                        href="#"
                                        id="messageDropdown"
                                        role="button"
                                        data-bs-toggle="dropdown"
                                        aria-haspopup="true"
                                        aria-expanded="false"
                                        >
                                        <i class="fa fa-envelope"></i>
                                    </a>



                                    </nav>
                                    <!-- End Navbar -->
                                    </div>

                                    <div class="container">
                                        <div class="page-inner">
                                            <div
                                                class="d-flex align-items-left align-items-md-center flex-column flex-md-row pt-2 pb-4"
                                                >
                                                <div>
                                                    <h3 class="fw-bold mb-3">Dashboard</h3>
                                                    <h6 class="op-7 mb-2">Hello </h6>
                                                </div>
                                                <div class="ms-md-auto py-2 py-md-0">
                                                    <a href="#" class="btn btn-label-info btn-round me-2">Manage</a>
                                                    <a href="#" class="btn btn-primary btn-round">Add Customer</a>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-sm-6 col-md-3">
                                                    <div class="card card-stats card-round">
                                                        <div class="card-body">
                                                            <div class="row align-items-center">
                                                                <div class="col-icon">
                                                                    <div
                                                                        class="icon-big text-center icon-primary bubble-shadow-small"
                                                                        >
                                                                        <i class="fas fa-users"></i>
                                                                    </div>
                                                                </div>
                                                                <div class="col col-stats ms-3 ms-sm-0">
                                                                    <div class="numbers">
                                                                        <p class="card-category">Visitors</p>
                                                                        <h4 class="card-title">1,294</h4>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6 col-md-3">
                                                    <div class="card card-stats card-round">
                                                        <div class="card-body">
                                                            <div class="row align-items-center">
                                                                <div class="col-icon">
                                                                    <div
                                                                        class="icon-big text-center icon-info bubble-shadow-small"
                                                                        >
                                                                        <i class="fas fa-user-check"></i>
                                                                    </div>
                                                                </div>
                                                                <div class="col col-stats ms-3 ms-sm-0">
                                                                    <div class="numbers">
                                                                        <p class="card-category">IT Member</p>
                                                                        <h4 class="card-title">1303</h4>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6 col-md-3">
                                                    <div class="card card-stats card-round">
                                                        <div class="card-body">
                                                            <div class="row align-items-center">
                                                                <div class="col-icon">
                                                                    <div
                                                                        class="icon-big text-center icon-success bubble-shadow-small"
                                                                        >
                                                                        <i class="fas fa-luggage-cart"></i>
                                                                    </div>
                                                                </div>
                                                                <div class="col col-stats ms-3 ms-sm-0">
                                                                    <div class="numbers">
                                                                        <p class="card-category">Sale Member</p>
                                                                        <h4 class="card-title">1,345</h4>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6 col-md-3">
                                                    <div class="card card-stats card-round">
                                                        <div class="card-body">
                                                            <div class="row align-items-center">
                                                                <div class="col-icon">
                                                                    <div
                                                                        class="icon-big text-center icon-secondary bubble-shadow-small"
                                                                        >
                                                                        <i class="far fa-check-circle"></i>
                                                                    </div>
                                                                </div>
                                                                <div class="col col-stats ms-3 ms-sm-0">
                                                                    <div class="numbers">
                                                                        <p class="card-category">Number of Request</p>
                                                                        <h4 class="card-title">576</h4>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-md-4">
                                                    <div class="card card-round">
                                                        <div class="card-body">
                                                            <div class="card-head-row card-tools-still-right">
                                                                <div class="card-title">Your Staff</div>
                                                                <div class="card-tools">
                                                                    <div class="dropdown">
                                                                        <button
                                                                            class="btn btn-icon btn-clean me-0"
                                                                            type="button"
                                                                            id="dropdownMenuButton"
                                                                            data-bs-toggle="dropdown"
                                                                            aria-haspopup="true"
                                                                            aria-expanded="false"
                                                                            >
                                                                            <i class="fas fa-ellipsis-h"></i>
                                                                        </button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="card-list py-4">




                                                                <div class="item-list">
                                                                    <div class="avatar">
                                                                        <span
                                                                            class="avatar-title rounded-circle border border-white bg-primary"
                                                                            >H</span
                                                                        >
                                                                    </div>
                                                                    <div class="info-user ms-3">
                                                                        <div class="username">Mr F</div>
                                                                        <div class="status">Sale</div>
                                                                    </div>
                                                                    <button class="btn btn-icon btn-link op-8 me-1">
                                                                        <i class="far fa-envelope"></i>
                                                                    </button>
                                                                    <button class="btn btn-icon btn-link btn-danger op-8">
                                                                        <i class="fas fa-ban"></i>
                                                                    </button>
                                                                </div>
                                                                <div class="item-list">
                                                                    <div class="avatar">
                                                                        <span
                                                                            class="avatar-title rounded-circle border border-white bg-secondary"
                                                                            >F</span
                                                                        >
                                                                    </div>
                                                                    <div class="info-user ms-3">
                                                                        <div class="username">Mr E</div>
                                                                        <div class="status">IT</div>
                                                                    </div>
                                                                    <button class="btn btn-icon btn-link op-8 me-1">
                                                                        <i class="far fa-envelope"></i>
                                                                    </button>
                                                                    <button class="btn btn-icon btn-link btn-danger op-8">
                                                                        <i class="fas fa-ban"></i>
                                                                    </button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-8">
                                                    <div class="card card-round">
                                                        <div class="card-header">
                                                            <div class="card-head-row card-tools-still-right">
                                                                <div class="card-title">Your Requests</div>
                                                                <div class="card-tools">
                                                                    <div class="dropdown">
                                                                        <button
                                                                            class="btn btn-icon btn-clean me-0"
                                                                            type="button"
                                                                            id="dropdownMenuButton"
                                                                            data-bs-toggle="dropdown"
                                                                            aria-haspopup="true"
                                                                            aria-expanded="false"
                                                                            >
                                                                            <i class="fas fa-ellipsis-h"></i>
                                                                        </button>

                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="card-body p-0">
                                                            <div class="table-responsive">
                                                                <!-- Projects table -->
                                                                <table class="table align-items-center mb-0">
                                                                    <thead class="thead-light">
                                                                        <tr>
                                                                            <th scope="col">Title</th>
                                                                            <th scope="col" class="text-end">Date & Time</th>
                                                                            <th scope="col" class="text-end">Created By</th>
                                                                            <th scope="col" class="text-end">Status</th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                        <tr>
                                                                            <th scope="row">
                                                                                <button
                                                                                    class="btn btn-icon btn-round btn-success btn-sm me-2"
                                                                                    >
                                                                                    <i class="fa fa-check"></i>
                                                                                </button>
                                                                                Đơn xin nghỉ phép
                                                                            </th>
                                                                            <td class="text-end">Mar 19, 2020, 2.45pm</td>
                                                                            <td class="text-end">Mr B</td>
                                                                            <td class="text-end">
                                                                                <button class="badge badge-success">Upload</button>
                                                                                <button class="badge badge-success" onclick="window.location.href = '../../application/request/modify'">Modify</button>

                                                                            </td>
                                                                        </tr>

                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>




                                    <footer class="footer">
                                        <div class="container-fluid d-flex justify-content-between">
                                            <nav class="pull-left">
                                                <ul class="nav">
                                                    <li class="nav-item">
                                                        <a class="nav-link" href="http://www.themekita.com">
                                                            ThemeKita
                                                        </a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a class="nav-link" href="#"> Help </a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a class="nav-link" href="#"> Licenses </a>
                                                    </li>
                                                </ul>
                                            </nav>
                                            <div class="copyright">
                                                2024, made with <i class="fa fa-heart heart text-danger"></i> by
                                                <a href="http://www.themekita.com"></a>
                                            </div>
                                            <div>

                                                <a target="_blank" href="https://themewagon.com/"></a>.
                                            </div>
                                        </div>
                                    </footer>
                                    </div>



                                    </div>
                                    <!--   Core JS Files   -->
                                    <script src="../../js/core/jquery-3.7.1.min.js"></script>
                                    <script src="../../js/core/popper.min.js"></script>
                                    <script src="../../js/core/bootstrap.min.js"></script>

                                    <!-- jQuery Scrollbar -->
                                    <script src="../../js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>







                                    <!-- Datatables -->
                                    <script src="../../js/plugin/datatables/datatables.min.js"></script>

                                    <!-- Bootstrap Notify -->
                                    <script src="../../js/plugin/bootstrap-notify/bootstrap-notify.min.js"></script>




                                    <!-- Kaiadmin JS -->
                                    <script src="../../js/kaiadmin.min.js"></script>

                                    <!-- Kaiadmin DEMO methods, don't include it in your project! -->
                                    <script src="../../js/setting-demo.js"></script>
                                    <script src="../../js/demo.js"></script>

                                    </body>
                                    </html>

