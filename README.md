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

# How to set up.
