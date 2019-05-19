/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.servlet.module;

import connection.jdbc.module.AddMcqDB;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pojo.java.module.MultipleChoiceQuestions;

/**
 *
 * @author partho
 */
public class AddMcqController extends HttpServlet {

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String quetion = request.getParameter("question_text");
        String tags = request.getParameter("tags");     
        int correctChoice = Integer.parseInt( request.getParameter("correct_choice"));
        String option1 = request.getParameter("option1");
        String option2 = request.getParameter("option2");
        String option3 = request.getParameter("option3");
        String option4 = request.getParameter("option4");
        
        MultipleChoiceQuestions mcq = new MultipleChoiceQuestions();
        AddMcqDB amcqbd = new AddMcqDB();
        
        
        if( quetion != null && tags != null && option1 != null && option2 != null && option3 != null &&  option4 != null && correctChoice > 0){
            
            mcq.setQuestionText(quetion);
            mcq.setQuestionTag(tags);
            mcq.setCorrectAnswer(correctChoice);
            mcq.setOption1(option1);
            mcq.setOption2(option2);
            mcq.setOption3(option3);
            mcq.setOption4(option4);
            
            if(amcqbd.setQuestion(mcq) == true){
                response.sendRedirect("addMcq.jsp");
            }
            else{
               response.sendRedirect("index.jsp");
            }
            
            
            
        }
        
        
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
