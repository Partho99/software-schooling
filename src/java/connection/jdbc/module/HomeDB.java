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
public class HomeDB extends  JdbcDao{
    
    
    public ArrayList<Contents> getPopularItems() throws SQLException, ClassNotFoundException {
        ArrayList<Contents> latestPostList = new ArrayList<>();

        openConnection();
        String sql = "select max(views) from contents group by views desc limit 3;";

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

            latestPostList.add(content);
        }
        return latestPostList;
    }
}
