/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Hoa Doan
 */
public class DBUtils {
//    Do not change this code
    public static Connection getConnection() throws ClassNotFoundException, SQLException{
        Connection conn= null;
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        String url= "jdbc:sqlserver://localhost:1433;databaseName=Wish";
        conn= DriverManager.getConnection(url, "sa", "1");
        return conn;
//               Connection conn = null;
//        try {
//            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
//            String url = "jdbc:sqlserver://localhost:1433;databaseName=Wish";
//            conn = DriverManager.getConnection(url, "sa", "1");
//        } catch (ClassNotFoundException e) {
//            System.out.println("SQL Server JDBC Driver not found. Include the JDBC jar in your classpath.");
//            e.printStackTrace();
//        } catch (SQLException e) {
//            System.out.println("Connection failed! Check output console.");
//            e.printStackTrace();
//        }
//        return conn;
    }

}
