<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Address Book</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 20px;
            text-align: center;
        }
        h1 {
            color: #333;
        }
        p {
            margin: 10px;
        }
        a {
            display: inline-block;
            padding: 10px 20px;
            text-decoration: none;
            background-color: #007bff;
            color: #fff;
            border-radius: 5px;
            margin: 5px;
            transition: background-color 0.3s ease;
        }
        a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <h1>Address Book</h1>
    <p><a href="list.jsp">View Address Book</a></p>
    <p><a href="add.jsp">Add New Contact</a></p>
    <p><a href="updateContact.jsp">Update Address Book</a></p>
    <p><a href="inputDeleteContact.jsp">Delete Address Book</a></p>
</body>
</html>