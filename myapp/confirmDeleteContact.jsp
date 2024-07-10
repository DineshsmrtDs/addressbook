<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*, javax.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Contact Deleted</title>
</head>
<body>
    <h1>Contact Deleted</h1>
    <% 
    String id = request.getParameter("id");
    if (id != null && !id.isEmpty()) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            Context initContext = new InitialContext();
            Context envContext  = (Context)initContext.lookup("java:/comp/env");
            DataSource ds = (DataSource)envContext.lookup("jdbc/addressbook");
            conn = ds.getConnection();
            
            // Ensure auto-commit is enabled
            conn.setAutoCommit(true);

            // Prepare and execute delete statement
            pstmt = conn.prepareStatement("DELETE FROM addressbook WHERE id = ?");
            pstmt.setInt(1, Integer.parseInt(id));
            int rowsAffected = pstmt.executeUpdate();
            
            if (rowsAffected > 0) {
                out.println("<p>Contact deleted successfully!</p>");
            } else {
                out.println("<p>Contact not found.</p>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("Error: " + e.getMessage());
        } finally {
            if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
            if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
        }
    } else {
        out.println("<p>No contact ID provided.</p>");
    }
    %>
    <p><a href="list.jsp">Back to Address Book</a></p>
</body>
</html>
