<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/style.css" type="text/css" >
<meta charset="UTF-8">
<title>Booking Summary</title>
</head>
<body>

<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache"); //HTTP 1.0
response.setHeader("Expires", "0"); //Proxies veresion
if(session.getAttribute("EmailID")==null)
{
	response.sendRedirect("CustomerLogin.jsp");
}

%>

<header class="summaryHeader">Summary</header>
<br><br><br><br><br>

<!-- Grid Display -->
<div class = "summaryGrid">
<div class="summaryGrid1">
<center><header>Room Details</header></center><hr>
<ul>
<li>Price: 100 Euros/night.</li>
<br>
<li>King Size Bed.</li>
<br>
<li> Luxurious Bathroom.</li>
<br>

<li> Beautiful Environment.</li>
<br>
<li>Royal room.</li>
<br>
</ul>
</div>
<div class="summaryGrid2">
<center><header>Additional Service</header></center><hr>
<ul>
<li>Lunch and Dinner Included.</li><br>
<li>24 Hrs service.</li><br>
<li>Weekend Barbeque. </li><br>
<li>Weekend Club.</li><br>
<li>Child Care Service.</li><br>


</ul>

</div>
<div class="summaryGrid3">
<form action="indexAvailable.jsp" method="post">
<input type="submit" id='cancel' class='cancel' value = "Cancel">
</form>
</div>
<div class="summaryGrid4">
<form action="<%= request.getContextPath() %>/IndexPage" method= "post">
<% String name = request.getParameter("name");
%>

<input type="hidden" name = "name" value = <%= name %>>
<input type="hidden" value="booked" name="status">
<input type="submit" id='book' class='book' value = "Book">
</form>
</div>
</div>


</body>
</html>