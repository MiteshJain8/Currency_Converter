<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Currency Converter</title>
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
