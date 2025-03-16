/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.auth;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Feature;
import model.Role;
import model.User;

/**
 *
 * @author ibm
 */
public abstract class BaseRequiredAuthenticationController extends HttpServlet {
    private User getAuthenticatedUser(HttpServletRequest req) {
        return (User) req.getSession().getAttribute("user");
    }
    
    private boolean isAuthorized(HttpServletRequest req, User u)
    {
        String visit_url = req.getServletPath();
        for (Role role : u.getRoles()) {
            for (Feature feature : role.getFeatures()) {
                if(feature.getUrl().equals(visit_url))
                    return true;
            }
        }
        return false;
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = getAuthenticatedUser(req);
        if (user != null && isAuthorized(req, user)) {
            //allow access
            doPost(req, resp, user);
        } else {
            resp.sendRedirect(req.getContextPath() + "/accessdenied");

        }
        
    }

    protected abstract void doPost(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException;

    protected abstract void doGet(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = getAuthenticatedUser(req);
        if (user != null && isAuthorized(req, user)) {
            //allow access
            doGet(req, resp, user);
        } else {
                        resp.sendRedirect(req.getContextPath() + "/accessdenied");

        }

    }
}
