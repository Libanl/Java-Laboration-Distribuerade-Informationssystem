package com.example.labbettdist;

import java.sql.Connection;
import java.sql.SQLException;

public class TestDb {
    public static void main(String[] args) {
        try {
            Connection connection = DBManager.getConnection();
            if (connection != null) {
                System.out.println("Databasanslutning lyckades!");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}