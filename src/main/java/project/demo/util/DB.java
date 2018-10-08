package project.demo.util;

import com.mysql.jdbc.Driver;

import java.sql.*;

public class DB {
    private static final String URL = "jdbc:mysql:///?user=root&password=system";
    private static Connection connection;

    public static Connection getConnection() {
        if (connection == null) {
            try {
                new Driver();
                connection = DriverManager.getConnection(URL);
                return connection;
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return connection;
    }

    public static void close(ResultSet resultSet, PreparedStatement preparedStatement) {
        if (resultSet != null) {
            try {
                resultSet.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (preparedStatement != null) {
            try {
                preparedStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
