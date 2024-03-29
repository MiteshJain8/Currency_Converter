package com.currency_converter.cc1;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;
import com.currency_converter.util.DatabaseUtil;

public class CCServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public CCServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fromCurrency = request.getParameter("fromCurrency");
        String toCurrency = request.getParameter("toCurrency");
        double fromValue = Double.parseDouble(request.getParameter("fromValue"));

        String apiKey = "fca_live_6YuSWca6tVLASZZpjOrMavJo4EVGg6DT3MMgwRL9"; // Replace with a secure method to obtain the API key

        String apiUrl = "https://api.freecurrencyapi.com/v1/latest?apikey=" + apiKey + "&currencies=" + fromCurrency + "%2CUSD%2C" + toCurrency;
        HttpURLConnection connection = null;

        try {
            JsonObject jsonObject = getApiResponse(apiUrl);

            JsonObject rates = jsonObject.getAsJsonObject("data");

            double from = rates.get(fromCurrency).getAsDouble();
            double to = rates.get(toCurrency).getAsDouble();
            double result = fromValue * (to/from);
            System.out.println("result"+result);
            request.setAttribute("result", result);
            request.getRequestDispatcher("index.jsp").forward(request, response);
            String uname = request.getParameter("uname");
            String unation = request.getParameter("unation");
            String uemail = request.getParameter("uemail");
            String umobile = request.getParameter("umobile");
            int amount = (int) result;
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DatabaseUtil.getConnection();
            String sql = "INSERT INTO currencydb(uname, unation, uemail, umobile, fromcurrency, tocurrency, amount) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, uname);
            pstmt.setString(2, unation);
            pstmt.setString(3, uemail);
            pstmt.setString(4, umobile);
            pstmt.setString(5, fromCurrency);
            pstmt.setString(6, toCurrency);
            pstmt.setInt(7, amount);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } finally {
            if (connection != null) {
                connection.disconnect();
            }
        }
    }
    private JsonObject getApiResponse(String apiUrl) throws IOException {
        URL url = new URL(apiUrl);
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestMethod("GET");
        try (InputStream stream = connection.getInputStream();
             InputStreamReader reader = new InputStreamReader(stream);
             Scanner sc = new Scanner(reader)) {
            StringBuilder responseContent = new StringBuilder();
            while (sc.hasNext()) {
                responseContent.append(sc.nextLine());
            }
            Gson gson = new Gson();
            return gson.fromJson(responseContent.toString(), JsonObject.class);
        }
    }
}