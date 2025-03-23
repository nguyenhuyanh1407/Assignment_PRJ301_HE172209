/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import controller.auth.BaseRequiredAuthenticationController;
import dal.LeaveRequestDBContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import model.User;
import model.LeaveRequest;

/**
 *
 * @author ibm
 */
public class ControllerCreateApplication extends BaseRequiredAuthenticationController {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        try {
            String title = req.getParameter("title");
            String reason = req.getParameter("reason");
            String from = req.getParameter("from");
            String to = req.getParameter("to");

            if (title == null || reason == null || from == null || to == null
                    || title.trim().isEmpty() || reason.trim().isEmpty()) {
                req.setAttribute("error", "All fields are required!");
                req.getRequestDispatcher("../../view/request/create.jsp").forward(req, resp);
                return;
            }

            LeaveRequest lr = new LeaveRequest();
            lr.setTitle(title);
            lr.setReason(reason);
            lr.setFrom(Date.valueOf(from));
            lr.setTo(Date.valueOf(to));
            lr.setCreatedby(user);

            LeaveRequestDBContext db = new LeaveRequestDBContext();
            db.insert(lr);

            req.setAttribute("message", "Request submitted successfully!");
            req.getRequestDispatcher("../../view/request/create.jsp").forward(req, resp);
        } catch (Exception e) {
            req.setAttribute("error", "Invalid input!");
            req.getRequestDispatcher("../../view/request/create.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        req.setAttribute("roleID", user.getRoles()); // Truyền roleID qua request

        req.getRequestDispatcher("../../view/request/create.jsp").forward(req, resp);
    }

}
