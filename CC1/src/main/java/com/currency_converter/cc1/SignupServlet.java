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
    private static final String JDBC_PASSWORD = "@1234sql#abc";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String gender = request.getParameter("gender");
        String nationality = request.getParameter("nationality");
        if (registerUser(username, password,gender,nationality)) {
            // Redirect to success page
            response.sendRedirect("login.jsp");
        } else {
            // Redirect to failure page
            // ...
        }
    }

    private boolean registerUser(String username, String password ,String gender, String nationality) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
                 PreparedStatement preparedStatement = connection.prepareStatement(
                         "INSERT INTO users1 (uname, upd ,uemail,umobile) VALUES (?, ?, ?, ?) ")) {

                preparedStatement.setString(1, username);
                preparedStatement.setString(2, password);
                preparedStatement.setString(3, gender);
                preparedStatement.setString(4, nationality);

                int result = preparedStatement.executeUpdate();

                return result > 0;
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            return false;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
