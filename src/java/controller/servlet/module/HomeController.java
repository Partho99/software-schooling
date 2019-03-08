/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


package controller.servlet.module;

import connection.jdbc.module.ContentsDB;
import connection.jdbc.module.HomeDB;
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
public class HomeController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
         ArrayList<Contents> popularItems = new ArrayList<>();
        ArrayList<Contents> latestpost = new ArrayList<>();
        ContentsDB cDB = new ContentsDB();
        HomeDB getPopularItem =new  HomeDB();

        try {
            popularItems = getPopularItem.getPopularItems();

        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(BlogController.class.getName()).log(Level.SEVERE, null, ex);
        }

//        for (Contents content : contents) {
//            System.out.println(content.getContentTitle());
//        }

        request.setAttribute("popularItems", popularItems);
        //request.setAttribute("latestpost", latestpost);
        request.getRequestDispatcher("index.jsp").forward(request, response);
        // response.sendRedirect("blog.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    public String getServletInfo(){
        return "Short description";
    }// </editor-fold>

}
