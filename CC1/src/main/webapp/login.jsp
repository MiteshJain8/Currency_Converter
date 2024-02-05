<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login Page</title>
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
<div class="loginimg">
    <img src="" alt="">
</div>
<div class="login1">
    <h1>B2B Login</h1>
    <div class="login">
        <form action="LoginServlet" method="post">
            <%--@declare id="username"--%><%--@declare id="password"--%>
                <label for="username">UserName</label>
            <input type="text" name="username" required><br>
            <label for="password">Password</label>
            <input type="password" name="password" required><br>
            <input type="submit" value="Submit">
            <a href="signup.jsp">Sign Up</a>
            <a href="" id="b2c">Click For B2C Transactions</a>
        </form>
    </div>
</div>
</body>
</html>
