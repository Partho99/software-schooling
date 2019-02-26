/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.servlet.module;

import connection.jdbc.module.CommentsDB;
import connection.jdbc.module.ContentsDB;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import pojo.java.module.Comment;
import pojo.java.module.Contents;

/**
 *
 * @author partho
 */
public class PostController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //ArrayList<Contents> contents = new ArrayList<>();
        ArrayList<Contents> postItem = new ArrayList<>();
        ArrayList<Contents> latestItem = new ArrayList<>();
        ArrayList<Comment> comments = new ArrayList<>();
        
        
        ContentsDB cDB = new ContentsDB();
        CommentsDB commentsDB = new CommentsDB();
        
        
        int contentId = Integer.parseInt(request.getParameter("contentId"));

        try {
            postItem = cDB.getPostDetails(contentId);
            latestItem = cDB.latestPost();
            comments = commentsDB.getCommentDetails(contentId);

        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(BlogController.class.getName()).log(Level.SEVERE, null, ex);
        }

//        for (Contents content : contents) {
//            System.out.println(content.getContentTitle());
//        }
        request.setAttribute("postitem", postItem);
        request.setAttribute("latestitem", latestItem);
        request.setAttribute("comments", comments);
        request.getRequestDispatcher("post.jsp").forward(request, response);
        // response.sendRedirect("blog.jsp");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
