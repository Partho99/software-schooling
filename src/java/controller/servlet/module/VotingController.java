/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.servlet.module;

import connection.jdbc.module.VotingDB;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author partho
 */
public class VotingController extends HttpServlet {

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        
        HttpSession session = request.getSession();
        int contentId =  Integer.parseInt(request.getParameter("contentid"));
        
        
        String upvote = request.getParameter("upvote");
        String downvote = request.getParameter("downvote");
        
        VotingDB voting =  new VotingDB();
        
       
            try {
            int userId =  (int) session.getAttribute("loginuserid");
            
             if("upvote".equals(upvote)){
           if( voting.upVoteCounting(contentId, userId) == true){
               response.sendRedirect("/software-schooling/PostController?contentId="+contentId);
           }
        }
        
        if("downvote".equals(downvote)){
            
             if( voting.downVoteCounting(contentId, userId) == true){
               response.sendRedirect("/software-schooling/PostController?contentId="+contentId);
           }
        }
        } catch (NullPointerException e) {
                request.setAttribute("postid", contentId);
                request.getRequestDispatcher("login_register.jsp").forward(request, response);
            //response.sendRedirect("login_register.jsp");
        }
        
       
        
        
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
