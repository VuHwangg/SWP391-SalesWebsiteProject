
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
            String username = "duyct";

<<<<<<< Updated upstream
            String password = "1312002ss";
=======
<<<<<<< HEAD
            String password = "sa";
=======
            String password = "1312002ss";
>>>>>>> 25b064ae9c6c765a5b12b23bb0076063a589c2c2
>>>>>>> Stashed changes


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
