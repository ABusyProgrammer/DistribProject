<%--
  Created by IntelliJ IDEA.
  User: aryan
  Date: 11/22/2020
  Time: 12:17 AM
  To change this template use File | Settings | File Templates.
--%>
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
    <div style="padding-left: 100px; padding-right: 100px; text-align: center">
        Success! Your token has been generated! Please save this token, as you will need it when checking out.
    </div>
    <h2 id="result" style="text-align: center; margin-top: 60px">${result}</h2>
    <form action="return_to_home" class="buttonCenter">
        <input type="submit" class="btn btn-primary btn-lg btn-block" value="Generate Another Token">
    </form>
</div>

</body>
</html>
