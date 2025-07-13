package com.apiweb.aresfitnes.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConectaBD {

    private static final String URL = "jdbc:mysql://bobni09rbgqreceg21jx-mysql.services.clever-cloud.com:3306/bobni09rbgqreceg21jx";
    private static final String USUARIO = "upgkjjhgwmtvmrh1";
    private static final String PASSWORD = "YKYQdJNSpe34DU5TmpfX";

    public static Connection abrir() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Nueva versión
            conn = DriverManager.getConnection(URL, USUARIO, PASSWORD);
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error al conectar a la BD:");
            e.printStackTrace();
        }
        return conn;
    }

    public static void cerrar(Connection conn) {
        try {
            if (conn != null && !conn.isClosed()) {
                conn.close();
            }
        } catch (SQLException e) {
            System.out.println("Error al cerrar la conexión:");
            e.printStackTrace();
        }
    }
}
