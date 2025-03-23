package controller.dashboard;

import controller.auth.BaseRequiredAuthenticationController;
import dal.EmployeeDBContext;
import dal.LeaveRequestDBContext;
import dal.UserDBContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Employee;
import model.LeaveRequest;
import model.User;

public class ControllerDashboardDivisionsleader extends BaseRequiredAuthenticationController {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        // Xử lý POST nếu cần
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        LeaveRequestDBContext db = new LeaveRequestDBContext();
        List<LeaveRequest> requests = db.getLrByName(user.getUsername());

        // Đặt danh sách vào request attribute
        req.setAttribute("requests", requests);

        // Chuyển hướng sang JSP
        req.getRequestDispatcher("/view/dashboard/divisionsleader.jsp").forward(req, resp);
                
    }
}
