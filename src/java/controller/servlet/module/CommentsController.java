/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.servlet.module;

import connection.jdbc.module.CommentsDB;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import pojo.java.module.Comment;

/**
 *
 * @author partho
 */
public class CommentsController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CommentsController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CommentsController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

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

        HttpSession session = request.getSession();

        int contentId = Integer.parseInt(request.getParameter("contentId"));
        System.out.println(contentId);
        int loginUserId = (int) session.getAttribute("loginuserid");
        System.out.println(loginUserId);
        String userComment = request.getParameter("usercomment");

        Comment comment = new Comment();

        comment.setCommentText(userComment);
        comment.setContentId(contentId);
        comment.setUserId(loginUserId);
        comment.setCreationDtm(dt);
        comment.setUpdateDtm(dt);

        CommentsDB commentsDB = new CommentsDB();
        if (commentsDB.setUserComment(comment) == true) {
            response.sendRedirect("/software-schooling/PostController?contentId="+contentId);
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
