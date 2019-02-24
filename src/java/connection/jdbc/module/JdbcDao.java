/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package connection.jdbc.module;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author partho
 */
public class JdbcDao {

    protected Connection connection = null;
    protected ResultSet resultSet = null;
    protected Statement statement = null;
    protected PreparedStatement ps = null;

    protected String driver = "com.mysql.jdbc.Driver";
    protected String databaseurl = "jdbc:mysql://localhost:3306/softwareschooling";
    protected String user = "root";
    protected String password = "44633";

    public JdbcDao() {

    }

    public void openConnection() throws SQLException, ClassNotFoundException {

        Class.forName(driver);
        connection = (Connection) DriverManager.getConnection(databaseurl, user, password);

    }

    public void closeConnection() {
        try {
            if (resultSet != null) {
                resultSet.close();
            }
            if (statement != null) {
                statement.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
        }
    }
}
