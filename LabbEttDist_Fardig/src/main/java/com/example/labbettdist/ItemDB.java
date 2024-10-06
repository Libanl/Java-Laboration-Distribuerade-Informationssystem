package com.example.labbettdist;

import java.sql.*;
import java.util.*;

public class ItemDB {
    public static List<Item> getItems() throws SQLException {
        List<Item> items = new ArrayList<>();
        Connection con = DBManager.getConnection();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM items");

        while (rs.next()) {
            Item item = new Item(rs.getInt("id"), rs.getString("name"), rs.getDouble("price"));
            items.add(item);
        }
        return items;
    }
    public static Item getItemById(int id) throws SQLException {
        Connection con = DBManager.getConnection();
        PreparedStatement ps = con.prepareStatement("SELECT * FROM items WHERE id = ?");
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            return new Item(rs.getInt("id"), rs.getString("name"), rs.getDouble("price"));
        }
        return null;  // Om ingen produkt med det specifika ID:t hittas
    }
}