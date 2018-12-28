/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Abdelkrim
 */
public class Connexion {
     public Connection seConnecter()
    {Connection Conn=null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/GestClick","root","");
                    
        } 
        catch (ClassNotFoundException | SQLException ex) {
            System.err.println(ex.getMessage());
        }
        return Conn;
    }
}
