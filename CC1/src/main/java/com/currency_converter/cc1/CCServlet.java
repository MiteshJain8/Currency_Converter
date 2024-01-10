package com.currency_converter.cc1;

import jakarta.json.Json;
import jakarta.json.JsonObject;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;

@WebServlet(name = "ccServlet", value = "/cc-servlet")
public class CCServlet extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        double amountToConvert = Double.parseDouble(request.getParameter("currName"));
        String toCurrency = request.getParameter("toCurrency");
        String apiKey = "fca_live_6YuSWca6tVLASZZpjOrMavJo4EVGg6DT3MMgwRL9"; // Replace with a secure method to obtain the API key

        String apiUrl = "https://api.freecurrencyapi.com/v1/latest?apikey=" + apiKey;

        try {
            URL url = new URL(apiUrl);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");

            try (BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()))) {
                StringBuilder responseBuilder = new StringBuilder();
                String line;
                while ((line = reader.readLine()) != null) {
                    responseBuilder.append(line);
                }

                // Parse the response using Jakarta JSON
                JsonObject responseJson = (JsonObject) Json.createReader(new StringReader(responseBuilder.toString())).readObject();

                // Get the conversion rate
                double conversionRate = responseJson.getJsonObject("data").getJsonNumber(toCurrency).doubleValue();

                // Perform the conversion
                double convertedAmount = amountToConvert * conversionRate;

                // Send the converted amount as a response
                response.setContentType("text/html");
                try (PrintWriter out = response.getWriter()) {
                    out.println("<html><body>");
                    out.println("<h2>Conversion Result:</h2>");
                    out.println("<p>Conversion Rate: " + conversionRate + "</p>");
                    out.println("<p>Converted Amount: " + convertedAmount + "</p>");
                    out.println("</body></html>");
                }
            } finally {
                connection.disconnect();
            }
        } catch (Exception e) {
            // Handle exceptions (e.g., network issues, API errors)
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error processing the request");
        }
    }
}
