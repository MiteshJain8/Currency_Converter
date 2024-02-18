<%--
  Created by IntelliJ IDEA.
  User: 91636
  Date: 05-02-2024
  Time: 21:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trip Planner</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <!-- <link rel="stylesheet" href="Home.css" /> -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Slab:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <style>
        * {
            margin: 0;
            padding: 0;
        }

        html {
            scroll-behavior: smooth;
        }

        .material-symbols-outlined {
            font-variation-settings:
                    'FILL' 0,
                    'wght' 400,
                    'GRAD' 0,
                    'opsz' 24
        }

        :root {
            --body-background-color: rgb(0, 20, 5);
            --head-foot-background-color: rgb(7, 51, 58);
            --head-foot-color: white;
            --head-foot-hover: rgb(184, 245, 234);
            --line: aqua;
        }

        .light-mode {
            --body-background-color: rgb(169, 225, 230);
            --head-foot-background-color: rgb(0, 217, 255);
            --head-foot-color: rgb(0, 0, 0);
            --head-foot-hover: rgb(177, 219, 224);
            --line: rgb(136, 136, 189);
        }

        body {
            font-family: 'Roboto Slab', serif;
            background-color: var(--body-background-color);
            margin: 0;
        }
        #mode{
            margin-top: 15px;
            margin-right: 20px;
        }
        nav {
            display: flex;
            justify-content: space-around;
            align-items: center;
            background-color: var(--head-foot-background-color);
            padding: .5rem 0;
        }

        .left {
            width: 55%;
            font-size: 2.2rem;
            color: var(--head-foot-color);
        }

        .left > em:nth-child(1) {
            padding-left: 4%;
            padding-right: 4%;
        }
        .right {
            width: 45%;
            font-size: 1.2rem;

        }

        .right ul {
            display: flex;
            list-style: none;
            justify-content: space-between;
            align-items: center;
        }

        .right ul li a {
            text-decoration: none;
            color: var(--head-foot-color);
        }

        .right ul li a:hover {
            color: var(--head-foot-hover);
            text-decoration: underline;
        }

        .leftsect div span {
            color: rgb(0, 100, 0);
        }

        .sect {
            display: flex;
            justify-content: space-around;
            margin-top: 3rem;
        }

        .sect div {
            width: 50%;
        }

        .rightsect img {
            image-rendering: crisp-edges;
            width: 100%;
        }

        .leftsect {
            font-size: 3rem;
            padding: .5rem;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: left;
            color: rgb(0, 150, 0);
        }
        #img3{
            border-radius: 5rem;

        }
        .leftsect div {
            width: 70%;
        }

        .rightsect {
            width: 70% !important;
        }

        .btn {
            display: flex;
            justify-content: space-evenly;
            align-items: center;
        }

        .btn button {
            margin: .5rem 0 0 0;
            font-size: 1.3rem;
            border-color: rgb(0, 0, 0);
            background-color: darkgreen;
            color: white;
            padding: 3px 3px;
            border-radius: 4px;
        }

        .btn button:hover {
            border-color: rgb(255, 255, 255);
        }

        .main {
            margin: 1.5rem 5rem;
            display: flex;
            justify-content: space-between;
        }

        .card {
            width: 32% !important;
        }

        .sect2 {
            margin-top: 1.5rem;
        }

        .sect2 h1 {
            font-size: 1.7rem;
            margin-left: 10vw;
            color: var(--head-foot-color);
        }

        .box {
            display: flex;
            justify-content: flex-start;
        }

        .verticalLineSkills {
            background-color: var(--line);
            height: 35.3vw;
            width: 2px;
            margin-left: 12vw;
        }

        .verticalLineExp {
            background-color: var(--line);
            height: 35.3vw;
            width: 2px;
            margin-left: 12vw;
        }

        .verticalLineLangs {
            background-color: var(--line);
            height: 49.4vw;
            width: 2px;
            margin-left: 12vw;
        }

        .horizontal {
            display: flex;
            align-items: center;
        }

        .horizontalLine {
            background-color: var(--line);
            height: .1vw;
            width: 7vw;
            margin: 7vw 0;
        }

        .spandescript {
            color: rgb(0, 150, 0);
        }

        .spandescript b {
            padding: 0 1vw;
            font-size: 1.5rem;
            color: rgb(0, 130, 0);
            width: 15vw;
        }

        footer {
            display: flex;
            justify-content: space-around;
            align-items: center;
            background-color: var(--head-foot-background-color);
            padding: .5rem 0;
        }

        footer div {
            color: var(--head-foot-color);
            font-size: 1.2rem;
            margin: .3rem 0;
        }

        .foot1 a {
            text-decoration: none;
            color: var(--head-foot-color);
            transition: 1s ease-in-out;
        }

        .foot1 a:hover {
            color: var(--head-foot-hover);
            text-decoration: underline;
        }

        .foot1 a:hover span {
            transform: translateY(-5px);
        }

        .foot3 ul {
            display: flex;
            list-style: none;
            justify-content: space-between;
        }

        .foot3 ul li {
            padding: 10%;
            font-size: xx-large;
        }
        @media screen and (max-width: 900px) {
            nav {
                display: flex;
                flex-direction: column;
            }

            .sect {
                display: flex;
                flex-direction: column-reverse;
                align-items: center;
            }

            .sect div {
                width: fit-content;
            }

            .left {
                width: fit-content;
            }

            .right {
                width: 100%;
            }

            .right ul {
                display: flex;
                list-style: none;
                justify-content: space-around;
            }

            .leftsect {
                display: flex;
                align-items: flex-start;
            }

            .btn {
                width: 60% !important;
            }

            .btn button {
                font-size: 1.2rem;
            }

            footer div {
                font-size: 1.05rem;
            }
        }

        @media screen and (max-width: 570px) {
            .leftsect {
                font-size: 2.5rem;
            }

            .horizontal h3 {
                display: inline;
                font-size: 1.3rem;
            }

            .horizontal p {
                display: inline;
                font-size: 1.1rem;
            }

            .btn {
                width: 70% !important;
            }

            .btn button {
                font-size: 1.1rem;
            }

            footer {
                display: flex;
                flex-direction: column;
            }

            footer div {
                font-size: 1rem;
            }
        }

        @media screen and (max-width: 400px) {
            .leftsect {
                font-size: 2.3rem;
            }

            .horizontal h3 {
                display: inline;
                font-size: 1.2rem;
            }

            .horizontal p {
                display: inline;
                font-size: 0.9rem;
            }

            .btn {
                width: 80% !important;
            }

            .btn button {
                font-size: 1rem;
            }

            footer div {
                font-size: 0.9rem;
            }
        }

    </style>
