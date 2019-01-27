
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
public class UserProfileController extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        String firstName = request.getParameter("first_name");
        String lastName = request.getParameter("last_name");
        String email = request.getParameter("email");
        String userName = request.getParameter("user_name");
        String password = request.getParameter("password");
        
        User user = new User();
    
        HttpSession session = request.getSession();
        
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setEmail(email);
        user.setUserName(userName);
        user.setPassword(password);
        user.setUserId((int) session.getAttribute("userId"));
        RegistrationLoginDB.userProfileUpdation(user);
        
        if(RegistrationLoginDB.userProfileUpdation(user)== true){
           response.sendRedirect("personal_info.jsp");
        }
        
    }

 
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

   

}
