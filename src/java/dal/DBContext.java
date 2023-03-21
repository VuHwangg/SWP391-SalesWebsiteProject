
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
            String url = "jdbc:sqlserver://localhost:1433;databaseName= SWP";
<<<<<<< Updated upstream

            String username = "duyct";
=======
            String username = "sa";
<<<<<<< HEAD
            String password = "30082002Xyz@";
=======
>>>>>>> Stashed changes



            String password = "1312002ss";




>>>>>>> 5241a7a01c763fa095710f69dd3e95637d779fc2
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        }
    }
    public static void main(String[] args) {
        System.out.println(new DBContext().connection);
    }
}
