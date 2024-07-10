<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

label {
  display: block;
  margin-bottom: 10px;
}

input[type=text], select, textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  margin-top: 6px;
  margin-bottom: 16px;
  resize: vertical;
}

input[type=submit] {
  background-color: #4CAF50;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  width: 100%;
}

input[type=submit]:hover {
  background-color: #45a049;
}

button[type=submit] {
  background-color: #4CAF50;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  width: 100%;
}

button[type=submit]:hover {
  background-color: #45a049;
}

p {
  text-align: center;
}

a {
  text-decoration: none;
  color: #337ab7;
}

a:hover {
  color: #23527c;
}

.error {
  color: #ff0000;
}
      </style>
</head>
<body>
    <h1>Add Contact</h1>

    <% 
    if(request.getParameter("name") != null) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String facebook = request.getParameter("facebook");
        String linkedin = request.getParameter("linkedin");

        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            Context initContext = new InitialContext();
            Context envContext  = (Context)initContext.lookup("java:/comp/env");
            DataSource ds = (DataSource)envContext.lookup("jdbc/addressbook");
            conn = ds.getConnection();

            // Ensure auto-commit is enabled
            conn.setAutoCommit(true);

            // Prepare the SQL statement
            pstmt = conn.prepareStatement("INSERT INTO addressbook (name, email, phone, facebook, linkedin) VALUES (?, ?, ?, ?, ?)");
            pstmt.setString(1, name);
            pstmt.setString(2, email);
            pstmt.setString(3, phone);
            pstmt.setString(4, facebook);
            pstmt.setString(5, linkedin);

            // Execute the update
            int rowsInserted = pstmt.executeUpdate();
            if (rowsInserted > 0) {
                out.println("<p>Contact added successfully!</p>");
            } else {
                out.println("<p>Failed to add contact.</p>");
            }

            // Close resources
            pstmt.close();
            conn.close();

            out.println("<p><a href='list.jsp'>Back to Address Book</a></p>");
        } catch (Exception e) {
            e.printStackTrace();
            out.println("Error: " + e.getMessage());
        } finally {
            if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
            if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
        }
    } else {
    %>
    <form action="addContact.jsp" method="post">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required><br>

        <label for="email">Email:</label>
        <input type="text" id="email" name="email"><br>

        <label for="phone">Phone:</label>
        <input type="text" id="phone" name="phone"><br>

        <label for="facebook">Facebook:</label>
        <input type="text" id="facebook" name="facebook"><br>

        <label for="linkedin">LinkedIn:</label>
        <input type="text" id="linkedin" name="linkedin"><br>

        <button type="submit">Add Contact</button>
    </form>
    <%
    }
    %>
</body>
</html>
