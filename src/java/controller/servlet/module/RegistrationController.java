/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.servlet.module;

import connection.jdbc.module.RegistrationLoginDB;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import pojo.java.module.User;

/**
 *
 * @author partho
 */
public class RegistrationController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        RegistrationLoginDB rlDB = new RegistrationLoginDB();

        java.util.Date dt = new java.util.Date();
        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String currentTime = sdf.format(dt);
        String updateTime = sdf.format(dt);

        HttpSession session = request.getSession();

        //for registration
        String firstName = request.getParameter("firstname");
        String lastName = request.getParameter("lastname");
        String email = request.getParameter("email");
        String userName = request.getParameter("username");

        if (rlDB.userNameExistOrNot(userName) == true) {
            System.out.println("success");
        } else {
            RequestDispatcher rd = request.getRequestDispatcher("login_register.jsp");
                        rd.forward(request, response);
        }
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmpassword");

        User user = new User();
        if (!firstName.isEmpty() || !lastName.isEmpty() || !email.isEmpty() || !userName.isEmpty() || !password.isEmpty()) {
            user.setFirstName(firstName);
            user.setLastName(lastName);
            user.setEmail(email);
            user.setUserName(userName);
            user.setPassword(LoginController.hashPassword(password));
            user.setCreationDtm(dt);
            user.setUpdateDtm(dt);

            rlDB.userRegistration(user);
            if (rlDB.afterCompleteRegistration(user) == true) {
                session.setAttribute("loginusername", user.getUserName());
                session.setAttribute("loginuserid", user.getUserId());

                int postId = 0;
                try {
                    postId = (int) session.getAttribute("contentId");
                    if (postId > 0) {

                        response.sendRedirect("/software-schooling/PostController?contentId=" + postId);
                    } else {
                        RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
                        rd.forward(request, response);
                    }
                } catch (NullPointerException e) {
                    RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
                    rd.forward(request, response);
                }

            }
        } else {
            response.sendRedirect("login_register.jsp");
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
