/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.servlet.module;

import connection.jdbc.module.JdbcDao;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

        String firstName = request.getParameter("firstname");
        String lastName = request.getParameter("lastname");
        String email = request.getParameter("email");
        String userName = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmpassword");

        JdbcDao jdbcDao = new JdbcDao();
        try {

            jdbcDao.openConnection();
            String sql = "insert into user(first_name,last_name,email,user_name,password, creation_dtm, update_dtm) values (?,?,?,?,?,?,?)";
            jdbcDao.ps = jdbcDao.connection.prepareStatement(sql);

            jdbcDao.ps.setString(1, firstName);
            jdbcDao.ps.setString(2, lastName);
            jdbcDao.ps.setString(3, email);
            jdbcDao.ps.setString(4, userName);
            jdbcDao.ps.setString(5, password);
            jdbcDao.ps.setString(6, currentTime);
            jdbcDao.ps.setString(7, currentTime);

            jdbcDao.ps.executeUpdate();
              request.getRequestDispatcher("blog.jsp").forward(request, response);
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(RegistrationController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
