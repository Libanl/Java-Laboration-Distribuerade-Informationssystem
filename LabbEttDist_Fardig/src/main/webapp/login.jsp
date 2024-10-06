<%@page import="java.sql.*" %>
<%@page import="com.example.labbettdist.DBManager" %>
<%
    String message = "";

    if (request.getMethod().equalsIgnoreCase("post")) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try (Connection conn = DBManager.getConnection()) {
            String sql = "SELECT id FROM users WHERE username = ? AND password = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                // Om inloggningen lyckas, sätt användar-ID i sessionen
                session.setAttribute("userId", rs.getInt("id"));
                session.setAttribute("username", username);
                response.sendRedirect("index.jsp");
                return;
            } else {
                message = "Felaktigt anvandarnamn eller losenord!";
            }
        } catch (SQLException e) {
            e.printStackTrace();
            message = "Inloggningen misslyckades!";
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Logga in</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .container {
            margin-top: 50px;
            width: 300px;
            margin-left: auto;
            margin-right: auto;
        }
        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 8px;
            margin: 6px 0;
            display: inline-block;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }
        input[type="submit"], button {
            width: 100%;
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            margin: 8px 0;
            border: none;
            cursor: pointer;
        }
        input[type="submit"]:hover, button:hover {
            background-color: #45a049;
        }
        .message {
            color: red;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Logga in</h2>
    <form method="post" action="login.jsp">
        <label for="username">Anvandarnamn:</label>
        <input type="text" name="username" id="username" required><br>
        <label for="password">Losenord:</label>
        <input type="password" name="password" id="password" required><br>
        <input type="submit" value="Logga in">
    </form>

    <p><%= message %></p>

    <!-- Lägg till en knapp för att refresha sidan -->
    <form method="get" action="login.jsp">
        <button type="submit">Refresh</button>
    </form>
</div>

</body>
</html>
