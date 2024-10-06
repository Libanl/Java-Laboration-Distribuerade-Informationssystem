package com.example.labbettdist;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        // Hämta eller skapa varukorgen från sessionen
        List<Item> cart = (List<Item>) session.getAttribute("cart");
        if (cart == null) {
            cart = new ArrayList<>();
        }

        // Hämta itemId från request-parametrarna
        String itemId = request.getParameter("itemId");
        if (itemId == null || itemId.isEmpty()) {
            session.setAttribute("message", "Produkt ID saknas.");
            response.sendRedirect("products.jsp");
            return;
        }

        try {
            // Hämta produkten med itemId från databasen
            ItemService itemService = new ItemService();
            Item item = itemService.getItemById(Integer.parseInt(itemId));

            if (item != null) {
                // Lägg till produkten i varukorgen
                cart.add(item);
                session.setAttribute("cart", cart); // Uppdatera sessionen med den nya varukorgen
                session.setAttribute("message", "Produkten '" + item.getName() + "' har lagts till i varukorgen.");

                // Omdirigera till cart.jsp för att visa varukorgen
                response.sendRedirect("cart.jsp");
            } else {
                session.setAttribute("message", "Produkten kunde inte hittas.");
                response.sendRedirect("products.jsp");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            session.setAttribute("message", "Ett fel uppstod vid tillägg till varukorgen.");
            response.sendRedirect("error.jsp");
        } catch (NumberFormatException e) {
            // Hantera om itemId inte är ett korrekt tal
            session.setAttribute("message", "Felaktigt produkt-ID.");
            response.sendRedirect("products.jsp");
        }
    }
}
