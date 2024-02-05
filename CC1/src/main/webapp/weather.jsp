<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Weather App</title>
    <link rel="stylesheet" href="style.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .mainContainer {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            text-align: center;
        }

        .searchInput {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-bottom: 20px;
        }

        #searchInput {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            width: 200px;
            margin-right: 10px;
        }

        #searchButton {
            background-color: #4caf50;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 10px;
            cursor: pointer;
        }

        .weatherDetails {
            display: flex;
            justify-content: space-around;
            align-items: center;
        }

        .weatherIcon img {
            width: 100px;
        }

        .weatherIcon h2 {
            font-size: 36px;
            margin: 10px 0;
        }

        .cityDetails,
        .windDetails {
            text-align: left;
        }

        .desc,
        .date {
            margin-bottom: 10px;
            color: #555;
        }

        .humidityBox,
        .windSpeed {
            display: flex;
            align-items: center;
            margin-top: 10px;
        }

        .humidity img,
        .windSpeed img {
            width: 30px;
            margin-right: 10px;
        }

        .humidity span,
        .wind span {
            font-weight: bold;
            margin-right: 5px;
        }

        .humidity h2,
        .wind h2 {
            font-size: 18px;
            margin: 0;
        }
    </style>
</head>

<body>

<div class="mainContainer">
    <form action="WeatherServlet" method="post" class="searchInput">
        <input type="text" placeholder="Enter City Name" id="searchInput" value="New Delhi" name="city" />
        <button id="searchButton"><i class="fa-solid fa-magnifying-glass"></i></button>
    </form>
    <div class="weatherDetails">
        <div class="weatherIcon">
            <img src="" alt="Clouds" id="weather-icon">
            <h2>${temperature} °C</h2>
            <input type="hidden" id="wc" value="${weatherCondition}"> </input>
        </div>

        <div class="cityDetails">
            <div class="desc"><strong>${city}</strong></div>
            <div class="date">${date}</div>
        </div>
        <div class="windDetails">
            <div class="humidityBox">
                <img src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhgr7XehXJkOPXbZr8xL42sZEFYlS-1fQcvUMsS2HrrV8pcj3GDFaYmYmeb3vXfMrjGXpViEDVfvLcqI7pJ03pKb_9ldQm-Cj9SlGW2Op8rxArgIhlD6oSLGQQKH9IqH1urPpQ4EAMCs3KOwbzLu57FDKv01PioBJBdR6pqlaxZTJr3HwxOUlFhC9EFyw/s320/thermometer.png" alt="Humidity">
                <div class="humidity">
                    <span>Humidity </span>
                    <h2>${humidity}% </h2>
                </div>
            </div>

            <div class="windSpeed">
                <img src="https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiyaIguDPkbBMnUDQkGp3wLRj_kvd_GIQ4RHQar7a32mUGtwg3wHLIe0ejKqryX8dnJu-gqU6CBnDo47O7BlzCMCwRbB7u0Pj0CbtGwtyhd8Y8cgEMaSuZKrw5-62etXwo7UoY509umLmndsRmEqqO0FKocqTqjzHvJFC2AEEYjUax9tc1JMWxIWAQR4g/s320/wind.png">
                <div class="wind">
                    <span>Wind Speed</span>
                    <h2> ${windSpeed} km/h</h2>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="weatherScript.js"></script>

</body>

</html>
