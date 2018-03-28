<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home Page</title>
</head>
<body>
	<h3><font color="blue"> Welcome to Home Page!.... </font></h3>
	<form action="${pageContext.request.contextPath}/homeController" method="post">
		<table>
			<tr>
				<td><input type="submit" value="Fetch User Details" /></td>
			</tr>
			<tr>
				<td><a href="${pageContext.request.contextPath}/Jsps/Register.jsp">Register Here</a></td>
				<td><a href="${pageContext.request.contextPath}/Jsps/Login.jsp" >Login Here</a></td>
			</tr>
		</table>
	</form>
</body>
</html>
