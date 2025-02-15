package controller;

import entity.GoogleAccount;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class LoginController extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        // Lấy mã code từ request
        String code = request.getParameter("code");
        
        try (PrintWriter out = response.getWriter()) {
            if (code == null || code.isEmpty()) {
                out.println("<h3>Lỗi: Không có mã xác thực!</h3>");
                return;
            }

            // Xử lý đăng nhập Google
            GoogleLoginController gg = new GoogleLoginController();
            String accessToken = gg.getToken(code);
            
            if (accessToken == null) {
                out.println("<h3>Lỗi: Không thể lấy access token!</h3>");
                return;
            }
            
            GoogleAccount acc = gg.getUserInfo(accessToken);
            
            if (acc == null) {
                out.println("<h3>Lỗi: Không thể lấy thông tin tài khoản!</h3>");
                return;
            }

            // Hiển thị thông tin người dùng
            out.println("<html><body>");
            out.println("<h2>Thông tin tài khoản Google</h2>");
            out.println("<p><b>Tên:</b> " + acc.getName() + "</p>");
            out.println("<p><b>Email:</b> " + acc.getEmail() + "</p>");
            out.println("<p><b>Ảnh đại diện:</b> <br><img src='" + acc.getPicture() + "' width='100'></p>");
            out.println("</body></html>");
        } catch (Exception e) {
            response.getWriter().println("<h3>Lỗi hệ thống: " + e.getMessage() + "</h3>");
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "LoginController xử lý đăng nhập Google";
    }
}
