package com.currency_converter.cc1;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.Gson;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Scanner;

@WebServlet("/MyServlet")
public class MyServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String OPEN_WEATHER_API_KEY = "Apni-Api-Key-Dalo";
    private static final String OPEN_WEATHER_API_URL = "https://api.openweathermap.org/data/2.5/weather";

    public MyServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("index.html");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String city = request.getParameter("city");

        try {
            String apiUrl = OPEN_WEATHER_API_URL + "?q=" + city + "&appid=" + OPEN_WEATHER_API_KEY;
            URL url = new URL(apiUrl);

            try (HttpURLConnection connection = (HttpURLConnection) url.openConnection()) {
                connection.setRequestMethod("GET");

                try (InputStream inputStream = connection.getInputStream();
                     InputStreamReader reader = new InputStreamReader(inputStream);
                     Scanner scanner = new Scanner(reader)) {

                    StringBuilder responseContent = new StringBuilder();

                    while (scanner.hasNext()) {
                        responseContent.append(scanner.nextLine());
                    }

                    Gson gson = new Gson();
                    JsonObject jsonObject = gson.fromJson(responseContent.toString(), JsonObject.class);

                    long dateTimestamp = jsonObject.get("dt").getAsLong() * 1000;
                    String date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date(dateTimestamp));

                    JsonElement temperatureKelvin = jsonObject.getAsJsonObject("main").get("temp");
                    double value = temperatureKelvin.getAsDouble() - 273.15;
                    int temperatureCelsius = (int) value;

                    JsonElement humidity = jsonObject.getAsJsonObject("main").get("humidity");
                    JsonElement windSpeed = jsonObject.getAsJsonObject("wind").get("speed");
                    JsonElement weatherCondition = jsonObject.getAsJsonArray("weather").get(0).getAsJsonObject().get("main");

                    request.setAttribute("date", date);
                    request.setAttribute("city", city);
                    request.setAttribute("temperature", temperatureCelsius);
                    request.setAttribute("weatherCondition", weatherCondition);
                    request.setAttribute("humidity", humidity);
                    request.setAttribute("windSpeed", windSpeed);
                    request.setAttribute("weatherData", responseContent.toString());
                }
            }
        } catch (IOException e) {
            // Handle the exception (log it or send a meaningful response to the client)
            e.printStackTrace();
        }

        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}
