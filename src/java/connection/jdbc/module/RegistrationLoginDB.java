package connection.jdbc.module;

import controller.servlet.module.RegistrationController;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import pojo.java.module.ProfileImage;
import pojo.java.module.User;

/**
 *
 * @author partho
 *
 */
public class RegistrationLoginDB extends JdbcDao {

    java.util.Date dt = new java.util.Date();
    static java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String currentTime = sdf.format(dt);
    String updateTime = sdf.format(dt);

    // Registration for User........ 
    public boolean userRegistration(User userRegistration) {
        try {

            openConnection();
            String sql = "insert into user(first_name,last_name,email,user_name,password, creation_dtm, update_dtm) values (?,?,?,?,?,?,?)";

            ps = connection.prepareStatement(sql);

            ps.setString(1, userRegistration.getFirstName());
            ps.setString(2, userRegistration.getLastName());
            ps.setString(3, userRegistration.getEmail());
            ps.setString(4, userRegistration.getUserName());
            ps.setString(5, userRegistration.getPassword());
            ps.setString(6, sdf.format(userRegistration.getCreationDtm()));
            ps.setString(7, sdf.format(userRegistration.getUpdateDtm()));

            ps.executeUpdate();
            return true;

            //  request.getRequestDispatcher("blog.jsp").forward(request, response);
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(RegistrationController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return true;

    }

    public boolean afterCompleteRegistration(User afterUserRegistration) {

        try {
            String sql2 = "select * from user where user_name='" + afterUserRegistration.getUserName() + "'";
            ps = connection.prepareStatement(sql2);
            //JdbcDao.ps.setString(1, afterUserRegistration.getUserName());
            resultSet = ps.executeQuery();

            if (resultSet.next()) {
                afterUserRegistration.setUserName(resultSet.getString("user_name"));
                afterUserRegistration.setFirstName(resultSet.getString("first_name"));
                afterUserRegistration.setLastName(resultSet.getString("last_name"));
                afterUserRegistration.setEmail(resultSet.getString("email"));
                afterUserRegistration.setUserId(resultSet.getInt("user_id"));
                afterUserRegistration.setPassword(resultSet.getString("password"));
                return true;
            }

            //  request.getRequestDispatcher("blog.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(RegistrationController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return true;
    }

    // Login for User.......
    public boolean userLogin(User userLogin) {
        try {
            openConnection();

            String sql = "select * from user where user_name = ?";

            ps = connection.prepareStatement(sql);
            ps.setString(1, userLogin.getUserName());

            resultSet = ps.executeQuery();

            if (resultSet.next()) {
                userLogin.setUserName(resultSet.getString("user_name"));
                userLogin.setFirstName(resultSet.getString("first_name"));
                userLogin.setLastName(resultSet.getString("last_name"));
                userLogin.setEmail(resultSet.getString("email"));
                userLogin.setUserId(resultSet.getInt("user_id"));
                userLogin.setPassword(resultSet.getString("password"));
                return true;
            }

        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(RegistrationLoginDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;

    }

    // Update profile information for user.......
    public boolean userProfileUpdation(User userUpdation) {

        String sql = "update user set first_name=? ,last_name=?,email=?,user_name=?,password=? where user_id='" + userUpdation.getUserId() + "'";

        try {
            ps = connection.prepareStatement(sql);

            ps.setString(1, userUpdation.getFirstName());
            ps.setString(2, userUpdation.getLastName());
            ps.setString(3, userUpdation.getEmail());
            ps.setString(4, userUpdation.getUserName());
            ps.setString(5, userUpdation.getPassword());

            ps.executeUpdate();

            return true;
        } catch (SQLException ex) {
            Logger.getLogger(RegistrationLoginDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean setUserProfileImage(ProfileImage userImage) {
        try {
            openConnection();

            String sql = "insert into profileimage(img_name,img_path,user_id) values (?,?,?)";
            ps = connection.prepareStatement(sql);

            ps.setString(1, userImage.getImageName());
            ps.setString(2, userImage.getImagePath());
            ps.setInt(3, userImage.getUserId());

            ps.executeUpdate();
            return true;
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(RegistrationLoginDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean showUserImage(ProfileImage profileImage) {

        try {
            openConnection();

            String sql = "select * from profileimage where user_id=?";

            ps = connection.prepareStatement(sql);

            ps.setInt(1, profileImage.getUserId());
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(RegistrationLoginDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean updateImage(ProfileImage profileimage) {

        try {
            openConnection();
            String sql = "update profileimage set img_path=? where user_id=?";

            ps = connection.prepareStatement(sql);

            ps.setInt(1, profileimage.getUserId());
            ps.executeUpdate();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(RegistrationLoginDB.class.getName()).log(Level.SEVERE, null, ex);
        }

        return false;

    }

    public boolean userNameExistOrNot(String username) {

        try {
            openConnection();

            String searchUserName = "select user_name from user";
            ps = connection.prepareStatement(searchUserName);

            resultSet = ps.executeQuery();
            if( !resultSet.next()){
               
            }

            return true;

        } catch (SQLException | ClassNotFoundException ex) {
           return false;
        }
    }
    
    public User showUserDetails(int userId) {

        User userDetails = new User();
        try {
            openConnection();
            String sql2 = "select * from user where user_id='" + userId + "'";
            ps = connection.prepareStatement(sql2);
           // JdbcDao.ps.setString(1, afterUserRegistration.getUserName());
            resultSet = ps.executeQuery();

            
            if (resultSet.next()) {
                
                userDetails.setUserName(resultSet.getString("user_name"));
                userDetails.setFirstName(resultSet.getString("first_name"));
                userDetails.setLastName(resultSet.getString("last_name"));
                userDetails.setEmail(resultSet.getString("email"));
                userDetails.setUserId(resultSet.getInt("user_id"));
                userDetails.setPassword(resultSet.getString("password"));
                
                return userDetails;
            }

            //  request.getRequestDispatcher("blog.jsp").forward(request, response);
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(RegistrationController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return userDetails;
       
    }

}
