<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Fel uppstod</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            color: #333;
        }
        .error-container {
            margin: 100px auto;
            padding: 20px;
            width: 50%;
            background-color: #fff;
            border: 1px solid #ccc;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h1 {
            color: #ff0000;
        }
        p {
            font-size: 1.2em;
        }
        a {
            text-decoration: none;
            color: #007bff;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="error-container">
    <h1>Ett fel har inträffat</h1>
    <p>Vi beklagar men ett ovantat fel har intraffat. Vanligen forsok igen senare.</p>
    <p>Om problemet kvarstår, kontakta administratoren.</p>
    <a href="products.jsp">Tillbaka till produktsidan</a>
</div>
</body>
</html>
