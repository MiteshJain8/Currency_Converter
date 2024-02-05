<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Currency Converter</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #003fac;
        }

        .login {
            text-align: center;
            width: 300px;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        form {
            /* Additional styling for the form if needed */
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            border-radius: 10px;
            margin: 5px 0;
            box-sizing: border-box;
            box-shadow: none;
            margin-top: 10px;
        }

        input[type="submit"] {
            width: 100%;
            font-size: 20px;
            padding: 10px;
            margin-top: 30px;
            background-color: #4caf50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        a {
            display: block;
            margin-top: 10px;
            text-align: center;
            color: azure;
        }

        label {
            font-size: 20px;
            color: white;
            margin-top: 20px;
        }

        h1 {
            color: white;
        }

        .login1 {
            text-align: center;
        }

        #b2c{
            color:yellow;
        }
    </style>
</head>
<body>
<form action="CCServlet" method="post">
    <label>From Currency:
        <input type="text" name="fromCurrency">
    </label>
    <br>
    <label>To Currency:
        <input type="text" name="toCurrency">
    </label>
    <br>
    <label>Amount:
        <input type="text" name="fromValue" value="0.0">
    </label>
    <br>
    <input type="submit" >
</form>
<h3>Result: ${result}</h3>
<!-- Link to weather.jsp -->
<a href="${pageContext.request.contextPath}/weather.jsp">Go to Weather</a>
</body>
</html>
