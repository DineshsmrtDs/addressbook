<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*, javax.naming.*, javax.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Contact</title>
</head>
<body>
    <h1>Update Contact</h1>
    <%
        String id = request.getParameter("id");
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        try {
            // Perform JNDI lookup to obtain the DataSource
            Context initContext = new InitialContext();
            Context envContext  = (Context)initContext.lookup("java:/comp/env");
            DataSource ds = (DataSource)envContext.lookup("jdbc/addressbook");
            
            // Establish connection using DataSource
            conn = ds.getConnection();

            // Prepare the SQL statement
            pstmt = conn.prepareStatement("SELECT name, email, phone, facebook, linkedin FROM addressbook WHERE id = ?");
            pstmt.setInt(1, Integer.parseInt(id));
            
            // Execute query
            rs = pstmt.executeQuery();

            // Check if the contact exists
            if (rs.next()) {
    %>
    <form action="updateContactDetails.jsp" method="post">
        <input type="hidden" name="id" value="<%= id %>">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" value="<%= rs.getString("name") %>"><br>
        
        <label for="email">Email:</label>
        <input type="text" id="email" name="email" value="<%= rs.getString("email") %>"><br>
        
        <label for="phone">Phone:</label>
        <input type="text" id="phone" name="phone" value="<%= rs.getString("phone") %>"><br>
        
        <label for="facebook">Facebook:</label>
        <input type="text" id="facebook" name="facebook" value="<%= rs.getString("facebook") %>"><br>
        
        <label for="linkedin">LinkedIn:</label>
        <input type="text" id="linkedin" name="linkedin" value="<%= rs.getString("linkedin") %>"><br>
        
        <button type="submit">Update Contact</button>
    </form>
    <%
            } else {
                out.println("No contact found with the provided ID.");
            }
        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
            e.printStackTrace();
        } finally {
            // Close resources
            if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
            if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
            if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
        }
    %>
</body>
</html>
