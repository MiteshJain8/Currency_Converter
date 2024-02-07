<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>

<html lang="en">



<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Currency Converter</title>



    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <%-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js">--%>

    <%-- </script>--%>

    <%-- <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js">--%>

    <%-- </script>--%>

<%--    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js">--%>

<%--    </script>--%>



    <link rel="preconnect" href="https://fonts.gstatic.com">

    <link
            href="https://fonts.googleapis.com/css2?family=Amiri&family=Lobster&family=Pacifico&display=swap"
            rel="stylesheet">



    <!-- linking style.css file-->

    <link rel="stylesheet" href="index.css">

</head>



<body>



<!-- Currency Converter  -->

<h1 class="heading text-center display-2">

    Currency Converter</h1>



<hr>

<div class="container">


    <form action="CCServlet" method="post">
        <div class="main">



            <div class="form-group">

                <%--@declare id="passenger" --%><label for="Passenger">

                Passenger Name :

            </label>

                <input type="text" class="form-control searchBox" name="uname">

            </div>

            <div class="form-group">

                <%--@declare id="nationality" --%><label for="Nationality">

                Nationality :

            </label>

                <input type="text" class="form-control searchBox" name="unation">

            </div>

            <div class="form-group">

                <%--@declare id="mail" --%><label for="mail">

                E-mail :

            </label>

                <input type="email" class="form-control searchBox" name="uemail" placeholder="@xyz.com">

            </div>

            <div class="form-group">

                <%--@declare id="mobile" --%><label for="Mobile">

                Mobile Number :

            </label>

                <input type="number" class="form-control searchBox" name="umobile">

            </div>



            <div class="row">

                <div class="col-sm-6">

                    <div class="input-group mb-3">

                        <div class="input-group-prepend">

                            <span class="input-group-text">From</span>

                        </div>

                        <select class="form-control from" id="sel1" name="fromCurrency">

                            <option value="">Select One …</option>

                            <option value="USD">USD</option>

                            <option value="AED">AED</option>

                            <option value="ARS">ARS</option>

                            <option value="AUD">AUD</option>

                            <option value="BGN">BGN</option>

                            <option value="BRL">BRL</option>

                            <option value="BSD">BSD</option>

                            <option value="CAD">CAD</option>

                            <option value="CHF">CHF</option>

                            <option value="CLP">CLP</option>

                            <option value="CNY">CNY</option>

                            <option value="COP">COP</option>

                            <option value="CZK">CZK</option>

                            <option value="DKK">DKK</option>

                            <option value="DOP">DOP</option>

                            <option value="EGP">EGP</option>

                            <option value="EUR">EUR</option>

                            <option value="FJD">FJD</option>

                            <option value="GBP">GBP</option>

                            <option value="GTQ">GTQ</option>

                            <option value="HKD">HKD</option>

                            <option value="HRK">HRK</option>

                            <option value="HUF">HUF</option>

                            <option value="IDR">IDR</option>

                            <option value="ILS">ILS</option>

                            <option value="INR">INR</option>

                            <option value="ISK">ISK</option>

                            <option value="JPY">JPY</option>

                            <option value="KRW">KRW</option>

                            <option value="KZT">KZT</option>

                            <option value="MVR">MVR</option>

                            <option value="MXN">MXN</option>

                            <option value="MYR">MYR</option>

                            <option value="NOK">NOK</option>

                            <option value="NZD">NZD</option>

                            <option value="PAB">PAB</option>

                            <option value="PEN">PEN</option>

                            <option value="PHP">PHP</option>

                            <option value="PKR">PKR</option>

                            <option value="PLN">PLN</option>

                            <option value="PYG">PYG</option>

                            <option value="RON">RON</option>

                            <option value="RUB">RUB</option>

                            <option value="SAR">SAR</option>

                            <option value="SEK">SEK</option>

                            <option value="SGD">SGD</option>

                            <option value="THB">THB</option>

                            <option value="TRY">TRY</option>

                            <option value="TWD">TWD</option>

                            <option value="UAH">UAH</option>

                            <option value="UYU">UYU</option>

                            <option value="ZAR">ZAR</option>

                        </select>

                    </div>

                </div>



                <div class="col-sm-6">

                    <div class="input-group mb-3">

                        <div class="input-group-prepend">

                            <span class="input-group-text">To</span>

                        </div>

                        <select class="form-control to" id="sel2" name="toCurrency">

                            <option value="">Select One …</option>

                            <option value="USD">USD</option>

                            <option value="AED">AED</option>

                            <option value="ARS">ARS</option>

                            <option value="AUD">AUD</option>

                            <option value="BGN">BGN</option>

                            <option value="BRL">BRL</option>

                            <option value="BSD">BSD</option>

                            <option value="CAD">CAD</option>

                            <option value="CHF">CHF</option>

                            <option value="CLP">CLP</option>

                            <option value="CNY">CNY</option>

                            <option value="COP">COP</option>

                            <option value="CZK">CZK</option>

                            <option value="DKK">DKK</option>

                            <option value="DOP">DOP</option>

                            <option value="EGP">EGP</option>

                            <option value="EUR">EUR</option>

                            <option value="FJD">FJD</option>

                            <option value="GBP">GBP</option>

                            <option value="GTQ">GTQ</option>

                            <option value="HKD">HKD</option>

                            <option value="HRK">HRK</option>

                            <option value="HUF">HUF</option>

                            <option value="IDR">IDR</option>

                            <option value="ILS">ILS</option>

                            <option value="INR">INR</option>

                            <option value="ISK">ISK</option>

                            <option value="JPY">JPY</option>

                            <option value="KRW">KRW</option>

                            <option value="KZT">KZT</option>

                            <option value="MVR">MVR</option>

                            <option value="MXN">MXN</option>

                            <option value="MYR">MYR</option>

                            <option value="NOK">NOK</option>

                            <option value="NZD">NZD</option>

                            <option value="PAB">PAB</option>

                            <option value="PEN">PEN</option>

                            <option value="PHP">PHP</option>

                            <option value="PKR">PKR</option>

                            <option value="PLN">PLN</option>

                            <option value="PYG">PYG</option>

                            <option value="RON">RON</option>

                            <option value="RUB">RUB</option>

                            <option value="SAR">SAR</option>

                            <option value="SEK">SEK</option>

                            <option value="SGD">SGD</option>

                            <option value="THB">THB</option>

                            <option value="TRY">TRY</option>

                            <option value="TWD">TWD</option>

                            <option value="UAH">UAH</option>

                            <option value="UYU">UYU</option>

                            <option value="ZAR">ZAR</option>

                        </select>

                    </div>

                </div>

            </div>

            <div class="form-group">

                <label for="oamount">

                    Amount to Convert :

                </label>

                <input type="text" class="form-control searchBox" placeholder="0.00" id="oamount"
                       name="fromValue">

            </div>


            <div class="text-center">



                <!-- convert button -->

                <button class="btn btn-primary convert m-2" type="submit">

                    Convert

                </button>



                <!-- reset button -->

                <button class="btn btn-primary m-2" onclick="clearVal()">

                    Reset

                </button>

            </div>
        </div>

    </form>


    <div class="text-center">



        <!-- Display the converted amount -->

        <h2>Converted Amount : ${result} </h2>

    </div>

</div>


</body>

</html>