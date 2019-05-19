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
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import pojo.java.module.Contents;

/**
 *
 * @author partho
 */
public class DetailsController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        TagsDB tags = new TagsDB();

        ArrayList<Contents> contents = new ArrayList<>();
        ArrayList<Contents> contentsTitle = new ArrayList<>();

        String technologyName = request.getParameter("technologyName");

        HttpSession session = request.getSession();
        session.setAttribute("technologyName", technologyName);

        try {
            int contentId = Integer.parseInt(request.getParameter("contentId"));
            if (contentId > 0) {

                contentsTitle = tags.getDetailsofTech(technologyName);
                contents = tags.getPostDetails(contentId);
                request.setAttribute("contents", contents);
                request.setAttribute("contentsTitle", contentsTitle);
                request.getRequestDispatcher("postDetails.jsp").forward(request, response);
            }

        } catch (NumberFormatException e) {

            try {

                contentsTitle = tags.getDetailsofTech(technologyName);
                contents = tags.getDetailsofTech(technologyName);

                request.setAttribute("contentsTitle", contentsTitle);
                request.setAttribute("contents", contents);
                request.getRequestDispatcher("postDetails.jsp").forward(request, response);
               
            } catch (SQLException | ClassNotFoundException ex) {
                Logger.getLogger(DetailsController.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(DetailsController.class.getName()).log(Level.SEVERE, null, ex);
        }

//        try {
//            contents = tags.getDetailsofTech(technologyName);
//        } catch (SQLException | ClassNotFoundException ex) {
//            Logger.getLogger(DetailsController.class.getName()).log(Level.SEVERE, null, ex); 
//        }
//
//        request.setAttribute("contents", contents);
//        request.getRequestDispatcher("postDetails.jsp").forward(request, response);
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
}
