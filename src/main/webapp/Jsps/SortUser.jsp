<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sort User Page</title>
<style>
table, th, td {
    border: 1px solid activeborder;
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
function sortUser() {
	document.forms[0].action="${pageContext.request.contextPath}/sortUser";
	document.forms[0].method="post";
	document.forms[0].submit();
}
</script>
</head>
<body>
	<h4><font color="red">Welcome to Sort User Details Page!....</font></h4>
	<form action="" method="post">
		<a href="${pageContext.request.contextPath}/Jsps/Home.jsp">Home Page</a></br>
		<table>
			<tr>
				<th>User Name
        			<button type="button" class="sortButton" onclick="sortUser">
						<img src="${pageContext.request.contextPath}/Images/sort_icon.jpg" style="width:3px;height:10px;">
					</button>
				</th>
				<th>User Mobile</th>
				<th>User Email</th>					
				<th>User City</th>
				<th>EDIT</th>
				<th>DELETE</th>
			</tr>	
		  	<c:forEach items="${SortUserDetails}" var="Userdetails">
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