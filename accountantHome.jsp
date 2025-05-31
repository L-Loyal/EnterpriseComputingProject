<!DOCTYPE html>

<%
    String message = (String) session.getAttribute("message");

    if (message == null) message = " ";
%>

<html lang="en">
    <head>
        <title>Accountant Home Page</title>
        <meta charset="utf-8">
        <link rel="stylesheet" href="css/project4.css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script type="text/javascript">
            function eraseData() {
                $("#data").html("");
            }
        </script>
    </head>
    <header>
        <h1>Welcome to the Spring 2024 Project 4 Enterprise System</h1>
        <h2>A Servlet/JSP-based Multi-tiered Enterprise Application Using A Tomcat Container</h2>
        <br>
        <hr>
    </header>
    <body>
        <p>You are connected to the Project 4 Enterprise System database as a <strong>accountant-level</strong> user.</p>
        <p>Please select the operation you would like to peform from the list below.</p>
        <form method="post" action="/Project-4/accountantHome">
            <br>
            <input type="radio" id="max" name="procedure" value="max">
            <label for="max">Get The Maximum Status Value Of All Suppliers (Returns a maximum value).</label>
            <br>
            <br>
            <input type="radio" id="sum" name="procedure" value="sum">
            <label for="sum">Get The Total Weight Of All Parts (Returns a sum).</label>
            <br>
            <br>
            <input type="radio" id="count" name="procedure" value="count">
            <label for="count">Get The Total Number of Shipments (Returns the current number of shipments in total).</label>
            <br>
            <br>
            <input type="radio" id="most-workers" name="procedure" value="most-workers">
            <label for="most-workers">Get The Name And Number Of Workers Of The Job With The Most Workers (Returns two values).</label>
            <br>
            <br>
            <input type="radio" id="supplier-status" name="procedure" value="supplier-status">
            <label for="supplier-status">List The Name And Status Of Every Supplier (Return a list of supplier names with status)</label>
            <br>
            <br>
            <input type="submit" value="Execute Command">
            <input type="button" value="Clear Results" onclick="javascript:eraseData();">
        </form>
        <br>
        <p>All excecution results will appear below this line.</p>
        <br>
        <hr>
    </body>
    <footer>
        <p>Execution Resutls:</p>
        <table id="data">
            <%=message%>
        </table>
    </footer>
</html>