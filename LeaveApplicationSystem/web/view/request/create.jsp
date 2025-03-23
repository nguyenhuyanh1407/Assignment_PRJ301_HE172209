<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.User, model.Role" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Leave Request System</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Bootstrap Bundle JS (Includes Popper) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <style>
        body {
            background-color: #f8f9fa;
        }
        .form-container {
            max-width: 500px;
            padding: 20px;
            background: white;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            text-align: center; /* Căn giữa nội dung */
        }
        h2 {
            color: #007bff;
        }
        .form-label {
            text-align: left;
            display: block;
        }
    </style>
</head>
<body class="d-flex align-items-center min-vh-100 justify-content-center">
    <div class="container">
<%
    User user = (User) session.getAttribute("user");

    Integer roleID = null;
    if (user != null && user.getRoles() != null && !user.getRoles().isEmpty()) {
        roleID = user.getRoles().get(0).getId(); // Lấy roleID của role đầu tiên
    }

    String backURL = "../../homepage"; // Trang mặc định nếu không có role

    if (roleID != null) {
        switch (roleID) {
            case 1:
                backURL = "../../view/dashboard/divisionsleader";
                break;
            case 2:
                backURL = "../../view/dashboard/teamleader";
                break;
            case 3:
                backURL = "../../view/dashboard/staff";
                break;
        }
    }
%>


        <!-- Hiển thị thông báo -->
        <% String message = (String) request.getAttribute("message"); %>
        <% String error = (String) request.getAttribute("error"); %>

        <% if (message != null) { %>
            <div class="alert alert-success text-center"><%= message %></div>
        <% } %>

        <% if (error != null) { %>
            <div class="alert alert-danger text-center"><%= error %></div>
        <% } %>

        <!-- Căn giữa logo và tiêu đề -->
        <div class="d-flex justify-content-center my-3">
            <span style="font-family: 'Pacifico', cursive; font-size: 34px; font-weight: bold; color: #ff6600;
                          text-transform: uppercase; letter-spacing: 2px; text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.3);
                          display: inline-flex; align-items: center; gap: 5px;">
                <img src="../../images/logo.png" width="80" height="55" style="margin-right: 2px;">
                BAMI'S KING
            </span>
        </div>

        <!-- Căn giữa form -->
        <div class="d-flex justify-content-center">
            <div class="form-container">
                <!-- Hiển thị tên người dùng -->
                <h2>Hello, ${sessionScope.user.displayname}</h2>

                <!-- Form xin nghỉ phép -->
                <form action="create" method="POST" id="leaveForm">
                    <div class="mb-3">
                        <label class="form-label">Title</label>
                        <input type="text" name="title" class="form-control text-center" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Reason</label>
                        <textarea name="reason" class="form-control text-center" rows="3" required></textarea>
                    </div>

                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label class="form-label">From</label>
                            <input type="date" name="from" class="form-control text-center" required>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="form-label">To</label>
                            <input type="date" name="to" class="form-control text-center" required>
                        </div>
                    </div>

                    <div class="d-flex justify-content-between gap-1">
                        <button type="submit" class="btn btn-primary w-50">Send Request</button>
    <button type="button" class="btn btn-secondary w-50" onclick="window.location.href='<%= backURL %>'" style="margin-left: 3px;">Back</button>
                    </div>

                </form>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const fromDateInput = document.querySelector('input[name="from"]');
            const toDateInput = document.querySelector('input[name="to"]');
            const form = document.getElementById("leaveForm");

            fromDateInput.addEventListener("change", function () {
                toDateInput.min = fromDateInput.value; // Đặt ngày tối thiểu của 'To' là ngày 'From'
            });

            form.addEventListener("submit", function (event) {
                const fromDate = new Date(fromDateInput.value);
                const toDate = new Date(toDateInput.value);

                if (toDate <= fromDate) {
                    event.preventDefault();
                    alert("Invalid date! Please choose again!");
                }
            });
        });
    </script>
</body>
</html>

