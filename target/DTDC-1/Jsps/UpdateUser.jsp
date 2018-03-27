<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Page</title>
</head>
<body>
	<h3>Welcome to Update page!!...Please Update your details</h3>
	<h4>Update User Name is ::: ${UserDetails.userName}</h4>
	<form action="${pageContext.request.contextPath}/updateUser" method="post">
		<table>
				<tr><td>Name : </td><td><input type="text" name="userName" value="${UserDetails.userName}"/></td></tr>
				<tr><td>Mobile : </td><td><input type="text" name="userMobile" value="${UserDetails.userMobile}"/></td></tr>
				<tr><td>Email : </td><td><input type="text" name="userEmail" value="${UserDetails.userEmail}" readonly="readonly"/></td></tr>
				<tr><td>City : </td><td><input type="text" name="userCity" value="${UserDetails.userCity}"/></td></tr>
				<tr><td>Password : </td><td><input type="password" name="userPassword" value="${UserDetails.userPassword}"/></td></tr>
		</table>
		<input type="submit" value="Update" />
		<a href="${pageContext.request.contextPath}/Jsps/Login.jsp" >Login Here</a>
	</form>
</body>
</html>