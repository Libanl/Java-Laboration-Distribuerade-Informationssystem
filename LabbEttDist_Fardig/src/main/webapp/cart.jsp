<%@page import="com.example.labbettdist.Item" %>
<%@page import="java.util.List" %>
<%
    // Hämta varukorgen från sessionen
    List<Item> cart = (List<Item>) session.getAttribute("cart");
    String message = (String) session.getAttribute("message");
    if (message != null) {
        session.removeAttribute("message"); // Ta bort meddelandet efter att det visats
    }

    // Variabel för att hålla summan
    double totalSum = 0.0;
%>

<!DOCTYPE html>
<html>
<head>
    <title>Din varukorg</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f8ff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            width: 60%;
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
        .total {
            text-align: right;
            font-weight: bold;
            padding-top: 10px;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Din shoppingkorg</h2>

    <% if (message != null) { %>
    <p class="message"><%= message %></p> <!-- Visa bekräftelsemeddelandet -->
    <% } %>

    <table>
        <tr>
            <th>Produkt</th>
            <th>Pris (kr)</th>
        </tr>
        <% if (cart != null && !cart.isEmpty()) { %>
        <% for (Item item : cart) { %>
        <tr>
            <td><%= item.getName() %></td>
            <td><%= item.getPrice() %></td>
        </tr>
        <%
            // Lägg till produktens pris i summan
            totalSum += item.getPrice();
        %>
        <% } %>
        <tr class="total">
            <td>Att betala:</td>
            <td><strong><%= totalSum %> kr</strong></td>
        </tr>
        <% } else { %>
        <tr>
            <td colspan="2">Din varukorg ar tom.</td>
        </tr>
        <% } %>
    </table>
</div>

</body>
</html>
