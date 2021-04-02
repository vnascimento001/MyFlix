package classe;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import classe.filmes;


public class DBConnect implements ServletContextListener {
    private static final String CLASS_NAME = "com.mysql.jdbc.Driver";
    private static final String DB_URL = "jdbc:mysql://localhost:3306/filmes";
    private static final String USER = "root";
    private static final String PW = "";

    public static String exceptionMessage = null;

    public static Connection getConnection() throws Exception{
        return DriverManager.getConnection(DB_URL, USER, PW);
    }

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        Connection con = null;
        Statement stmt = null;
        try{
            Class.forName(CLASS_NAME);
            con = getConnection();
            stmt = con.createStatement();
            stmt.execute(filmes.getCreateStatement());

        }catch(Exception ex){
            exceptionMessage = ex.getLocalizedMessage();
        }finally{
            try{stmt.close();}catch(Exception ex2){}
            try{con.close();}catch(Exception ex2){}
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
    }
}