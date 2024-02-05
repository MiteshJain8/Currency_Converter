package com.currency_converter.cc1;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/company";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "@1234sql#abc";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (authenticateUser(username, password)) {
            // Redirect to success page
            response.sendRedirect("index.jsp");
        } else {
            // Redirect to failure page
            response.sendRedirect("signup.jsp");
        }
    }

    private boolean authenticateUser(String username, String password) {
        try (Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM users1 WHERE uname = ? AND upd = ?")) {
            System.out.println(connection);
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password); // In a real-world scenario, hash the password before comparing

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                return resultSet.next(); // If there is a matching user, authentication succeeds
            }

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
