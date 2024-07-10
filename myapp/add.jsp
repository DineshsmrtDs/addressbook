<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*, javax.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Contact</title>
    
    <style>
        /* CSS code goes here */
        body {
  font-family: Arial, sans-serif;
  background-color: #f2f2f2;
  padding: 20px;
}

h1 {
  text-align: center;
  color: #333;
}

form {
  background-color: white;
  padding: 20px;
  border-radius: 5px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  max-width: 400px;
  margin: 0 auto;
}

input[type=text] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

input[type=submit] {
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  width: 100%;
}

input[type=submit]:hover {
  background-color: #45a049;
}
      </style>
</head>
<body>
    <h1>Add Contact</h1>
    <form action="addContact.jsp" method="post">
        Name: <input type="text" name="name"><br>
        Email: <input type="text" name="email"><br>
        Phone: <input type="text" name="phone"><br>
        facebook: <input type="text" name="facebook"><br>
        linkedIn: <input type="text" name="linkedin"><br>
        <input type="submit" value="Add">
    </form>
</body>
</html>