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

    public Connection connection = null;
    public ResultSet resultSet = null;
    public Statement statement = null;
    public PreparedStatement ps = null;

    public JdbcDao() {

    }

    public void openConnection() throws SQLException, ClassNotFoundException {

        Class.forName("com.mysql.jdbc.Driver");
        connection =(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/softwareschooling", "root", "44633");

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
