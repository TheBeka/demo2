<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
    <sql:setDataSource
        user="root"
        password="password"
        url="jdbc:mysql://localhost:3306/db?autoReconnect=true&useSSL=false"
        var="db"
        driver="com.mysql.jdbc.Driver"
   />

    <sql:query var="results" dataSource="${db}">
        SELECT * FROM movies;
    </sql:query>

    <a href="add.jsp">Add Movie</a>
    <table>
        <thead>
            <tr>
                <th>Id</th>
                <th>Name</th>
                <th>Date</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach items="${results.rows}" var="movie">
            <tr>
                <th>${movie.id}</th>
                <th>${movie.movie_name}</th>
                <th>${movie.release_date}</th>
                <th>
                    <a href="update.jsp?id=${movie.id}">Edit</a>
                </th>
                <th>
                    <a href="deleteMovie.jsp?id=${movie.id}">Delete</a>
                </th>
            </tr>
        </c:forEach>
        </tbody>
    </table>

</body>
</html>