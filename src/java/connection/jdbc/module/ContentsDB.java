package connection.jdbc.module;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import pojo.java.module.Contents;
import pojo.java.module.Tag;

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
            // content.setViewsCounter(resultSet.getInt("views"));

            contentList.add(content);

        }
        return contentList;
    }

    public ArrayList<Contents> latestPost() throws SQLException, ClassNotFoundException {
        ArrayList<Contents> latestPostList = new ArrayList<>();

        openConnection();
        String sql = "SELECT * FROM contents ORDER BY creation_dtm DESC limit 3;";

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

    public int saveContents(Contents contents) {

        int lastContentId = 0;

        try {
            openConnection();
            statement = connection.createStatement(java.sql.ResultSet.TYPE_FORWARD_ONLY, java.sql.ResultSet.CONCUR_UPDATABLE);

            // resultSet = statement.executeQuery("SELECT content_id "
            //         + "FROM contents");
            // String sql = "insert into contents(content_title,content_text,creation_dtm,update_dtm,user_id) values(?,?,?,?,?)";
            String sql = "select * from contents";
            // ps = connection.prepareStatement(sql);

            resultSet = statement.executeQuery(sql);

            resultSet.moveToInsertRow();
            resultSet.updateString("content_title", contents.getContentTitle());
            resultSet.updateString("content_text", contents.getContentText());
            resultSet.updateString("creation_dtm", sdf.format(contents.getCreationDtm()));
            resultSet.updateString("update_dtm", sdf.format(contents.getUpdateDtm()));
            resultSet.updateInt("user_id", contents.getUserId());

            resultSet.insertRow();
            resultSet.last();

            int autoIncKeyFromRS = resultSet.getInt("content_id");

            System.out.println("Key returned for inserted row: "
                    + autoIncKeyFromRS);
            //
//
//            ps.setString(1, contents.getContentTitle());
//            ps.setString(2, contents.getContentText());
//            ps.setString(3, sdf.format(contents.getCreationDtm()));
//            ps.setString(4, sdf.format(contents.getUpdateDtm()));
//            ps.setInt(5, contents.getUserId());
            // resultSet.insertRow();
            //resultSet.last();
            // ps.executeUpdate();

            int autoIncKeyFromFunc = -1;
            resultSet = statement.executeQuery("SELECT LAST_INSERT_ID()");

            if (resultSet.next()) {
                autoIncKeyFromFunc = resultSet.getInt(1);

            } else {
                // throw an exception from here
            }

            System.err.println(autoIncKeyFromFunc);

            //inserting into tag....
            //dump......
//
//            String sql2 = "select max(content_id) from contents";
//
//            ps = connection.prepareStatement(sql2);
//            resultSet = ps.executeQuery();
//
//            
//            if (resultSet.next()) {
//                resultSet.getInt("content_id");
//            }
//
//            String sql3 = "insert into postviews(content_id) values(?)";
//            ps = connection.prepareStatement(sql3);
//
//            ps.setInt(1, lastContentId);
//            ps.executeUpdate();
            return autoIncKeyFromFunc;

        } //        finally {
        //
        //            if (rs != null) {
        //                try {
        //                    rs.close();
        //                } catch (SQLException ex) {
        //                    // ignore
        //                }
        //            }
        //
        //            if (stmt != null) {
        //                try {
        //                    stmt.close();
        //                } catch (SQLException ex) {
        //                    // ignore
        //                }
        //            }
        catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(ContentsDB.class.getName()).log(Level.SEVERE, null, ex);
        }

        return 0;
    }

    public boolean saveToContentTags(Tag tag, int contentId) {

        try {
            openConnection();

            String tagTitle = tag.getTagTitle();
            String[] seperatetag = tagTitle.split(",");

            for (String string : seperatetag) {
                if (string.equalsIgnoreCase("java")) {
                    String sql = "insert into contenttag(content_id,tag_id) values(?,?)";
                    ps = connection.prepareStatement(sql);
                    ps.setInt(1, contentId);
                    ps.setInt(2, 1);
                    ps.executeUpdate();
                }
                if (string.equalsIgnoreCase("javascript")) {
                    String sql = "insert into contenttag(content_id,tag_id) values(?,?)";
                    ps = connection.prepareStatement(sql);
                    ps.setInt(1, contentId);
                    ps.setInt(2, 2);
                    ps.executeUpdate();
                }
                if (string.equalsIgnoreCase("html")) {
                    String sql = "insert into contenttag(content_id,tag_id) values(?,?)";
                    ps = connection.prepareStatement(sql);
                    ps.setInt(1, contentId);
                    ps.setInt(2, 3);
                    ps.executeUpdate();
                }
                if (string.equalsIgnoreCase("css")) {
                    String sql = "insert into contenttag(content_id,tag_id) values(?,?)";
                    ps = connection.prepareStatement(sql);
                    ps.setInt(1, contentId);
                    ps.setInt(2, 4);
                    ps.executeUpdate();
                }
               if (string.equalsIgnoreCase("mysql")) {
                    String sql = "insert into contenttag(content_id,tag_id) values(?,?)";
                    ps = connection.prepareStatement(sql);
                    ps.setInt(1, contentId);
                    ps.setInt(2, 5);
                    ps.executeUpdate();
                }
                if (string.equalsIgnoreCase("rdms")) {
                    String sql = "insert into contenttag(content_id,tag_id) values(?,?)";
                    ps = connection.prepareStatement(sql);
                    ps.setInt(1, contentId);
                    ps.setInt(2, 6);
                    ps.executeUpdate();
                }
            }

            return true;
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(ContentsDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public ArrayList<Contents> getPostDetails(int contentsId) throws SQLException, ClassNotFoundException {
        ArrayList<Contents> latestPostList = new ArrayList<>();

        openConnection();
        String sql = "SELECT * FROM contents where content_id ='" + contentsId + "'";

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

//    public boolean saveInPostViews(PostViews saveInPostViews) {
//        try {
//            openConnection();
//
//            String sql = "insert into postviews(content_id) values(?)";
//            ps = connection.prepareStatement(sql);
//
//            ps.setInt(1, saveInPostViews.getContent_id());
//            ps.executeUpdate();
//
//            return true;
//        } catch (SQLException | ClassNotFoundException ex) {
//            Logger.getLogger(ContentsDB.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return false;
//    }
    public boolean saveContents(Contents contents, int l) {
        return true;
    }
}
