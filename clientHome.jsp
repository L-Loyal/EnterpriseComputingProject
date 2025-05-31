<!DOCTYPE html>

<%
    String message = (String) session.getAttribute("message");

    if (message == null) message = " ";
%>

<html lang="en">
    <head>
        <title>Client Home Page</title>
        <meta charset="utf-8">
        <link rel="stylesheet" href="css/project4.css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script type="text/javascript">
            function eraseText() {
                $("#sqlStatement").val("");
            }

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
        <p>You are connected to the Project 4 Enterprise System database as a <strong>client-level</strong> user.</p>
        <p>Please enter any SQL query or update command in the box below.</p>
        <form method="post" action="/Project-4/clientHome">
            <textarea id="sqlStatement" name="sqlStatement" rows="20" cols="100"></textarea>
            <br>
            <br>
            <input type="submit" value="Execute Command">
            <input type="button" value="Reset Form" onclick="javascript:eraseText();">
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