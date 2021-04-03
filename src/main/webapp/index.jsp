<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="classe.filmes"%>

<%
    Exception err = null;

    try{


        if(request.getParameter("insere") != null){
            filmes.insert(
                    request.getParameter("nome"),
                    request.getParameter("genero"),
                    request.getParameter("img")

            );
            response.sendRedirect(request.getRequestURI());
        }


    }catch(Exception ex){
        err = ex;
    }

%>
<!DOCTYPE html>
<html>
<head>
    <title>MyFlix</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <link rel="stylesheet" href="style/style.css">
</head>
<body>
    </br>
    <input type="checkbox" id="toggle">
    <label for="toggle" class="ipt">Adicionar</label>

    <dialog >
        <p>
        <span>Adicionar filme</span>
        <form>
            Nome:<input type="text" class="form-control" name="nome" required>
            Gênero<input type="text" class="form-control" name="genero" required>
            Imagem:<input type="text" class="form-control" name="img" required>

        </p>
    <label for="toggle" class="ipt">Fechar</label> <input style="border:none" class="ipt" type="submit" value="Adicionar" name="insere">
    </form>
    </dialog>

    <h1>MyFlix</h1>
    <h2>Filmes e séries</h2>
        <br/>

            <% for(filmes filme : filmes.getList()){ %>
    <div id="content">
        <div class="column"><a href="#modal<%=filme.getNome()%>"><img  class="xx" src="<%=filme.getImg()%>" alt="Filme"></a></div>
        <div id="modal<%=filme.getNome()%>">

            <span>Nome:</span> <%=filme.getNome()%>
            <p>
            <span>Gênero: </span><%=filme.getGenero()%>
            </p>
            <a href="#"><span>Fechar</span></a>
       </div>
    </div>

    <% } %>
</body>
</html>