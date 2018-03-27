<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register Page</title>
</head>
<body>
	<h3>Welcome to Registration page!!...Please Register your details</h3>
	<form action="${pageContext.request.contextPath}/registerController" method="post">
	<table>
		<tr><td>Name : </td><td><input type="text" name="name" /></td></tr>
		<tr><td>Mobile : </td><td><input type="text" name="mobile" /></td></tr>
		<tr><td>Email : </td><td><input type="text" name="email" /></td></tr>
		<tr><td>City : </td><td><input type="text" name="city" /></td></tr>
		<tr><td>Password : </td><td><input type="password" name="password" /></td></tr>
		</table>
		<input type="submit" value="Register" />
		<a href="${pageContext.request.contextPath}/Jsps/Login.jsp" >Login Here</a>
	</form>
</body>
</html>