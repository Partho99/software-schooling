/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.servlet.module;

import connection.jdbc.module.RegistrationLoginDB;
import java.io.IOException;
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

        java.util.Date dt = new java.util.Date();
        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String currentTime = sdf.format(dt);
        String updateTime = sdf.format(dt);

        //for registration
        
        String firstName = request.getParameter("firstname");
        String lastName = request.getParameter("lastname");
        String email = request.getParameter("email");
        String userName = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmpassword");

       User user = new User();
       
       user.setFirstName(firstName);
       user.setLastName(lastName);
       user.setEmail(email);
       user.setUserName(userName);
       user.setPassword(password);
       user.setCreationDtm(dt);
       user.setUpdateDtm(dt);
       
       
        RegistrationLoginDB.userRegistration(user);
        
        //for login
        
        String loginUserName = request.getParameter("loginusername");
        String loginPassword = request.getParameter("loginpassword");
        
        User loginUser = new User();
        
        loginUser.setUserName(loginUserName);
        loginUser.setPassword(loginPassword);
        
        RegistrationLoginDB.userLogin(loginUser);
     
        if (RegistrationLoginDB.userLogin(loginUser) == true) {
            HttpSession session = request.getSession();
            session.setAttribute("loginfirstname", loginUser.getFirstName());
            session.setAttribute("loginlastname", loginUser.getLastName());
            session.setAttribute("loginemail", loginUser.getEmail());
            session.setAttribute("loginusername", loginUser.getUserName());
            session.setAttribute("userId", loginUser.getUserId());
            
            response.sendRedirect("index.jsp");
        } else {
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
