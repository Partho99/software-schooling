/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.servlet.module;

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
import pojo.java.module.Contents;

/**
 *
 * @author partho
 */
public class BlogController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ArrayList<Contents> contents = new ArrayList<>();
        ContentsDB cDB = new ContentsDB();
        try {
            contents = cDB.getAllContents();

        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(BlogController.class.getName()).log(Level.SEVERE, null, ex);
        }

        for (Contents content : contents) {
            System.out.println(content.getContentTitle());
        }

        
            request.setAttribute("BlogContents", contents);
            request.getRequestDispatcher("blog.jsp").forward(request, response);
        

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
