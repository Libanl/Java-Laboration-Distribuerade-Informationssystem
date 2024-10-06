package com.example.labbettdist;

import java.sql.SQLException;
import java.util.List;

public class ItemService {
    // Hämtar alla produkter från databasen
    public List<Item> getAllItems() throws SQLException {
        return ItemDB.getItems();
    }

    // Hämtar en specifik produkt baserat på ID
    public Item getItemById(int id) throws SQLException {
        return ItemDB.getItemById(id);  // Uppdatera för att använda en specifik metod för att hämta ett enskilt objekt
    }
}
