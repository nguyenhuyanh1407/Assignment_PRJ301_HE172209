<%-- 
    Document   : create
    Created on : Mar 6, 2025, 2:01:13 PM
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
    
    <!-- Bootstrap Bundle JS (Includes Popper) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body class="bg-light">
    <div class="container min-vh-100 d-flex flex-column justify-content-center align-items-center">
        <div class="text-center mb-4">
            <h1 class="text-warning fw-bold text-uppercase" style="letter-spacing: 2px;">
                <img src="../../images/logo.png" width="80" height="55" class="me-2">
                BAMI'S KING
            </h1>
        </div>

        <div class="card shadow-lg p-4 w-100" style="max-width: 600px;">
            <h2 class="text-center text-primary">Leave Request</h2>
            <form action="../../divisionsleader.jsp" method="POST" class="mt-3">
                <div class="mb-3">
                    <label class="form-label">Title</label>
                    <input type="text" name="title" class="form-control" required>
                </div>
                
                <div class="mb-3">
                    <label class="form-label">Name</label>
                    <input type="text" name="name" class="form-control" required>
                </div>

                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Division</label>
                        <select class="form-select" name="division">
                            <option value="IT">IT</option>
                            <option value="QA">QA</option>
                            <option value="Sale">Sale</option>
                        </select>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Role</label>
                        <select class="form-select" name="role">
                            <option value="Staff">Staff</option>
                            <option value="Team Leader">Team Leader</option>
                            <option value="Divisions Leader">Divisions Leader</option>
                        </select>
                    </div>
                </div>

                <div class="mb-3">
                    <label class="form-label">Reason</label>
                    <textarea name="reason" class="form-control" rows="3" required></textarea>
                </div>

                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label class="form-label">From</label>
                        <input type="date" name="from" class="form-control" required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label class="form-label">To</label>
                        <input type="date" name="to" class="form-control" required>
                    </div>
                </div>

                <button type="submit" class="btn btn-primary w-100">Save Draft</button>
            </form>
        </div>
    </div>
</body>
</html>
