package connection.jdbc.module;

import java.sql.SQLException;
import java.util.ArrayList;
import pojo.java.module.Contents;

/**
 *
 * @author partho
 */
public class ContentsDB extends JdbcDao {

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

}
