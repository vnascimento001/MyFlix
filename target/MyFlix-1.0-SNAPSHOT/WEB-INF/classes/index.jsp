<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="classe.filmes"%>

<%

    Exception err = null;

    try{


        if(request.getParameter("cria") != null){
            filmes.insert(
                    request.getParameter("nome"),
                    request.getParameter("genero"),
                    request.getParameter("img")

            );
            response.sendRedirect(request.getRequestURI());
        }

        if(request.getParameter("excluir") != null){
            filmes.delete(
                    request.getParameter("exclude")
            );
            response.sendRedirect(request.getRequestURI());
        }

    }catch(Exception ex){
        err = ex;
    }

  /*  String exceptionMessage = null;
    try{
    if(request.getParameter("formInsert")!=null){

            String nome = request.getParameter("nome");
            String genero = request.getParameter("genero");
            String img = request.getParameter("img");
            filmes.insert(nome, genero, img);
            response.sendRedirect(request.getRequestURI());
        }

        if(request.getParameter("excluir") != null){
            filmes.delete(
                    request.getParameter("exclude")
            );
            response.sendRedirect(request.getRequestURI());
        }
    }catch(Exception ex){
        exceptionMessage = ex.getLocalizedMessage();
    }
*/

%>
<!DOCTYPE html>
<html>
<head>
    <title>MyFlix</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <link rel="stylesheet" href="style/style.css">
</head>
<body>

<h1> MyFlix</h1>
<form>
    <input type="text" placeholder="Nome" name="nome">
    <input type="text" placeholder="Genero" name="genero">
    <input type="text" placeholder="Img" name="img">
    <input type="submit" name="cria" value="Criar">
</form>
        <br/>

            <% for(filmes filme : filmes.getList()){ %>
    <div id="content">
        <a href="#modal<%=filme.getNome()%>"><img  class="xx" src="<%=filme.getImg()%>" alt="Filme"></a><br>
        <form method="post">
        <input type="hidden" name="exclude" value="<%=filme.getNome()%>">
        <input type="submit" name="excluir" value="Excluir">
        </form><
        <div id="modal<%=filme.getNome()%>"><a href="#"><span>X</span></a><span>Nome:</span> <%=filme.getNome()%><p><span>Gênero: </span><%=filme.getGenero()%></p>
       </div>
    </div>

    <% } %>
</body>
</html>