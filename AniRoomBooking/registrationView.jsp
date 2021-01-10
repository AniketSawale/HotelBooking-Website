<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

</head>
<body>

<sql:setDataSource var = "myDS" driver = "oracle.jdbc.driver.OracleDriver" url="jdbc:oracle:thin:@ee417.c7clh2c6565n.eu-west-1.rds.amazonaws.com:1521:ee417" user="EE_USER" password = "EE_PASS"/>

<center><h1 class="header"><strong>Registration form</strong></h1></center>

<form action = "<%= request.getContextPath() %>/CustomerRegistrationServlet"  method = "post">
  <div class="form-row">
   <div class="form-group col-md-6">
      <input type="text" class="form-control" title ="Name should be in between 2-20 characters" id="firstname" name="firstName" placeholder="First Name" required pattern = "[a-zA-z]+" minlength = "2" maxlength = "20">
    </div> 
    <div class="form-group col-md-6">
      <input type="text" class="form-control" title ="Name should be in between 2-20 characters" id="lastName" name="lastName" placeholder="Last Name" required pattern = "[a-zA-z]+" minlength = "2" maxlength = "20" >
    </div>
    <div class="form-group col-md-6">
     <input type="email" class="form-control" id="email" name="email" placeholder= "Email Id" required pattern = "\^([a-z 0-9\.-]+)@([a-z0-9-]+).([a-z]{2,8})(.[a-z]{2,8})?$\i">
    </div>
    <div class="form-group col-md-3">
      <input type="password" class="form-control" title="Password must contain at least 6 characters, including UPPER/lowercase and numbers" id="password" name="password" placeholder = "Password" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}"  onchange="this.setCustomValidity(this.validity.patternMismatch ? this.title : '');" >     
    </div>
    <div class="form-group col-md-6">
    <input type="text" class="form-control" id="address" name="address" placeholder="Apartment, house" required>
  </div>
  <div class="form-group col-md-6">
    <input type="text" class="form-control" title="Please fill this section" id="streetAddress" name="streetAddress" placeholder="Street Name" required>
  </div>
    <div class="form-group col-md-6">
      <input type="text" class="form-control" title="Please fill this section" id="city" name="city" placeholder="City" required >
    </div>
    <div class="form-group col-md-6">
      <input type="text" class="form-control" title="Please fill this Section" id="erCode" name="erCode" placeholder="Eircode" required> 
    </div>


</div>
<center><input class="btn btn-dark" type = "Submit" value="Register"/></center>  
</form>
<br><br>
<form action="CustomerLogin.jsp">
<center> <input class="btn btn-dark" type = "Submit" value = "Login" onSubmit = "CustomerLogin.jsp"/> </center>
</form>

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>