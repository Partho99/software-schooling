package controller.servlet.module;

import connection.jdbc.module.RegistrationLoginDB;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.mindrot.jbcrypt.BCrypt;
import pojo.java.module.User;

/**
 *
 * @author partho
 *
 *
 */
public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        RegistrationLoginDB rlDB = new RegistrationLoginDB();
        //for login
        String loginUserName = request.getParameter("loginusername");
        String loginPassword = request.getParameter("loginpassword");

        User userLogin = new User();

        userLogin.setUserName(loginUserName);
        userLogin.setPassword(loginPassword);

        rlDB.userLogin(userLogin);

        if (rlDB.userLogin(userLogin) == true) {

            System.out.println(userLogin.getPassword());
            System.out.println(loginPassword.isEmpty());
            if ((loginUserName.equals(userLogin.getUserName())) && checkedPassword(loginPassword, userLogin.getPassword())) {

                HttpSession session = request.getSession();
                session.setAttribute("loginusername", userLogin.getUserName());
                session.setAttribute("loginuserid", userLogin.getUserId());
                int postId = 0;
                try {
                    postId = (int) session.getAttribute("contentId");

                    if (postId == 0) {

                        //request.getRequestDispatcher("index.jsp").forward(request, response);
                        response.sendRedirect("index.jsp");
                    } else {
                        response.sendRedirect("/software-schooling/PostController?contentId=" + postId);
                    }
                } catch (NullPointerException e) {
                    if (postId == 0) {

                        //request.getRequestDispatcher("index.jsp").forward(request, response);
                        response.sendRedirect("index.jsp");
                    } else {
                        response.sendRedirect("/software-schooling/PostController?contentId=" + postId);
                    }
                }

            } else {
                request.setAttribute("errorMessage", "Invalid username?password");
                request.getRequestDispatcher("/login_register.jsp").forward(request, response);
            }

        } else {
            request.getRequestDispatcher("/login_register.jsp").forward(request, response);
        }

    }

    // Password encryption code........
    private static final int workload = 12;

    public static String hashPassword(String plaintext_password) {
        String salt = BCrypt.gensalt(workload);
        String hashed_password = BCrypt.hashpw(plaintext_password, salt);
        return (hashed_password);
    }

    public static boolean checkedPassword(String plaintext_password, String stored_hash) {
        boolean password_verified;

        if (null == stored_hash || !stored_hash.startsWith("$2a$")) {
            throw new java.lang.IllegalArgumentException("Invalid hash provided for comparison");
        }

        password_verified = BCrypt.checkpw(plaintext_password, stored_hash);
        return (password_verified);

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
