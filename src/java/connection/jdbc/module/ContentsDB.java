package connection.jdbc.module;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import pojo.java.module.Contents;

/**
 *
 * @author partho
 */
public class ContentsDB extends JdbcDao {

    java.util.Date dt = new java.util.Date();
    static java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String currentTime = sdf.format(dt);
    String updateTime = sdf.format(dt);

    //Contents content = new Contents();
    public ArrayList<Contents> getAllContents() throws SQLException, ClassNotFoundException {
        ArrayList<Contents> contentList = new ArrayList<>();

        openConnection();

        String sql = "select * from contents";

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

            contentList.add(content);

        }
        return contentList;
    }

    public ArrayList<Contents> latestPost() throws SQLException, ClassNotFoundException {
        ArrayList<Contents> latestPostList = new ArrayList<>();

        openConnection();
        String sql = "SELECT * FROM contents ORDER BY creation_dtm DESC limit 5;";

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

            latestPostList.add(content);
        }
        return latestPostList;
    }

    public boolean saveContents(Contents contents) {

        boolean success = false;
        try {
            openConnection();

            String sql = "insert into contents(content_title,content_text,creation_dtm,update_dtm) values(?,?,?,?)";
            ps = connection.prepareStatement(sql);

            ps.setString(1, contents.getContentTitle());
            ps.setString(2, contents.getContentText());
            ps.setString(3, sdf.format(contents.getCreationDtm()));
            ps.setString(4, sdf.format(contents.getUpdateDtm()));
            
            ps.executeUpdate();
            
            return true;
            
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(ContentsDB.class.getName()).log(Level.SEVERE, null, ex);
        }

        return false;
    }
}