</head>

<body>
<header>
    <nav>
        <div class="left"><em>Trip Planner</em></div>
        <div class="right">
            <ul>
                <li><a href="Home.jsp">Home</a></li>
                <li><a href="#">Contact Us</a></li>
                <li><a href="login.jsp">Login/Signup</a></li>
                <li><a href="#"><span class="material-symbols-outlined" id="mode"> light_mode </span></a></li>
            </ul>
        </div>
    </nav>
</header>

<main class="main">
    <div class="card" style="width: 18rem;">
        <img class="card-img-top" src="logos/currconver.png" alt="Card image cap">
        <div class="card-body">
            <h5 class="card-title">Currency Conversion</h5>
            <p class="card-text">Embark on a seamless journey with our travel assistance app, your ultimate companion for exploring new destinations. Tailored to your wanderlust, this app offers comprehensive information about any place you wish to discover. Effortlessly plan your itinerary with details on local attractions, dining hotspots, cultural gems, and more. Utilize the app's intuitive navigation to find the best routes and transportation options. Immerse yourself in the essence of each destination through curated insights, ensuring a truly enriched travel experience.</p>
            <a href="index.jsp" class="btn btn-primary">Go <span class="material-symbols-outlined">
                arrow_forward
                </span></a>
        </div>
    </div>
    <div class="card" style="width: 18rem;">
        <img class="card-img-top" src="logos/weather.png" alt="Card image cap">
        <div class="card-body">
            <h5 class="card-title">Weather Details</h5>
            <p class="card-text">With precision forecasting technology, you receive real-time updates on temperature, humidity, wind speed, and more, ensuring you're equipped with the most relevant data for your surroundings.  The app's intuitive design makes it easy to access location-based weather details effortlessly and accurately . Whether you're planning a weekend getaway or a daily commute, stay informed about current conditions and future forecasts with just a glance.
                The app also tends to provide a seamless experiance in acccordance to get the weather report of a given location.
            </p>
            <a href="weather.jsp" class="btn btn-primary">Go <span class="material-symbols-outlined">
                arrow_forward
                </span></a>
        </div>
    </div>
    <div class="card" style="width: 18rem;">
        <img class="card-img-top" src="logos/travel.png" alt="Card image cap" id="img3">
        <div class="card-body">
            <h5 class="card-title">Trip Locations</h5>
            <p class="card-text">Embark on a seamless journey with our travel assistance app, your ultimate companion for exploring new destinations. Tailored to your wanderlust, this app offers comprehensive information about any place you wish to discover. Effortlessly plan your itinerary with details on local attractions, dining hotspots, cultural gems, and more. Utilize the app's intuitive navigation to find the best routes and transportation options. Immerse yourself in the essence of each destination through curated insights, ensuring a truly enriched travel experience.</p>
            <a href="tripAdvisor.jsp " class="btn btn-primary">Go <span class="material-symbols-outlined">
                arrow_forward
                </span></a>
        </div>
    </div>
</main>
<footer>
    <div class="foot1">
        <a href="#">Back to top
            <span class="material-symbols-outlined"> arrow_upward </span></a>
    </div>
    <div class="foot2">Copyright &#169; | All rights reserved</div>
    <div class="foot3">
        <ul>
            <li><a href="#"><i class="fa-brands fa-square-facebook"></i></a></li>
            <li><a href="#"><i class="fa-brands fa-square-x-twitter"></i></a></li>
            <li><a href="#"><i class="fa-brands fa-instagram"></i></a></li>
        </ul>
    </div>
</footer>

</body>

<script src="https://kit.fontawesome.com/c8b058a2d4.js" crossorigin="anonymous"></script>

<script>
    var icon = document.getElementById("mode");
    icon.onclick = function () {
        document.body.classList.toggle("light-mode");
        if (document.body.classList.contains("light-mode")) {
            icon.innerHTML = "dark_mode";
        } else {
            icon.innerHTML = "light_mode";
        }
    }
</script>

</html>
