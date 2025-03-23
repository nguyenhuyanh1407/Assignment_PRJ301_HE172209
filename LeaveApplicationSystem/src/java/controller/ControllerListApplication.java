package controller;

import controller.auth.BaseRequiredAuthenticationController;
import dal.LeaveRequestDBContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;

public class ControllerListApplication extends BaseRequiredAuthenticationController {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        try {
            int requestId = Integer.parseInt(req.getParameter("id"));
            int newStatus = Integer.parseInt(req.getParameter("status"));

            LeaveRequestDBContext db = new LeaveRequestDBContext();
            db.updateLeaveRequestStatus(requestId, newStatus);

            resp.getWriter().write("Success");
        } catch (NumberFormatException e) {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            resp.getWriter().write("Invalid request parameters");
        } catch (Exception e) {
            resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            resp.getWriter().write("Error updating status");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        LeaveRequestDBContext db = new LeaveRequestDBContext();
        int managerId = user.getE().getId(); // Giả sử User có employee ID (eid)
        req.setAttribute("requests", db.getEmsRequest(managerId));
        req.getRequestDispatcher("../../view/request/list.jsp").forward(req, resp);
    }
}
