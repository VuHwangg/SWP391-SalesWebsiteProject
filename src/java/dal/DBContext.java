
package dal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class DBContext {
    protected Connection connection;
    public DBContext()
    {
        try {
            // Edit URL , username, password to authenticate with your MS SQL Server

<<<<<<< Updated upstream

<<<<<<< HEAD
            String user = "giangnxthe161756";          
            String pass = "tifver55";
=======


            String user = "sa";
            String pass = "12345678";


>>>>>>> 27a280c4c7644efde1e8a08c20d5f2087dfb9ec8


=======
            String user = "sa";
            String pass = "sa";
>>>>>>> Stashed changes
            String url = "jdbc:sqlserver://localhost:1433;databaseName=SWP";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, user, pass);
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        }
    }
    public static void main(String[] args) {
        System.out.println(new DBContext().connection);
    }
}
