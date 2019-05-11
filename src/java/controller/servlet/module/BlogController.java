/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.servlet.module;

import connection.jdbc.module.ContentsDB;
import connection.jdbc.module.TagsDB;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import pojo.java.module.ContentTag;
import pojo.java.module.Contents;
import pojo.java.module.Tag;

/**
 *
 * @author partho
 */
public class BlogController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String tagName = request.getParameter("tagName");
        
        if(tagName != null){
            ArrayList<Contents> latestpost = new ArrayList<>();
            ArrayList<Contents> tagContents = new ArrayList<>();
            ContentsDB cDB = new ContentsDB();
           
            TagsDB tagsDb = new TagsDB();
           try {

            tagContents = tagsDb.findByTags(tagName);
            latestpost = cDB.latestPost();
            

        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(BlogController.class.getName()).log(Level.SEVERE, null, ex);
        }

//        for (Contents content : contents) {
//            System.out.println(content.getContentTitle());
//        }
        request.setAttribute("BlogContents", tagContents);
        request.setAttribute("latestpost", latestpost);
        request.getRequestDispatcher("blog.jsp").forward(request, response);
        }
        else{
            
        ArrayList<Contents> contents = new ArrayList<>();
        ArrayList<Contents> latestpost = new ArrayList<>();
        ContentsDB cDB = new ContentsDB();

        try {

            contents = cDB.getAllContents();
            latestpost = cDB.latestPost();

        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(BlogController.class.getName()).log(Level.SEVERE, null, ex);
        }

//        for (Contents content : contents) {
//            System.out.println(content.getContentTitle());
//        }
        request.setAttribute("BlogContents", contents);
        request.setAttribute("latestpost", latestpost);
        request.getRequestDispatcher("blog.jsp").forward(request, response);
        // response.sendRedirect("blog.jsp");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        int userId = (int) session.getAttribute("loginuserid");
        java.util.Date dt = new java.util.Date();
        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String currentTime = sdf.format(dt);
        String updateTime = sdf.format(dt);

        Contents contents = new Contents();
        ContentsDB saveContents = new ContentsDB();

        String postTitle = request.getParameter("title");

        String postText = request.getParameter("description");
        String tagName = request.getParameter("tag");

        contents.setContentTitle(postTitle);
        contents.setContentText(postText);
        contents.setCreationDtm(dt);
        contents.setUpdateDtm(dt);
        contents.setUserId(userId);
        
        Tag  tag = new Tag();
        
        int contentId = saveContents.saveContents(contents);
        
        if (contentId > 0) {
            
            tag.setTagTitle(tagName);
            if(saveContents.saveToContentTags(tag,contentId) == true){
                response.sendRedirect("/software-schooling/BlogController");
            }
            
            // if()
            
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
