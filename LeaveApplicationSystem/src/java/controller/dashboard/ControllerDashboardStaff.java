package controller.dashboard;

import controller.auth.BaseRequiredAuthenticationController;
import dal.LeaveRequestDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import model.LeaveRequest;
import model.User;

/**
 *
 * @author ibm
 */
public class ControllerDashboardStaff extends BaseRequiredAuthenticationController {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        // Hiện tại không có xử lý POST, có thể thêm vào nếu cần
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        // Lấy danh sách đơn xin nghỉ theo user đang đăng nhập
        LeaveRequestDBContext db = new LeaveRequestDBContext();
        List<LeaveRequest> requests = db.getLrByName(user.getUsername());

        // Đặt danh sách vào request attribute
        req.setAttribute("requests", requests);

        // Chuyển hướng sang JSP
        req.getRequestDispatcher("/view/dashboard/staff.jsp").forward(req, resp);
    }
}
