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

/**
 *
 * @author partho
 */
public class JdbcDao {
    Connection connection = null;
    ResultSet resultSet = null;

    PreparedStatement ps = null;

    public Connection connect() {

        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/softwareschooling", "root", "44633");

            return connection;
        } catch (ClassNotFoundException | SQLException e) {
            // Handle exceptions    ...
            System.out.println("A problem accessing the database");
        }
        return connection;
    }
}
