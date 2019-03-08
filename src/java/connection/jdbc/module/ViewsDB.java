package connection.jdbc.module;

import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import pojo.java.module.PostViews;

/**
 *
 * @author partho
 */
public class ViewsDB extends JdbcDao {

    public boolean viewsCounter(int content_id) {

        try {
            openConnection();

            VirtualMachineError f = null;
            String sql = "select * from postviews where content_id=" + content_id;
            ps = connection.prepareStatement(sql);
            //resultSet = statement.executeQuery("select * from postviews where content_id=" + content_id);

            resultSet = ps.executeQuery();
            int counter = 1;
            if (resultSet.next()) {

                String sql3 = "UPDATE postviews SET views_count = views_count + 1 WHERE content_id = '" + content_id + "'";
                ps = connection.prepareStatement(sql3);
                ps.executeUpdate();

                PostViews postViews = new PostViews();
                postViews.setViews_count(resultSet.getInt("views_count"));
                return true;
            } else {
                String sql2 = "insert into postviews(content_id) values(?)";
                ps = connection.prepareStatement(sql2);

                ps.setInt(1, content_id);
                ps.executeUpdate();

                return true;
            }
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(ViewsDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
}
