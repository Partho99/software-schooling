package connection.jdbc.module;

import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author partho
 */
public class VotingDB extends JdbcDao {

    public boolean upVoteCounting(int contentId, int userId) {

        try {
            openConnection();
            String sql = "select upvote from postvoting where user_id ='" + userId + "' and content_id='" + contentId + "'";

            ps = connection.prepareStatement(sql);

            resultSet = ps.executeQuery();

            if (resultSet.next()) {
                if (resultSet.getLong("upvote") > 0) {
                    String sql2 = "UPDATE postvoting SET upvote = 0 WHERE content_id = '" + contentId + "' and user_id = '" + userId + "'";
                    ps = connection.prepareStatement(sql2);
                    ps.executeUpdate();

                    return true;
                } else {
                    String sql2 = "UPDATE postvoting SET upvote = 1 , downvote = 0 WHERE content_id = '" + contentId + "' and user_id = '" + userId + "'";
                    ps = connection.prepareStatement(sql2);
                    ps.executeUpdate();

                    return true;
                }

            } else {

                String sql3 = "insert into postvoting(upvote,content_id,user_id) values(?,?,?)";

                ps = connection.prepareStatement(sql3);

                ps.setInt(1, 1);
                ps.setInt(2, contentId);
                ps.setInt(3, userId);

                ps.executeUpdate();

                return true;
            }

        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(VotingDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean downVoteCounting(int contentId, int userId) {

        try {
            openConnection();
            String sql = "select downvote from postvoting where user_id ='" + userId + "' and content_id='" + contentId + "'";

            ps = connection.prepareStatement(sql);

            resultSet = ps.executeQuery();

            if (resultSet.next()) {
                if (resultSet.getLong("downvote") > 0) {
                    String sql2 = "UPDATE postvoting SET downvote = 0 WHERE content_id = '" + contentId + "' and user_id = '" + userId + "'";
                    ps = connection.prepareStatement(sql2);
                    ps.executeUpdate();

                    return true;
                } else {
                    String sql2 = "UPDATE postvoting SET downvote = 1, upvote = 0 WHERE content_id = '" + contentId + "' and user_id = '" + userId + "'";
                    ps = connection.prepareStatement(sql2);
                    ps.executeUpdate();

                    return true;
                }

            } else {

                String sql3 = "insert into postvoting(upvote,content_id,user_id) values(?,?,?)";

                ps = connection.prepareStatement(sql3);

                ps.setInt(1, 1);
                ps.setInt(2, contentId);
                ps.setInt(3, userId);

                ps.executeUpdate();

                return true;
            }

        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(VotingDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public void voteCounter(int contentId) throws SQLException, ClassNotFoundException{
        
        openConnection();
        
        String sql = "select sum(upvote) from postvoting where content_id= "+contentId;
    }

}
