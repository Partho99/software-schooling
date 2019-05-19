/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package connection.jdbc.module;

import java.sql.SQLException;
import java.util.ArrayList;
import pojo.java.module.Contents;

/**
 *
 * @author partho
 */
public class TagsDB extends JdbcDao {

    public ArrayList<Contents> findByTags(String tagsName) throws SQLException, ClassNotFoundException {

        ArrayList<Contents> contentList = new ArrayList<>();

        openConnection();
        String sql = "select contents.content_id,contents.content_title,contents.content_text,contents.creation_dtm,"
                + "contents.update_dtm,contents.image_path,contents.is_active,"
                + "tags.tag_id,tags.tag_title from contents left join contenttag on "
                + "contents.content_id = contenttag.content_id right join tags on "
                + "contenttag.tag_id = tags.tag_id where tag_title='" + tagsName + "';";

        ps = connection.prepareStatement(sql);
        resultSet = ps.executeQuery();

        while (resultSet.next()) {

            Contents content = new Contents();
            content.setContentId(resultSet.getInt("content_id"));
            content.setContentText(resultSet.getString("content_text"));
            content.setContentTitle(resultSet.getString("content_title"));
            content.setCreationDtm(resultSet.getTimestamp("creation_dtm"));
            content.setUpdateDtm(resultSet.getTimestamp("update_dtm"));
            content.setImagePath(resultSet.getString("image_path"));
            content.setIsActive(resultSet.getInt("is_active"));
            // content.setViewsCounter(resultSet.getInt("views"));

            contentList.add(content);
        }
        return contentList;

    }
     public ArrayList<Contents> getDetailsofTech(String tagsName) throws SQLException, ClassNotFoundException {

        ArrayList<Contents> contentList = new ArrayList<>();

        openConnection();
        String sql = "select contents.content_id,contents.content_title,contents.content_text,contents.creation_dtm,"
                + "contents.update_dtm,contents.image_path,contents.is_active,"
                + "tags.tag_id,tags.tag_title from contents left join contenttag on "
                + "contents.content_id = contenttag.content_id right join tags on "
                + "contenttag.tag_id = tags.tag_id where tag_title='" + tagsName + "';";

        ps = connection.prepareStatement(sql);
        resultSet = ps.executeQuery();

        while (resultSet.next()) {

            Contents content = new Contents();
            content.setContentId(resultSet.getInt("content_id"));
            content.setContentText(resultSet.getString("content_text"));
            content.setContentTitle(resultSet.getString("content_title"));
            content.setCreationDtm(resultSet.getTimestamp("creation_dtm"));
            content.setUpdateDtm(resultSet.getTimestamp("update_dtm"));
            content.setImagePath(resultSet.getString("image_path"));
            content.setIsActive(resultSet.getInt("is_active"));
            // content.setViewsCounter(resultSet.getInt("views"));

            contentList.add(content);
        }
        return contentList;

    }
     
     public ArrayList<Contents> getPostDetails(int contentsId) throws SQLException, ClassNotFoundException {
        ArrayList<Contents> latestPostList = new ArrayList<>();

        openConnection();
        String sql = "SELECT * FROM contents where content_id ='" + contentsId + "'";

        ps = connection.prepareStatement(sql);
        resultSet = ps.executeQuery();

        if (resultSet.next()) {
            Contents content = new Contents();
            content.setContentId(resultSet.getInt("content_id"));
            content.setContentText(resultSet.getString("content_text"));
            content.setContentTitle(resultSet.getString("content_title"));
            content.setCreationDtm(resultSet.getTimestamp("creation_dtm"));
            content.setUpdateDtm(resultSet.getTimestamp("update_dtm"));
            content.setImagePath(resultSet.getString("image_path"));
            content.setIsActive(resultSet.getInt("is_active"));

            latestPostList.add(content);
        }
        return latestPostList;
    }
    

}
