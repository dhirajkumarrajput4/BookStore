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
					<th colspan="5" class="text-center"><h4>ALL SELLS BOOKS</h4></th>
				</tr>
				<tr>
					<th colspan="" class="text-center">ID</th>
					<th colspan="" class="text-center">BOOK NAME</th>
					<th colspan="" class="text-center">PURCHASE BY</th>
					<th colspan="" class="text-center">BOOK PRICE</th>
					<th colspan="" class="text-center">PURCHASE DATE</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach var="asb" items="${allSellBook }">
					<tr class="text-center background" style="color: white; font-size:21px;">
						<th scope="row">${asb.id}</th>
						<td>${asb.bookName}&nbsp;</td>
						<td>${asb.userName}</td>
						<td>${asb.price}</td>
						<td>${asb.sellDate}</td>
					</tr>
				</c:forEach>
			</tbody>
			<tr>
			<th colspan="5" class="text-center"><a href="${pageContext.request.contextPath}/" class="btn btn-outline-primary">HOME</a></th>
			</tr>
		</table>
		</div>
</body>
</html>
