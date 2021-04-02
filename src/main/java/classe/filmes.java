package classe;
import java.sql.*;
import java.util.ArrayList;

public class filmes {
    private int id;
    private String nome;
    private String genero;
    private String img;

    public filmes(){

    }

    public filmes(String nome, String genero, String img) {
        this.nome = nome;
        this.genero = genero;
        this.img = img;
    }

    public filmes(int id, String nome, String genero, String img) {
        this.id = id;
        this.nome = nome;
        this.genero = genero;
        this.img = img;
    }
    public static ArrayList<filmes> getList() throws Exception{
        ArrayList<filmes> list = new ArrayList<>();

        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;

        Exception methodException = null;

        try{
            con = DBConnect.getConnection();
            stmt = con.createStatement();
            rs = stmt.executeQuery("SELECT * FROM filmes");

            while(rs.next()){
                list.add(new filmes(
                        rs.getInt("id"),
                        rs.getString("nome"),
                        rs.getString("genero"),
                        rs.getString("img")
                ));
            }

        }catch(Exception ex){
            methodException = ex;
        }finally{
            try{rs.close();}catch(Exception ex){}
            try{stmt.close();}catch(Exception ex){}
            try{con.close();}catch(Exception ex){}
        }

        if(methodException != null) throw methodException;

        return list;
    }

    public static void addFilme(String nome, String genero, String img) throws Exception{
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        Exception methodException = null;

        try{
            con = DBConnect.getConnection();
            stmt = con.prepareStatement("INSERT INTO filmes(nome, genero, img) values(?,?,?)");

            stmt.setString(1, nome);
            stmt.setString(2, genero);
            stmt.setString(1, img);

            stmt.execute();
        }catch(Exception ex){
            methodException = ex;
        }finally{
            try{rs.close();}catch(Exception ex){}
            try{stmt.close();}catch(Exception ex){}
            try{con.close();}catch(Exception ex){}
        }

        if(methodException != null) throw methodException;
    }

    public static void delete(int id) throws Exception{
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        Exception methodException = null;

        try{
            con = DBConnect.getConnection();
            stmt = con.prepareStatement("DELETE FROM filmes WHERE id=?");

            stmt.setInt(1, id);

            stmt.execute();
        }catch(Exception ex){
            methodException = ex;
        }finally{
            try{rs.close();}catch(Exception ex){}
            try{stmt.close();}catch(Exception ex){}
            try{con.close();}catch(Exception ex){}
        }

        if(methodException != null) throw methodException;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getGenero() {
        return this.genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public String getImg() {
        return this.img;
    }

    public void setImg(String img) {
        this.img = img;
    }

}
