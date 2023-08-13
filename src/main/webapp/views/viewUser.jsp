<%@page import="javax.swing.text.AbstractDocument.Content"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>
<%@include file="components/All_Js_css.jsp"%>
</head>
<body>
<!--navbar-->
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@include file="components/nav.jsp"%>
	<div class="container mt-2" style="background-color: #f7f8f9;">
		<table class="table table-striped table-success">
			<thead>
				<tr>
					<th colspan="4" class="text-center"><h4>LIST OF USERS</h4></th>
				</tr>
				<tr>
					<th colspan="" class="text-center">ID</th>
					<th colspan="" class="text-center">NAME</th>
					<th colspan="" class="text-center">USER TYPE</th>
					<th colspan="2" class="text-center">ACTION</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach var="user" items="${Users }">
					<tr class="text-center background" style="color: white; font-size:21px;">
						<th scope="row">${user.id}</th>
						<td>${user.firstName}&nbsp;${user.lastName}</td>
						<td>${user.userType}</td>
						<td><a href="userdetails/${user.id}" class="btn btn-info">Details</a>
							<a href="userupdate/${user.id}" class="btn btn-success">Update</a>
							<a href="userdelete/${user.id}" class="btn btn-danger">Delete</a></td>
					</tr>
				</c:forEach>
			</tbody>
			<tr>
			<th colspan="4" class="text-center"><a href="${pageContext.request.contextPath}/register" class="btn btn-outline-primary">Add User</a></th>
			</tr>
		</table>
		</div>
</body>
</html>
