/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package connection.jdbc.module;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import pojo.java.module.Comment;

/**
 *
 * @author partho
 */
public class CommentsDB extends JdbcDao {

    java.util.Date dt = new java.util.Date();
    static java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String currentTime = sdf.format(dt);
    String updateTime = sdf.format(dt);

    public boolean setUserComment(Comment comment) {

        try {
            openConnection();

            String sql = "insert into comment(comment_text,creation_dtm,update_dtm,user_id,content_id) values(?,?,?,?,?)";

            ps = connection.prepareStatement(sql);

            ps.setString(1, comment.getCommentText());
            ps.setString(2, sdf.format(comment.getCreationDtm()));
            ps.setString(3, sdf.format(comment.getUpdateDtm()));
            ps.setInt(4, comment.getUserId());
            ps.setInt(5, comment.getContentId());

            ps.executeUpdate();

            return true;

        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(CommentsDB.class.getName()).log(Level.SEVERE, null, ex);
        }

        return false;
    }

    public ArrayList<Comment> getCommentDetails(int contentsId) throws SQLException, ClassNotFoundException {
        ArrayList<Comment> comments = new ArrayList<>();

        openConnection();
        String sql = "SELECT * FROM comment where content_id ='" + contentsId + "'";

        ps = connection.prepareStatement(sql);
        resultSet = ps.executeQuery();

        while (resultSet.next()) {
            Comment comment = new Comment();
            comment.setCommentText(resultSet.getString("comment_text"));
            comment.setContentId(resultSet.getInt("content_id"));
            comment.setUserId(resultSet.getInt("user_id"));

            comments.add(comment);
        }
        return comments;
    }

}
