<%--
  Created by IntelliJ IDEA.
  User: beka
  Date: 30.04.23
  Time: 14:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add movie</title>
</head>
<body>
  <form action="createMovie.jsp" method="post">
    <input type="text" name="movie_name" placeholder="Movie name">
    <input type="date" name="release_date">
    <input type="submit">
  </form>
</body>
</html>
