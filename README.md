# EnterpriseComputingProject

This project is a three tier application that grants the user access to a dabatase depending on their credentials.
The kind of operations the user is able to peform are based on what type of user they are.

# Types of users

Root & Client users:

Have all rights and privilages to the database.

The interface for root user is just a giant textbox which can be used to make sql statements and get output based on which commands were used, client user is almost the same except they can only peform select commands.

Client users:

Have select rights to the database.

Data Entry User:

Have select, insert, and update rights to the database (although the interface wouldn't allow them to select or update records).

The Data Entry User interface allows the user to insert new records into the 3 tables in the database (Parts, Shipment, Jobs).

Accountant user:

Has execute rights to the database.

The accountant user interface allows the user to execute a list of stored procedures.

# Tools / Technologies

- Tomcat
- Java
- SQL
- JavaScript
- JQuery
- MySQL
- HTML
- CSS
- JSP
- XML
- Servlets

# How to run

Note: you must have Apache Tomcat, a Java JDK, and MySQL installed.

1. Put the files from this repository into a single folder.
2. Put that folder into the webapps folder inside the Tomcat folder in your computer.
3. Create the project4 and credentialsdb databases in MySQL by using the statements found in the databases.sql file.
4. Create the users (except root) for the project database in MySQL (you can use the same credentials found in the property files).
5. (Optional) If you choose to make the users have different credentials from the ones found in the properties, make sure to update the files accordingly.
6. Check the file path in fileInputStream statements link to the property files properly in your system.

I kept the original names for the database and folder. You can change them but it would require you to also change the property files to get to the correct database.
The MySQL port number is set to 3306, you may need to change that in the property files if you don't have it set to default for MySQL.
