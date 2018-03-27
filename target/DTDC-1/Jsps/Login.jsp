<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Spring-MVC Login Page</title>
</head>
<body>
	<h3>Welcome to Login page</h3>
	<h4>Login User Name is ::: ${error} </h4>
	<form action="${pageContext.request.contextPath}/loginController" method="get">
		<table>
			<tr>
				<td>Email :</td>
				<td><input type="text" name="email" /></td>
			</tr>
			<tr>
				<td>Password :</td>
				<td><input type="password" name="password" /></td>
			</tr>
		</table>
		<input type="submit" value="Login" />
		<a href="${pageContext.request.contextPath}/Jsps/Register.jsp">Register Here</a>
	</form>
</body>
</html>