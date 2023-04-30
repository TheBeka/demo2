<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.sql.Date" %>

<sql:setDataSource
        user="root"
        password="password"
        url="jdbc:mysql://localhost:3306/db?autoReconnect=true&useSSL=false"
        var="db"
        driver="com.mysql.jdbc.Driver"
/>

<%
    String id = request.getParameter("id");
    String movie_name = request.getParameter("movie_name");
    Date release_date = Date.valueOf(request.getParameter("release_date"));
%>

<c:set var="id" value="<%=id%>" />
<c:set var="movie_name" value="<%=movie_name%>" />
<c:set var="release_date" value="<%=release_date%>" />

<sql:update dataSource="${db}">
    UPDATE movies SET movie_name=?, release_date=? WHERE id=?;
    <sql:param value="${movie_name}" />
    <sql:param value="${release_date}" />
    <sql:param value="${id}" />
</sql:update>

<c:redirect url="index.jsp" />