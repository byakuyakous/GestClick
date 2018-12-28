/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Abdelkrim
 */
public class DaoCompte {
     Connection conn;
    
    public DaoCompte()
    {
        conn = new Connexion().seConnecter();
    }
    
    public ResultSet selectAll()
    { ResultSet res=null;
        try {
           
            Statement st=conn.createStatement();
            res=st.executeQuery("select * from Compte" );
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
            
        }
        return res;
    }
     public ResultSet selectLog(String id)
    { ResultSet res=null;
        try {
           
            Statement st=conn.createStatement();
            res=st.executeQuery("select * from Employe where id_employe=id" );
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
            
        }
        return res;
    }
    
}
