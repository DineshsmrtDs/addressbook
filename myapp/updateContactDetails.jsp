<%@ page import="java.sql.*, javax.naming.*, javax.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Contact Updated</title>
</head>
<body>
    <h1>Update Contact</h1>
    <%
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String facebook = request.getParameter("facebook");
        String linkedin = request.getParameter("linkedin");

        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            // Perform JNDI lookup to obtain the DataSource
            Context initContext = new InitialContext();
            Context envContext  = (Context)initContext.lookup("java:/comp/env");
            DataSource ds = (DataSource)envContext.lookup("jdbc/addressbook");
            
            // Establish connection using DataSource
            conn = ds.getConnection();

            // Prepare the SQL statement
            pstmt = conn.prepareStatement("UPDATE addressbook SET name = ?, email = ?, phone = ?, facebook = ?, linkedin = ? WHERE id = ?");
            pstmt.setString(1, name);
            pstmt.setString(2, email);
            pstmt.setString(3, phone);
            pstmt.setString(4, facebook);
            pstmt.setString(5, linkedin);
            pstmt.setInt(6, Integer.parseInt(id));

            // Execute the update
            int rowsUpdated = pstmt.executeUpdate();
            if (rowsUpdated > 0) {
                // Commit the transaction
                conn.commit();
    %>
                <p>Contact updated successfully!</p>
                <p><a href="index.jsp">Back to Address Book</a></p>
    <%
            } else {
                out.println("No contact found with the provided ID.");
            }
        } catch (Exception e) {
            // Rollback transaction on error
            if (conn != null) {
                try {
                    conn.rollback();
                } catch (SQLException ignore) {}
            }
            out.println("Error: " + e.getMessage());
            e.printStackTrace();
        } finally {
            // Close resources
            if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
            if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
        }
    %>
</body>
</html>
