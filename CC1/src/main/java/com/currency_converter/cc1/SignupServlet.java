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
import java.sql.SQLException;

@WebServlet("/SignupServlet")
public class SignupServlet extends HttpServlet {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/company";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "root";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        registerUser(username, password);
            // Redirect to success page
            response.sendRedirect("index.jsp");

            // Redirect to failure page


    }

    private boolean registerUser(String username, String password) {
        try (Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
             PreparedStatement preparedStatement = connection.prepareStatement(
                     "INSERT INTO users1 (uname, upd) VALUES (?, ?) ")) {

            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password); // In a real-world scenario, hash the password before storing

            int rowsAffected = preparedStatement.executeUpdate();
            return rowsAffected > 0; // If registration is successful, return true

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
