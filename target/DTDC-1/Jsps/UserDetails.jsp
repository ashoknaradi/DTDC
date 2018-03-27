<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Details Page</title>
<style>
table, th, td {
    border: 1px solid fuchsia;
}
</style>
<script type="text/javascript">
function deleteUser(mail) {
	alert(mail);
	document.forms[0].action="${pageContext.request.contextPath}/deleteUser?userEmail="+mail;
	document.forms[0].method="post";
	document.forms[0].submit();
}
function editUser(mail) {
	document.forms[0].action="${pageContext.request.contextPath}/editUser?userEmail="+mail;
	document.forms[0].method="post";
	document.forms[0].submit();
}
</script>
</head>
<body>
	<h3>Welcome to User Details Page!....</h3>
	<form action="${pageContext.request.contextPath}/deleteUser" method="post">
		<table>
			<tr>
				<th>User Name</th>
				<th>User Mobile</th>
				<th>User Email</th>					
				<th>User City</th>
				<th>EDIT</th>
				<th>DELETE</th>
			</tr>	
		  	<c:forEach items="${UserDetails}" var="Userdetails">
				<tr>
					<td>${Userdetails.userName}</td>
					<td>${Userdetails.userMobile}</td>
					<td>${Userdetails.userEmail}</td>
					<td>${Userdetails.userCity}</td>
					<td><input type="button" value="Edit" onclick="editUser('${Userdetails.userEmail}')" /></td>
					<td><input type="button" value="Delete" onclick="deleteUser('${Userdetails.userEmail}')" /></td>
				</tr>
			</c:forEach>
		</table>
	</form>
</body>
</html>