<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import="model.LeaveRequest" %>
<%@page import="model.User" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Leave Request System</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    </head>
    
    <body class="bg-light">
        
        <div class="container mt-5">
            <h2 class="text-center">Staff's Leave Requests</h2>
            <table class="table table-bordered text-center">
                <thead class="table-dark">
                    <tr>
                        <th>Title</th>
                        <th>Reason</th>
                        <th>From</th>
                        <th>To</th>
                        <th>Created By</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        ArrayList<LeaveRequest> requests = (ArrayList<LeaveRequest>) request.getAttribute("requests");
                        if (requests != null && !requests.isEmpty()) {
                            for (LeaveRequest r : requests) {
                    %>
                    <tr>
                        <td><a href="../../application/request/review?id=<%= r.getId() %>"><%= r.getTitle() %></a></td>
                        <td><%= r.getReason() %></td>
                        <td><%= r.getFrom() %></td>
                        <td><%= r.getTo() %></td>
                        <td><%= r.getCreatedby().getUsername() %></td>
                        <td>
                            <select class="form-select status-dropdown" data-request-id="<%= r.getId() %>">
                                <option value="0" <%= r.getStatus() == 0 ? "selected" : "" %>>In Progress</option>
                                <option value="1" <%= r.getStatus() == 1 ? "selected" : "" %>>Approved</option>
                                <option value="2" <%= r.getStatus() == 2 ? "selected" : "" %>>Rejected</option>
                            </select>
                        </td>
                    </tr>
                    <%
                            }
                        } else {
                    %>
                    <tr>
                        <td colspan="6" class="text-center">No requests found</td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
        
        <script>
            $(document).ready(function() {
                $(".status-dropdown").change(function() {
                    var requestId = $(this).data("request-id");
                    var newStatus = $(this).val();
                    
                    $.ajax({
                        url: "../../application/request/list",
                        type: "POST",
                        data: { id: requestId, status: newStatus },
                        success: function(response) {
                            alert("Status updated successfully!");
                        },
                        error: function(xhr, status, error) {
                            alert("Failed to update status.");
                        }
                    });
                });
            });
        </script>

    </body>
</html>

