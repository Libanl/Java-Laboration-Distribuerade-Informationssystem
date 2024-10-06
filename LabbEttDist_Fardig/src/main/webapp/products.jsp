<%@page import="com.example.labbettdist.ItemService" %>
<%@page import="com.example.labbettdist.Item" %>
<%@page import="java.util.List" %>

<%
    // Skapa en instans av ItemService för att hämta produkterna från databasen
    ItemService service = new ItemService();
    List<Item> items = null;

    try {
        // Hämta alla produkter från databasen
        items = service.getAllItems();
    } catch (Exception e) {
        e.printStackTrace(); // Fånga eventuella fel och skriv ut stacktrace
    }

    // Hämta meddelandet om produkten har lagts till i varukorgen
    String message = (String) session.getAttribute("message");
    if (message != null) {
        session.removeAttribute("message");
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Produkter</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f8ff;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
        }
        .container {
            width: 70%;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            color: #4CAF50;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid #dddddd;
        }
        th {
            background-color: #4CAF50;
            color: white;
            padding: 12px;
        }
        td {
            padding: 12px;
            text-align: center;
        }
        .message {
            color: green;
            font-size: 1.2em;
            text-align: center;
            margin-bottom: 20px;
        }
        footer {
            margin-top: 20px;
            text-align: center;
            padding: 20px;
            background-color: #f9f9f9;
        }
        footer img {
            width: 200px;
            height: auto;
        }
    </style>
    <script>
        // Visa ett meddelande om produkten har lagts till i varukorgen
        window.onload = function() {
            <% if (message != null) { %>
            alert('<%= message %>');
            <% } %>
        };
    </script>
</head>
<body>

<div class="container">
    <h2>Produkter och priser</h2>

    <% if (items != null && !items.isEmpty()) { %>
    <table>
        <tr>
            <th>Produkt</th>
            <th>Pris (kr)</th>
            <th>Handling</th>
        </tr>
        <% for (Item item : items) { %>
        <tr>
            <td><%= item.getName() %></td>
            <td><%= item.getPrice() %></td>
            <td>
                <!-- Formulär för att lägga till produkten i varukorgen -->
                <form action="cart" method="post">
                    <input type="hidden" name="itemId" value="<%= item.getId() %>">
                    <input type="submit" value="Lagg till i varukorg">
                </form>
            </td>
        </tr>
        <% } %>
    </table>
    <% } else { %>
    <p>Inga produkter tillgangliga.</p>
    <% } %>
</div>

<!-- Footer med bilden -->
<footer>
    <img src="images/devices.png" alt="Vara produkter">
</footer>

</body>
</html>
