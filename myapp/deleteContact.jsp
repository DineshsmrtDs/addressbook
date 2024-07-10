<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*, javax.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Contact</title>
</head>
<body>
    <h1>Delete Contact</h1>
    <% 
    String contactId = request.getParameter("id");
    if (contactId != null && !contactId.isEmpty()) {
        try {
            Context initContext = new InitialContext();
            Context envContext  = (Context)initContext.lookup("java:/comp/env");
            DataSource ds = (DataSource)envContext.lookup("jdbc/addressbook");
            Connection conn = ds.getConnection();

            PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM addressbook WHERE id = ?");
            pstmt.setInt(1, Integer.parseInt(contactId));
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                String name = rs.getString("name");
                String email = rs.getString("email");
                String phone = rs.getString("phone");
                String facebook = rs.getString("facebook");
                String linkedin = rs.getString("linkedin");
    %>
                <p>Are you sure you want to delete the following contact?</p>
                <p>Name: <%= name %></p>
                <p>Email: <%= email %></p>
                <p>Phone: <%= phone %></p>
                <p>Facebook: <%= facebook %></p>
                <p>LinkedIn: <%= linkedin %></p>
                <form action="confirmDeleteContact.jsp" method="post">
                    <input type="hidden" name="id" value="<%= contactId %>">
                    <input type="submit" value="Delete Contact">
                </form>
    <%
            } else {
                out.println("<p>Contact not found.</p>");
            }
            rs.close();
            pstmt.close();
            conn.close();
        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
        }
    } else {
        out.println("<p>No contact ID provided.</p>");
    }
    %>
</body>
</html>
