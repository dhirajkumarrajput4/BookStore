<%@page import="javax.swing.text.AbstractDocument.Content"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page isELIgnored="false"%>
<!doctype html>
<html lang="en">
<head><%@include file="components/All_Js_css.jsp"%>
</head>
<body>
	<!--navbar-->
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@include file="components/nav.jsp"%>
	<div class="container mt-2"
		style="background-color: #f7f8f9; height: 560px;">

		<div class="card"
			style="color: white; background: rgb(188, 230, 199); font-size: 21px;">
			<div class="card-header">
				<h4 style="position: absolute;">User Details</h4>
				<div class="container text-right" style="position: relative;">
					<a href="${pageContext.request.contextPath}/"
						class="btn btn-outline-secondary">Home</a> <a
						href="${pageContext.request.contextPath}/viewUser"
						class="btn btn-outline-secondary">Back</a>
				</div>
			</div>

			<div class="card-body background">
				<h4 class="card-title">${user.firstName}&nbsp;${user.lastName}</h4>
				<b>Email:</b> ${user.email}<br> <b>Phone:</b> ${user.phone}<br>
				<b>Address:</b> ${user.address}<br>
				<div class="container text-center">

					<a href="${pageContext.request.contextPath}/update/${user.id}"
						class="btn btn-primary mt-5">Edit Details</a>
				</div>
			</div>
		</div>


	</div>

</body>
</html>