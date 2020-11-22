<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <style>
        .center {
            margin: auto;
            width: 60%;
            height: 80%;
            border: 3px solid #000000;
            border-radius: 40px;
            padding: 10px;
        }

        h1 {
            text-align: center;
            margin-top: 20px;
        }

        .buttonCenter {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 200px;
            padding: 100px;
        }
    </style>
    <title>Parking Ltd</title>
</head>
<body>
<div style="margin-top: 5%"></div>
<div class="center">
    <h1 style="margin-bottom: 40px"><strong>Welcome!</strong></h1>
    <div style="padding-left: 100px; padding-right: 100px;">
        Welcome to the Parking Lot! Please take a token from below, and keep it safe as you will have to return it back
        when exiting.
        <br>
        The following are the parking charges for this parking lot:
        <br>
        <br>
        <b>Weekdays</b>
        <ul>
            <li>5am - 9am: <i>5$/hour</i></li>
            <li>9am - 5pm: <i>8$/hour</i></li>
            <li>5pm - 12am: <i>6$/hour</i></li>
        </ul>
        <br>
        <b>Weekends</b>
        <ul>
            <li>5am - 9am: <i>7$/hour</i></li>
            <li>9am - 5pm: <i>10$/hour</i></li>
            <li>5pm - 12am: <i>9$/hour</i></li>
        </ul>
    </div>
    <form action="generate_token" class="buttonCenter">
        <input type="submit" class="btn btn-primary btn-lg btn-block" value="Click Here to Get Your Token">
    </form>
    <div style="margin-top: 50px; color: red; font-weight: bold; text-align: center; width: 100%"> ${error} </div>
</div>

</body>
</html>
