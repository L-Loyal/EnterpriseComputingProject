<!DOCTYPE html>

<%
    String message = (String) session.getAttribute("message");

    if (message == null) message = " ";
%>

<html lang="en">
    <head>
        <title>Data Entry Home Page</title>
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
        <p>You are connected to the Project 4 Enterprise System database as a <strong>data-entry-level</strong> user.</p>
        <p>Enter the data values in a form below to add a new record to the corresponding database table</p>
        <hr>
        <br>
        <form method="post" action="/Project-4/AddSuppliersRecord">
            <p>Supplies Record Insert</p>
            <table>
                <tr>
                    <th>snum</th>
                    <th>sname</th>
                    <th>status</th>
                    <th>city</th>
                </tr>
                <tr>
                    <td><input type="text" id="snum" name="snum"></td>
                    <td><input type="text" id="sname" name="sname"></td>
                    <td><input type="text" id="status" name="status"></td>
                    <td><input type="text" id="city" name="city"></td>
                </tr>
            </table>
            <br>
            <input type="submit" value="Enter Supplier Record Into Database">
            <input type="button" value="Clear Data and Results" onclick="javascript:eraseData();">
            <br>
            <br>
        </form>
        <br>
        <br>
        <form method="post" action="/Project-4/AddPartsRecord">
            <p>Parts Record Insert</p>
            <table>
                <tr>
                    <th>pnum</th>
                    <th>pname</th>
                    <th>color</th>
                    <th>weight</th>
                    <th>city</th>
                </tr>
                <tr>
                    <td><input type="text" id="pnum" name="pnum"></td>
                    <td><input type="text" id="pname" name="pname"></td>
                    <td><input type="text" id="color" name="color"></td>
                    <td><input type="text" id="weight" name="weight"></td>
                    <td><input type="text" id="city" name="city"></td>
                </tr>
            </table>
            <br>
            <input type="submit" value="Enter Part Record Into Database">
            <input type="button" value="Clear Data and Results" onclick="javascript:eraseData();">
            <br>
            <br>
        </form>
        <br>
        <br>
        <form method="post" action="/Project-4/AddJobsRecord">
            <p>Jobs Record Insert</p>
            <table>
                <tr>
                    <th>jnum</th>
                    <th>jname</th>
                    <th>numworkers</th>
                    <th>city</th>
                </tr>
                <tr>
                    <td><input type="text" id="jnum" name="jnum"></td>
                    <td><input type="text" id="jname" name="jname"></td>
                    <td><input type="text" id="numworkers" name="numworkers"></td>
                    <td><input type="text" id="city" name="city"></td>
                </tr>
            </table>
            <br>
            <input type="submit" value="Enter Job Record Into Database">
            <input type="button" value="Clear Data and Results" onclick="javascript:eraseData();">
            <br>
            <br>
        </form>
        <br>
        <br>
        <form method="post" action="/Project-4/AddShipmentsRecord">
            <p>Shipments Record Insert</p>
            <table>
                <tr>
                    <th>snum</th>
                    <th>pnum</th>
                    <th>jnum</th>
                    <th>quantity</th>
                </tr>
                <tr>
                    <td><input type="text" id="snum" name="snum"></td>
                    <td><input type="text" id="pnum" name="pnum"></td>
                    <td><input type="text" id="jnum" name="jnum"></td>
                    <td><input type="text" id="quantity" name="quantity"></td>
                </tr>
            </table>
            <br>
            <input type="submit" value="Enter Shipment Record Into Database">
            <input type="button" value="Clear Data and Results" onclick="javascript:eraseData();">
            <br>
            <br>
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
        <br>
    </footer>
</html>