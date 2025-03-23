/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import controller.auth.BaseRequiredAuthenticationController;
import dal.LeaveRequestDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.LeaveRequest;
import model.User;

/**
 *
 * @author ibm
 */
public class ControllerApplicationReview extends HttpServlet {

    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idParam = request.getParameter("id");


        if (idParam != null) {
            try {
                int id = Integer.parseInt(idParam);
                LeaveRequestDBContext dao = new LeaveRequestDBContext();
                LeaveRequest requestDetail = dao.getRequestById(id);

                if (requestDetail != null) {
                    request.setAttribute("requestDetail", requestDetail);
                    request.getRequestDispatcher("../../view/request/review.jsp").forward(request, response);
                    return;
                }
            } catch (NumberFormatException e) {
                request.setAttribute("error", "Invalid request ID.");
            }
        } else {
            request.setAttribute("error", "Request ID is missing.");
        }

        request.getRequestDispatcher("../../view/request/review.jsp").forward(request, response);
    }

}
