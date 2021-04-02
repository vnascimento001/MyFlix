<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="classe.filmes"%>

<%
    String exceptionMessage = null;

    if(request.getParameter("Cancelar")!=null){
        response.sendRedirect(request.getRequestURI());
    }

    if(request.getParameter("formInsert")!=null){
        try{
            String nome = request.getParameter("nome");
            String genero = request.getParameter("genero");
            String img = request.getParameter("img");
            filmes.insert(nome, genero, img);
            response.sendRedirect(request.getRequestURI());
        }catch(Exception ex){
            exceptionMessage = ex.getLocalizedMessage();
        }

    }

    if(request.getParameter("FormDelete")!=null){
        try{
            String nome = request.getParameter("nome");
            filmes.delete(nome);
            response.sendRedirect(request.getRequestURI());
        }catch(Exception ex){
            exceptionMessage = ex.getLocalizedMessage();
        }

    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>MyFlix</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js" integrity="sha384-SR1sx49pcuLnqZUnnPwx6FCym0wLsk5JZuNx2bPPENzswTNFaQU1RDvt3wT4gWFG" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.min.js" integrity="sha384-j0CNLUeiqtyaRmlzUHCPZ+Gy5fQu0dQ6eZ/xAww941Ai1SxSY+0EQqNXNE6DZiVc" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="style/style.css">
</head>
<body>
    <button style="float: right;">Adicionar</button>

        <br/>
        <h1> MyFlix</h1>

        <br/>

            <% for(filmes filme : filmes.getList()){ %>
            <img  class="xx" src="<%=filme.getImg()%>" alt="Filme">

    <% } %>
</body>
</html>