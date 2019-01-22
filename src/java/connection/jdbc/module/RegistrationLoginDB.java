/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package connection.jdbc.module;

import controller.servlet.module.RegistrationController;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import pojo.java.module.User;

/**
 *
 * @author partho
 */
public class RegistrationLoginDB {
    
    java.util.Date dt = new java.util.Date();
    static java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String currentTime = sdf.format(dt);
    String updateTime = sdf.format(dt);

    // User user = new User();
    public static void userRegistration(User user) {
        try {
            
            JdbcDao.openConnection();
            String sql = "insert into user(first_name,last_name,email,user_name,password, creation_dtm, update_dtm) values (?,?,?,?,?,?,?)";
            JdbcDao.ps = JdbcDao.connection.prepareStatement(sql);
            
            JdbcDao.ps.setString(1, user.getFirstName());
            JdbcDao.ps.setString(2, user.getLastName());
            JdbcDao.ps.setString(3, user.getEmail());
            JdbcDao.ps.setString(4, user.getUserName());
            JdbcDao.ps.setString(5, user.getPassword());
            JdbcDao.ps.setString(6, sdf.format(user.getCreationDtm()));
            JdbcDao.ps.setString(7, sdf.format(user.getUpdateDtm()));
            
            JdbcDao.ps.executeUpdate();
            //  request.getRequestDispatcher("blog.jsp").forward(request, response);
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(RegistrationController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
    public static boolean userLogin(User user) {
        
        try {
            String sql = "select * from user where user_name=? and password=?";
            
            JdbcDao.ps = JdbcDao.connection.prepareStatement(sql);
            
            JdbcDao.ps.setString(1, user.getUserName());
            JdbcDao.ps.setString(2, user.getPassword());
            
            JdbcDao.resultSet = JdbcDao.ps.executeQuery();
            
            if (JdbcDao.resultSet.next()) {
                user.setFirstName(JdbcDao.resultSet.getString("first_name"));
                return true;                
            }            
        } catch (SQLException ex) {
            Logger.getLogger(RegistrationLoginDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
        
    }
}
