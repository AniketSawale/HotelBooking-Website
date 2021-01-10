<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

</head>
<body>

<center><h1 class="header"><strong>Customer Login form</strong></h1></center>

<center><form action = "<%= request.getContextPath() %>/customerLogin" method="post">
<div class="form-group col-md-6">
      <input type="text" class="form-control" title = "Please Enter the valid mail or Click on Register" id="email" name="email" placeholder= "Email Id" required>
      
      </div>
       <div class="form-group col-md-6">
      <input type="password" class="form-control" title = "Please Enter Valid Password or Click on forgot password." id="password" name="password" placeholder = "Password" required>  
      </div>   
<input class="btn btn-dark" type = "submit" value="Login" onSubmit = 'indexAvailable.jsp'>
</form>
<br>
<form action="registrationView.jsp">
<center><input class="btn btn-dark" type = "submit" value="Register"></center>  
</form></center>

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>