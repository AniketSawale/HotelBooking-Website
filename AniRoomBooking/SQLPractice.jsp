<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SQL Query</title>
</head>
<body>


<sql:setDataSource var = "myDS" driver = "com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/dumb" user="root" password="very_strong_password"/>

<p> Sucessfully Here </p>
<sql:update dataSource ="${myDS}" var="variableTable">
update variableTable set Room_status = 'Available' where Room_status = 'Booked';
</sql:update>

<sql:query dataSource = "${myDS}" var = 'variableTable'>
Select * from variableTable;
</sql:query>

<c:forEach var="row" items = "${variableTable.rows}">
<tr>

<td><c:out value="${row.ID}"></c:out></td>
<td><c:out value="${row.Room}"></c:out></td>
<td><c:out value="${row.Room_status}"></c:out></td>

</tr>

</c:forEach>
<p>Second value Here</p>
<%=pageContext.getAttribute("row") %>
</body>
</html>