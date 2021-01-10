<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Home Page</title>
<link rel="stylesheet" href="css/style.css" type="text/css" >
<script>

function change(){
	var elem = document.getElementById("button_grid_Available");
	if(elem == "Booked"){
		document.getElementsByClassName('button_grid_Available')[0].style.backgroundColor = "red";
		document.getElementById('button_grid_Available').disabled = true;
	}
	
}

function Slides(){
	var i;
	var slides;
	slides = document.getElementsByClassName("Slides");
	for (i=0; i< slides.length; i++){
		slides[i].style.display = "none";
	}
	slideIndex++;
	if(slideIndex > slides.length){
		slideIndex = 1
	}
	slides[slideIndex-1].style.display = "block";
	setTimeout(Slides, 3000);
	
}

</script>

</head>
<body>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache"); //HTTP 1.0
response.setHeader("Expires", "0"); //Proxies veresion
%>

<!-- Getting the acess of database to get the dynamic value on the submit button -->
<sql:setDataSource var = "myDS" driver = "oracle.jdbc.driver.OracleDriver" url="jdbc:oracle:thin:@ee417.c7clh2c6565n.eu-west-1.rds.amazonaws.com:1521:ee417" user="EE_USER" password = "EE_PASS"/>

<!-- Nav Bar -->

<ul class="navBar">
	<li><a href="adminLogin.jsp">Admin</a></li>
	<li><a href = "<%= request.getContextPath() %>/logoutOriginal">Logout</a></li>
	<li><a href="customerAccount.jsp">Account</a></li>
	<li><a href="CustomerLogin.jsp">Login</a></li>
	<li><a href="registrationView.jsp">Register</a></li>
	<li><a>Welcome ${EmailID}</a></li>
</ul>

<!-- Slider -->

<div class="slideshow-container">
<div class="Slides fade">
<img src="images/image1.jpg" style="width: 100%">
</div>

<div class="Slides fade">
<img src="images/image2.jpg" style="width: 100%">
</div>
<div class="Slides fade">
<img src="images/image3.jpg" style="width: 100%">
</div>
<div class="Slides fade">
<img src="images/image4.jpg" style="width: 100%">
</div>
<div class="Slides fade">
<img src="images/image5.jpg" style="width: 100%">
</div>
</div>
<script>
var slideIndex = 0;
Slides();
</script>

<br><br>

<!-- Grid Container -->

<div class="grid-container">

<div class = "grid1">

<img src="images/house2.jpg" style="width:100%" />

</div>
<div class = "grid2"></div>
<div class = "grid3">
<form action="confirmationPage.jsp">
<input type ="hidden" name = "name" value = "Room1">
<sql:query dataSource ="${myDS}" var="bookingStatus">
select roomStatus from bookingStatus where Room="Room1";
</sql:query>
<c:forEach var="row" items="${bookingStatus.rows}" varStatus = "status">
<c:if test="${status.last}">
<input onclick = "javascript:change()" type="submit" id='button_grid_Available' class='button_grid_Available' value = "<c:out value='${row.roomStatus}'></c:out>" name = "Room1">
</c:if>
</c:forEach>


</form>

</div>



</div>
<br> <br>

<div class="grid-container">

<div class = "grid1">

<img src="images/house3.jpg" style="width:100%" />

</div>
<div class = "grid2"></div>
<div class = "grid3">
<form action = "confirmationPage.jsp">
<input type="hidden" name = "name" value = "Room2">
<sql:query dataSource ="${myDS}" var="bookingStatus">
select roomStatus from bookingStatus where Room="Room2";
</sql:query>
<c:forEach var="row" items="${bookingStatus.rows}" varStatus = "status">
<c:if test="${status.last}">
<input onclick = "javascript:change()" onSubmit = "change()" type="submit" id='button_grid_Available' class='button_grid_Available' value = "<c:out value='${row.roomStatus}'></c:out>" name = "Room2">
</c:if>
</c:forEach>

</form>

</div>



</div>
<br><br>

<!-- Pagination -->
<center><div class ="pagination">
<a href ="indexAvailable.jsp">1</a>
<a href="secondPage.jsp">2</a>
</div></center>




</body>
</html>