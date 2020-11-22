<%--
  Created by IntelliJ IDEA.
  User: aryan
  Date: 11/22/2020
  Time: 11:23 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" isELIgnored="false"%>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
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

        .inputToken {
            height: 50px;
            width: 90%;
            margin-left: 5%;
            border: 2px solid red;
            text-align: center;
            font-size: 20px;
            font-weight: bold;
        }

        .number {
            border: 5px solid white;
            border-bottom: 10px solid white;
            cursor: pointer;
            background: grey;
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
    <h1 style="margin-bottom: 40px"><strong>Welcome!</strong></h1>
    <div style="padding-left: 100px; padding-right: 100px; text-align: center; margin-bottom: 40px">
        Please enter your token here to checkout
    </div>
    <div id="regVal" class="inputToken"><h2></h2></div>
    <table style="width: 80%; margin-left: 10%; margin-top: 40px; text-align: center; background: black; color: white; font-weight: bolder">
        <tr style="height: 60px; font-size: 24px">
            <td class="number" onclick="addVal('0')"><i>0</i></td>
            <td class="number" onclick="addVal('1')"><i>1</i></td>
            <td class="number" onclick="addVal('2')"><i>2</i></td>
            <td class="number" onclick="addVal('3')"><i>3</i></td>
            <td class="number" onclick="addVal('4')"><i>4</i></td>
            <td class="number" onclick="addVal('5')"><i>5</i></td>
            <td class="number" onclick="addVal('6')"><i>6</i></td>
            <td class="number" onclick="addVal('7')"><i>7</i></td>
            <td class="number" onclick="addVal('8')"><i>8</i></td>
            <td class="number" onclick="addVal('9')"><i>9</i></td>
        </tr>
        <tr style="height: 80px; font-size: 24px">
            <td class="normal" onclick="addVal('Q')">Q</td>
            <td class="normal" onclick="addVal('W')">W</td>
            <td class="normal" onclick="addVal('E')">E</td>
            <td class="normal" onclick="addVal('R')">R</td>
            <td class="normal" onclick="addVal('T')">T</td>
            <td class="normal" onclick="addVal('Y')">Y</td>
            <td class="normal" onclick="addVal('U')">U</td>
            <td class="normal" onclick="addVal('I')">I</td>
            <td class="normal" onclick="addVal('O')">O</td>
            <td class="normal" onclick="addVal('P')">P</td>
        </tr>
        <tr style="height: 80px; font-size: 24px">
            <td class="normal" onclick="addVal('A')">A</td>
            <td class="normal" onclick="addVal('S')">S</td>
            <td class="normal" onclick="addVal('D')">D</td>
            <td class="normal" onclick="addVal('F')">F</td>
            <td class="normal" onclick="addVal('G')">G</td>
            <td class="normal" onclick="addVal('H')">H</td>
            <td class="normal" onclick="addVal('J')">J</td>
            <td class="normal" onclick="addVal('K')">K</td>
            <td class="normal" onclick="addVal('L')">L</td>
            <td class="normal" onclick="removeLastChar()"><i class="material-icons" style="font-size:20px">backspace</i></td>
        </tr>
        <tr style="height: 80px; font-size: 24px">
            <td style="border: 5px solid white; cursor: pointer; background: white"> </td>
            <td style="border: 5px solid white; cursor: pointer; background: white"> </td>
            <td class="normal" onclick="addVal('X')">X</td>
            <td class="normal" onclick="addVal('C')">C</td>
            <td class="normal" onclick="addVal('V')">V</td>
            <td class="normal" onclick="addVal('B')">B</td>
            <td class="normal" onclick="addVal('N')">N</td>
            <td class="normal" onclick="addVal('M')">M</td>
            <td style="border: 5px solid white; cursor: pointer; background: white"> </td>
            <td style="border: 5px solid white; cursor: pointer; background: white"> </td>
        </tr>
    </table>
    <form action="get_credit_card" class="buttonCenter">
        <input id="saveVal" name="saveVal" type="text" hidden value="">
        <input type="submit" class="btn btn-primary btn-lg btn-block" value="Validate Token">
    </form>
    <div id="maxLen" style="text-align: center; color: red"></div>
    <div style="margin-top: 10px; color: red; font-weight: bold; text-align: center; width: 100%"> ${error} </div>
</div>

<script>
    let regVal = document.getElementById("regVal");

    function addVal(val) {
        if (regVal.innerText.length >= 36) {
            document.getElementById('maxLen').innerText = "Max size of token reached.";
            return;
        }

        regVal.innerText += val;
        let len = regVal.innerText.length;
        if (len === 8 || len === 13 || len === 18 || len === 23) {
            regVal.innerText += '-';
        }
        document.getElementById('saveVal').value = regVal.innerText;
        console.log(document.getElementById('saveVal').value);
    }

    function removeLastChar() {
        regVal.innerText = regVal.innerText.slice(0, -1);
        document.getElementById('saveVal').value = regVal.innerText;
        console.log(document.getElementById('saveVal').value);

        let maxLen = document.getElementById("maxLen");
        maxLen.innerText = "";
    }
</script>
</body>
</html>
