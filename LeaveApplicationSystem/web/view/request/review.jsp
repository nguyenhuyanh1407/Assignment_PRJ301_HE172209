<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.LeaveRequest" %>
<%
    String error = (String) request.getAttribute("error");
    LeaveRequest requestDetail = (LeaveRequest) request.getAttribute("requestDetail");
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Review Leave Request</title>
        <link rel="stylesheet" href="styles.css">
    </head>
    <body>
        <div class="container">
            <h2>Review Leave Request</h2>

            <% if (error != null) { %>
            <p style="color: red;"><%= error %></p>
            <% } %>

            <% if (requestDetail != null) { %>
            <p><strong>Employee Name:</strong> <%= requestDetail.getCreatedby() %></p>
            <p><strong>Start Date:</strong> <%= requestDetail.getFrom() %></p>
            <p><strong>End Date:</strong> <%= requestDetail.getTo() %></p>
            <p><strong>End Date:</strong> <%= requestDetail.getReason() %></p>

            <p><strong>Status:</strong> <%= requestDetail.getStatus() %></p>
            <% } else { %>
            <p>No request details available.</p>
            <% } %>
        </div>
    </body>
</html>
