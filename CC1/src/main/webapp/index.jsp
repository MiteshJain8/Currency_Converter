<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Currency Converter</title>
</head>
<body>
<div class="container">

    <form action="CCServlet" method="post">
        <div>
            <label>Amount to be converted:</label>
            <input type="text" name="currName">
        </div>
        <div class="from-curr">
            <label>From Currency</label>
            <select name="fromCurrency">
                <option value="INR">INR</option>
                <option value="USD">USD</option>
                <option value="AUD">AUD</option>
                <!-- Add other currency options as needed -->
            </select>
        </div>
        <br>
        <div class="to-curr">
            <label>To Currency</label>
            <select name="toCurrency">
                <option value="INR">INR</option>
                <option value="USD">USD</option>
                <option value="AUD">AUD</option>
                <!-- Add other currency options as needed -->
            </select>
        </div>

        <!-- Add a submit button -->
        <div>
            <input type="submit" value="Convert">
        </div>
    </form>
</div>

</body>
</html>