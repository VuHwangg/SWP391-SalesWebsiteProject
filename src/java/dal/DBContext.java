package dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author FPT University - PRJ301
 */
public class DBContext {
    protected Connection connection;
    public DBContext()
    {
        //@Students: You are allowed to edit user, pass, url variables to fit 
        //your system configuration
        //You can also add more methods for Database Interaction tasks. 
        //But we recommend you to do it in another class
        // For example : StudentDBContext extends DBContext , 
        //where StudentDBContext is located in dal package, 
        try {
<<<<<<< HEAD
=======
<<<<<<< HEAD
<<<<<<< Updated upstream
=======
            String user = "sa";
            String pass = "12345678";
            String url = "jdbc:sqlserver://localhost:1433;databaseName=SWP";
=======
<<<<<<< HEAD
>>>>>>> Stashed changes
>>>>>>> b6b00cffea0d51c7fe30f3b0d0ff61e9f2e84b2a
            // Edit URL , username, password to authenticate with your MS SQL Server
            String url = "jdbc:sqlserver://localhost:1433;databaseName= SWP";
            String username = "sa";
            String password = "30082002Xyz@";
<<<<<<< HEAD
=======
=======

            String user = "sa";
            String pass = "12345678";
            String url = "jdbc:sqlserver://localhost:1433;databaseName=SWP";

       






>>>>>>> 327d89e9e9fe39c93a6bb20ecf92036b339dfed2
<<<<<<< Updated upstream
=======
>>>>>>> 977bb91d63f3111d28b9f0186a9ffa7837f898ee
>>>>>>> Stashed changes
>>>>>>> b6b00cffea0d51c7fe30f3b0d0ff61e9f2e84b2a
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    // Kiem tra ket noi
    public static void main(String[] args) {
        System.out.println(new DBContext().connection);
    }
}
