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
  String movie_name = request.getParameter("movie_name");
  Date release_date = Date.valueOf(request.getParameter("release_date"));
%>

<c:set var="movie_name" value="<%=movie_name%>" />
<c:set var="release_date" value="<%=release_date%>" />
<sql:update dataSource="${db}">
  INSERT INTO movies (movie_name, release_date) VALUES (?, ?);
  <sql:param value="${movie_name}" />
  <sql:param value="${release_date}" />
</sql:update>

<c:redirect url="index.jsp" />