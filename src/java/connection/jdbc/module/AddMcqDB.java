/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package connection.jdbc.module;

import controller.servlet.module.RegistrationController;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import pojo.java.module.MultipleChoiceQuestions;
import pojo.java.module.User;

/**
 *
 * @author partho
 */
public class AddMcqDB extends JdbcDao {

    @Override
    public void openConnection() throws SQLException, ClassNotFoundException {
        super.openConnection();
    }

    java.util.Date dt = new java.util.Date();
    static java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String currentTime = sdf.format(dt);
    String updateTime = sdf.format(dt);

    // Registration for User........ 
    public boolean setQuestion(MultipleChoiceQuestions mcq) {
        try {

            openConnection();
            String sql = "insert into multiple_choice_questions(question_text,question_tag,correct_answer,option_1,option_2, option_3, option_4) values (?,?,?,?,?,?,?)";

            ps = connection.prepareStatement(sql);

            ps.setString(1,mcq.getQuestionText());
            ps.setString(2,mcq.getQuestionTag());
            ps.setInt(3,mcq.getCorrectAnswer());
            ps.setString(4,mcq.getOption1());
            ps.setString(5,mcq.getOption2());
            ps.setString(6,mcq.getOption3());
            ps.setString(7,mcq.getOption4());

            ps.executeUpdate();
            return true;

            //  request.getRequestDispatcher("blog.jsp").forward(request, response);
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(RegistrationController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;

    }

}
