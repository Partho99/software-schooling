/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.servlet.module;

import connection.jdbc.module.ContentsDB;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        java.util.Date dt = new java.util.Date();
        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String currentTime = sdf.format(dt);
        String updateTime = sdf.format(dt);

        Contents contents = new Contents();
        ContentsDB saveContents = new ContentsDB();

        String postTitle = request.getParameter("title");

        String postText = request.getParameter("description");

        contents.setContentTitle(postTitle);
        contents.setContentText(postText);
        contents.setCreationDtm(dt);
        contents.setUpdateDtm(dt);

        System.out.println(postText);
        if(saveContents.saveContents(contents) == true){
               
            }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
