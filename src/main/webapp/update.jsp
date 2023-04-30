<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update movie</title>
</head>
<body>
<sql:setDataSource
    user="root"
    password="password"
    url="jdbc:mysql://localhost:3306/db?autoReconnect=true&useSSL=false"
    var="db"
    driver="com.mysql.jdbc.Driver"
/>
<%
    String id = request.getParameter("id");
%>
<c:set var="id" value="<%=id%>" />
<sql:query var="result" dataSource="${db}">
    SELECT * FROM movies WHERE id=?;
    <sql:param value="${id}" />
</sql:query>

<c:forEach items="${result.rows}" var="movie">
    <form action="updateMovie.jsp" method="post">
        <input type="hidden" name="id" value="${id}">
        <input type="text" name="movie_name" placeholder="Movie name" value="${movie.movie_name}">
        <input type="date" name="release_date" value="${movie.release_date}">
        <input type="submit">
    </form>
</c:forEach>
</body>
</html>
