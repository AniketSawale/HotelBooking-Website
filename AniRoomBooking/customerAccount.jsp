<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/style.css" type="text/css" >
<meta charset="UTF-8">
<title>Customer Account</title>
</head>
<body>

<sql:setDataSource var = "myDS" driver = "oracle.jdbc.driver.OracleDriver" url="jdbc:oracle:thin:@ee417.c7clh2c6565n.eu-west-1.rds.amazonaws.com:1521:ee417" user="EE_USER" password = "EE_PASS"/>

<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache"); //HTTP 1.0
response.setHeader("Expires", "0"); //Proxies veresion
if(session.getAttribute("EmailID")==null)
{
	response.sendRedirect("CustomerLogin.jsp");
}

%>

<header class="summaryHeader">Profile</header>

<br><br><br><br><br>

<table border="2">
<tr>
<th>Name</th>
<th>SurName</th>
<th>EmailID</th>
<th>Room</th>
<th>Status</th>
</tr>
<tr>
<td> <sql:query dataSource = "${myDS}" var="Anik_Customer"> SELECT First_Name from Anik_Customer where Email ="${EmailID}";</sql:query>
<c:forEach var = "row" items="${Anik_Customer.rows}"> <c:out value="${row.First_Name}"></c:out></c:forEach>
</td>
<td><sql:query dataSource = "${myDS}" var="Anik_Customer"> SELECT Last_Name from Anik_Customer where Email ="${EmailID}";</sql:query>
<c:forEach var = "row" items="${Anik_Customer.rows}"> <c:out value="${row.Last_Name}"></c:out></c:forEach>
</td>
<td>
${EmailID}
</td>
<td><sql:query dataSource = "${myDS}" var="bookingStatus"> SELECT Room from bookingStatus where ID ="${EmailID}";</sql:query>
<c:forEach var = "row" items="${bookingStatus.rows}"> <c:out value="${row.Room}"></c:out></c:forEach>
</td>
<td><sql:query dataSource = "${myDS}" var="bookingStatus"> SELECT roomStatus from bookingStatus where ID ="${EmailID}";</sql:query>
<c:forEach var = "row" items="${bookingStatus.rows}"> <c:out value="${row.roomStatus}"></c:out></c:forEach>
</td>
</tr>
</table>


</body>
</html>