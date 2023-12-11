package com.currency_converter.cc1;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;

import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/hello-servlet")
public class CCServlet extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");

        // Hello
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h1>" + message + "</h1>");
        out.println("</body></html>");
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int currency = Integer.parseInt(request.getParameter("currName"));
        String apiKey = "fca_live_6YuSWca6tVLASZZpjOrMavJo4EVGg6DT3MMgwRL9";
        String from = request.getParameter("fromCurrency");
        String to = request.getParameter("toCurrency");
        String apiUrl = "https://api.freecurrencyapi.com/v1/latest?apikey=fca_live_6YuSWca6tVLASZZpjOrMavJo4EVGg6DT3MMgwRL9";
        URL url = new URL(apiUrl);
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestMethod("GET");
        InputStream inputStream = connection.getInputStream();
        InputStreamReader inputStreamReader = new InputStreamReader(inputStream);



    }

    public void destroy() {
    }
}