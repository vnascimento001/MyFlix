package classe;
import java.sql.*;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class DBConnect{
    private static Connection conn;
    public static Connection getConnection(){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/filmes","root","");
            Statement statement = conn.createStatement();

        }catch(Exception e){
            e.printStackTrace();
        }
        return conn;
    }


    }
