<%
    // Kontrollera om användaren är inloggad
    Integer userId = (Integer) session.getAttribute("userId");
    if (userId == null) {
        // Om användaren inte är inloggad, omdirigera till login-sidan
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="sv">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Webshop</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('images/webshop.png'); /* Sökväg till din bild */
            background-size: cover; /* Se till att bilden täcker hela bakgrunden */
            background-position: center; /* Centrera bakgrundsbilden */
            background-repeat: no-repeat; /* Undvik att bilden repeteras */
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .container {
            text-align: center;
            background-color: rgba(255, 255, 255, 0.8); /* Vit bakgrund med lite transparens */
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            color: #333;
            margin-bottom: 20px;
        }
        a {
            text-decoration: none;
            font-size: 16px;
            color: white;
            background-color: #007bff;
            padding: 10px 20px;
            border-radius: 5px;
            margin: 10px;
            display: inline-block;
        }
        a:hover {
            background-color: #0056b3;
        }
        .refresh {
            background-color: #28a745;
        }
        .refresh:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Valkommen till Sabbir's och Liban's webshop</h2>
    <!-- Länk till produktsidan där användaren kan se och köpa produkter -->
    <a href="products.jsp">Visa produkter</a><br/>
    <!-- Länk till varukorgen -->
    <a href="cart.jsp">Visa varukorg</a><br/>
    <!-- Refresh-länk -->
    <a class="refresh" href="<%= request.getRequestURI() %>">Refresh</a>
</div>
</body>
</html>
