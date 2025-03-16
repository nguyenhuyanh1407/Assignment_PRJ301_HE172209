package controller.auth;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import dal.UserDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.GoogleAccount;
import controller.GoogleLoginController;
import java.sql.SQLException;
import model.Role;
import model.User;

/**
 *
 * @author ibm
 */
public class ControllerLogin extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");

        String code = request.getParameter("code");
        String error = request.getParameter("error");

        if (error != null) {
            request.setAttribute("errorMessage", "Authorization failed or cancelled.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        if (code != null) {
            System.out.println("Google Code: " + code);
            GoogleLoginController googleLogin = new GoogleLoginController();
            try {
                String accessToken = googleLogin.getToken(code);
                System.out.println("Access Token: " + accessToken);

                GoogleAccount googleAccount = googleLogin.getUserInfo(accessToken);
                System.out.println("Google Account: " + googleAccount.getEmail());

                UserDBContext userDAO = new UserDBContext();
                User user = userDAO.getUserByEmail(googleAccount.getEmail());

                if (user == null) {
                    System.out.println("New user, creating account...");
                    user = new User();
                    user.setUsername(googleAccount.getEmail().split("@")[0]);
                    user.setEmail(googleAccount.getEmail());
                    user.setPassword(userDAO.generateRandomPassword());
                    String displayName = googleAccount.getName();
                    if (displayName == null || displayName.isEmpty()) {
                        displayName = user.getUsername();
                    }
                    user.setDisplayname(displayName);
                    userDAO.insertUser(user);
                    userDAO.insertUserRole(user.getUsername(), 3);



                    user = userDAO.getUserRoleByEmail(googleAccount.getEmail());
                    System.out.println("User created successfully: " + user.getUsername());
                } else {
                    user = userDAO.getUserRoleByEmail(googleAccount.getEmail());
                }

                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                System.out.println("User saved in session: " + session.getAttribute("user"));
                response.sendRedirect("homepage");
            } catch (IOException e) {
                e.printStackTrace();
                request.setAttribute("errorMessage", "Failed to retrieve user information from Google.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } else {
            System.out.println("Google login failed: No authorization code received.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

 @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String code = request.getParameter("code");

            if (code != null) {
                processRequest(request, response);
            } else {
                request.getRequestDispatcher("view/auth/login.jsp").forward(request, response);
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        if (username != null && password != null) {
            UserDBContext db = new UserDBContext();
            User user = db.get(username, password);

            if (user != null) {
                HttpSession session = req.getSession();
                session.setAttribute("user", user);
                System.out.println(user);
                resp.sendRedirect("homepage");
                return;
            } else {
                req.setAttribute("errorMessage", "Login failed! Invalid username or password.");
                req.getRequestDispatcher("view/auth/login.jsp").forward(req, resp);
                return;
            }
        } else {
            try {
                processRequest(req, resp);
            } catch (SQLException e) {
                throw new ServletException(e);
            }
        }
    }
}


