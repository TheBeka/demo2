<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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

<sql:update dataSource="${db}">
    DELETE FROM movies WHERE id=?;
    <sql:param value="${id}" />
</sql:update>

<c:redirect url="index.jsp" />