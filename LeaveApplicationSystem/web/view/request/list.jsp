<%-- 
    Document   : list
    Created on : Mar 6, 2025, 2:01:42 PM
    Author     : ibm
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Leave Request System</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>

    <!-- FontAwesome -->
    <script src="https://kit.fontawesome.com/your-fontawesome-kit.js" crossorigin="anonymous"></script>

    <style>
        /* Căn giữa tất cả các cột */
        .table td, .table th {
            text-align: center;
            vertical-align: middle;
        }
        /* Xóa màu nền của dropdown */
        .dropdown-toggle {
            background: none !important;
            border: none !important;
            color: black !important;
        }
    </style>
</head>
<body class="bg-gray-100">
    <div class="min-h-screen flex flex-col items-center justify-center">
        <!-- Logo -->
        <span style="font-family: 'Pacifico', cursive; font-size: 34px; font-weight: bold; color: #ff6600;
              text-transform: uppercase; letter-spacing: 2px; text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.3);
              display: inline-flex; align-items: center; gap: 5px;">
            <img src="../../images/logo.png" width="80" height="55" style="margin-right: 2px;">
            BAMI'S KING
        </span>

        <!-- Card -->
        <div class="col-md-8 mt-4">
            <div class="card shadow-sm">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <h5 class="mb-0">Staff's Request</h5>
                </div>

                <div class="card-body p-0">
                    <div class="container mt-5">
                        <table class="table table-striped align-middle">
                            <thead class="table-light">
                                <tr>
                                    <th scope="col">Title</th>
                                    <th scope="col">Date & Time</th>
                                    <th scope="col">Created By</th>
                                    <th scope="col">Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <button class="btn btn-link text-decoration-none"
                                                onclick="window.location.href='../../application/request/review'">
                                            Đơn xin nghỉ phép
                                        </button>
                                    </td>
                                    <td>Mar 19, 2020, 2:45 PM</td>
                                    <td>Mr C</td>
                                    <td>
                                        <div class="dropdown">
                                            <button class="btn dropdown-toggle" type="button" id="dropdownMenuButton"
                                                    data-bs-toggle="dropdown" aria-expanded="false">
                                                In Progress
                                            </button>
                                            <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                                <li><a class="dropdown-item" href="#">In Progress</a></li>
                                                <li><a class="dropdown-item" href="#">Rejected</a></li>
                                                <li><a class="dropdown-item" href="#">Approved</a></li>
                                            </ul>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>  
                </div>
            </div>
        </div>
    </div>
</body>
</html>
