// DatabaseUtil.java
package com.currency_converter.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class DatabaseUtil {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/company";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "@1234sql#abc";

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("Error loading JDBC driver", e);
        }
    }

    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
    }

    public static void executeSqlScript(String scriptPath, Connection connection) throws IOException, SQLException {
        try (InputStream inputStream = DatabaseUtil.class.getClassLoader().getResourceAsStream(scriptPath);
             InputStreamReader streamReader = new InputStreamReader(inputStream);
             BufferedReader bufferedReader = new BufferedReader(streamReader);
             Statement statement = connection.createStatement()) {

            StringBuilder sqlContent = new StringBuilder();
            String line;
            while ((line = bufferedReader.readLine()) != null) {
                sqlContent.append(line).append("\n");
            }

            String[] sqlCommands = sqlContent.toString().split(";");

            for (String sqlCommand : sqlCommands) {
                if (!sqlCommand.trim().isEmpty()) {
                    statement.addBatch(sqlCommand);
                }
            }

            statement.executeBatch();
        }
    }
}
