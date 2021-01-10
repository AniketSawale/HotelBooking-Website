<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script>
function Change(){
	
	var elem = document.getElementById("prac");
	document.getElementsByClassName('prac')[0].style.backgroundColor = "red";
	document.getElementById('prac').disabled = true;

}

</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<input onclick="Change()" type = "submit" id = 'prac' class='prac' value = "Here the OutCome...!!!!">

</body>
</html>