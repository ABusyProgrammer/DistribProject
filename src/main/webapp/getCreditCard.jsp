<%--
  Created by IntelliJ IDEA.
  User: aryan
  Date: 11/22/2020
  Time: 3:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" isELIgnored="false"%>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
            height: 50px;
            padding: 40px;
        }

        .inputToken {
            height: 50px;
            width: 90%;
            margin-left: 5%;
            border: 2px solid red;
            text-align: center;
            font-size: 20px;
            font-weight: bold;
        }

        .inputTokenLabel {
            width: 90%;
            margin-left: 5%;
            font-size: 20px;
        }

        .number {
            border: 5px solid white;
            border-bottom: 10px solid white;
            cursor: pointer;
            background: grey;
        }

        .numberInvisible {
            border: 5px solid white;
            border-bottom: 10px solid white;
            background: white;
        }

        .normal {
            border: 5px solid white;
            cursor: pointer;
        }
    </style>
    <title>Parking Ltd</title>
</head>
<body>
<div style="margin-top: 5%"></div>
<div class="center">
    <h1 style="margin-bottom: 40px"><strong>Credit Card Details</strong></h1>
    <p>Click on an input box to enter/edit your information there</p>

    <div class="inputTokenLabel">Credit Card Number</div>
    <div id="saveNum" class="inputToken" onclick="setId('saveNum')"><h2></h2></div>
    <br>
    <div class="inputTokenLabel">Security Number</div>
    <div id="saveSec" class="inputToken" onclick="setId('saveSec')"><h2></h2></div>
    <br>
    <div class="inputTokenLabel">Pin</div>
    <div id="savePin" class="inputToken" onclick="setId('savePin')"><h2></h2></div>

    <table style="width: 80%; margin-left: 10%; margin-top: 40px; text-align: center; color: white; font-weight: bolder">
        <tr style="height: 40px; font-size: 20px">
            <td class="number" onclick="addVal('1')"><i>1</i></td>
            <td class="number" onclick="addVal('2')"><i>2</i></td>
            <td class="number" onclick="addVal('3')"><i>3</i></td>
        </tr>
        <tr style="height: 40px; font-size: 20px">
            <td class="number" onclick="addVal('4')"><i>4</i></td>
            <td class="number" onclick="addVal('5')"><i>5</i></td>
            <td class="number" onclick="addVal('6')"><i>6</i></td>
        </tr>
        <tr style="height: 40px; font-size: 20px">
            <td class="number" onclick="addVal('7')"><i>7</i></td>
            <td class="number" onclick="addVal('8')"><i>8</i></td>
            <td class="number" onclick="addVal('9')"><i>9</i></td>
        </tr>
        <tr style="height: 40px; font-size: 20px">
            <td class="numberInvisible"><i></i></td>
            <td class="number" onclick="addVal('0')"><i>0</i></td>
            <td class="number" onclick="removeLastChar()"><i class="material-icons" style="font-size:16px">backspace</i></td>
        </tr>
    </table>
    <form action="bye" class="buttonCenter">
        <input id="saveNumVal" name="saveNumVal" type="text" hidden value="">
        <input id="saveSecVal" name="saveSecVal" type="text" hidden value="">
        <input id="savePinVal" name="savePinVal" type="text" hidden value="">
        <input type="submit" class="btn btn-primary btn-lg btn-block" value="Validate Token">
    </form>
    <div id="maxLen" style="text-align: center; color: red"></div>
    <div style="color: red; font-weight: bold; text-align: center; width: 100%"> ${error} </div>
</div>

<script>
    let id = "saveNum";
    let regVal = document.getElementById(id);

    window.addEventListener("keydown", function(e){
        if(e.keyCode === 8) {
            e.preventDefault();
            removeLastChar();
        }
    });
    $(document).keypress(function(e){
        let keycode = e.keyCode;
        if ((keycode > 47 && keycode < 58)/*  || (keycode > 64 && keycode < 91) || (keycode > 97 && keycode < 122) */) {
            addVal(String.fromCharCode(e.charCode).toUpperCase());
        }
    });

    function addVal(val) {
        regVal = document.getElementById(id);
        if (regVal.innerText.length >= 36) {
            document.getElementById('maxLen').innerText = "Max size reached.";
            return;
        }

        regVal.innerText += val;
        let len = regVal.innerText.length;

        document.getElementById(id + 'Val').value = regVal.innerText;
        console.log(document.getElementById(id + 'Val').value);
    }

    function setId(idVal){
        id = idVal;
    }

    function removeLastChar() {
        regVal = document.getElementById(id);
        regVal.innerText = regVal.innerText.slice(0, -1);
        document.getElementById(id + 'Val').value = regVal.innerText;
        console.log(document.getElementById(id + 'Val').value);

        let maxLen = document.getElementById("maxLen");
        maxLen.innerText = "";
    }
</script>
</body>
</html>
