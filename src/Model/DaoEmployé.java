/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;
import java.sql.*;

/**
 *
 * @author Abdelkrim
 */
public class DaoEmployé {
    Connection conn;
    
    public DaoEmployé()
    {
        conn = new Connexion().seConnecter();
    }
    
    public ResultSet selectAll()
    { ResultSet res=null;
        try {
           
            Statement st=conn.createStatement();
            res=st.executeQuery("select * from Employe" );
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
            
        }
        return res;
    }
     public ResultSet select(String id)
    { ResultSet res=null;
        try {
           
            Statement st=conn.createStatement();
            res=st.executeQuery("select * from Employe where id_Employe=id" );
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
            
        }
        return res;
    }
    
}
