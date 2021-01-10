<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<script>
</script>
<link rel="stylesheet" href="css/style.css" type="text/css" >
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<meta charset="UTF-8">
<title>Admin Home Page.</title>
</head>
<body>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache"); //HTTP 1.0
response.setHeader("Expires", "0"); //Proxies veresion
if(session.getAttribute("ID") == null){
	response.sendRedirect("adminLogin.jsp");
}
%>

<!-- Acessing to dataBase -->
<sql:setDataSource var = "myDS" driver = "oracle.jdbc.driver.OracleDriver" url="jdbc:oracle:thin:@ee417.c7clh2c6565n.eu-west-1.rds.amazonaws.com:1521:ee417" user="EE_USER" password = "EE_PASS"/>


<center><header class="summaryHeader">Admin Home Page</header></center>

<br><br><br><br><br>

<div class="adminPageContainer">
  <div class="adminGrid1">
  <header>Room1</header>
<form>
<sql:query dataSource ="${myDS}" var="bookingStatus">
select roomStatus from bookingStatus where Room="Room1";
</sql:query>
<c:forEach var="row" items="${bookingStatus.rows}" varStatus = "status">
<c:if test="${status.last}">
<input type="button" id='button_grid_Available' class='button_grid_Available' value = "<c:out value='${row.roomStatus}'></c:out>" name = "Room1"/>
</c:if>
</c:forEach>
</form>
  </div>
  <div class="adminGrid2">
  <header>Room2</header>
<form>
<sql:query dataSource ="${myDS}" var="bookingStatus">
select roomStatus from bookingStatus where Room="Room2";
</sql:query>
<c:forEach var="row" items="${bookingStatus.rows}" varStatus = "status">
<c:if test="${status.last}">
<input type="button" id='button_grid_Available' class='button_grid_Available' value = "<c:out value='${row.roomStatus}'></c:out>" name = "Room2">
</c:if>
</c:forEach>
</form>
</div>
<div class="adminGrid3">
<header>Room3</header>
 <form>
<sql:query dataSource ="${myDS}" var="bookingStatus">
select roomStatus from bookingStatus where Room="Room3";
</sql:query>
<c:forEach var="row" items="${bookingStatus.rows}" varStatus = "status">
<c:if test="${status.last}">
<input  type="button" id='button_grid_Available' class='button_grid_Available' value = "<c:out value='${row.roomStatus}'></c:out>" name = "Room3">
</c:if>
</c:forEach>
</form>
  </div>  
  <div class="adminGrid4">
  <header>Room4</header>
  <form>
<sql:query dataSource ="${myDS}" var="bookingStatus">
select roomStatus from bookingStatus where Room="Room4";
</sql:query>
<c:forEach var="row" items="${bookingStatus.rows}" varStatus = "status">
<c:if test="${status.last}">
<input type="button" id='button_grid_Available' class='button_grid_Available' value = "<c:out value='${row.roomStatus}'></c:out>" name = "Room4">
</c:if>
</c:forEach>
</form>
  </div>
  <div class="adminGrid5">
  <header>Room5</header>
  <form action="">
<sql:query dataSource ="${myDS}" var="bookingStatus">
select roomStatus from bookingStatus where Room="Room5";
</sql:query>
<c:forEach var="row" items="${bookingStatus.rows}" varStatus = "status">
<c:if test="${status.last}">
<input type="button" id='button_grid_Available' class='button_grid_Available' value = "<c:out value='${row.roomStatus}'></c:out>" name = "Room5">
</c:if>
</c:forEach>
</form>

  </div> 
</div>
<form>
<button type = "submit" onClick = <sql:update dataSource = "${myDS}" var = "bookingStatus">
UPDATE bookingStatus SET roomStatus = 'Available' where roomStatus = 'Booked';
</sql:update> class='Admin_Submut'>Click here to convert the status</button>
</form>

<form action= "<%= request.getContextPath() %>/logoutOriginal" >
<input type="submit" id='button_grid_Available' class='button_grid_Available' value = logout />
</form>


</body>
</html>