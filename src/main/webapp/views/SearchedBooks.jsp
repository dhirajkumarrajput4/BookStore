<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Results</title>
<%@include file="components/All_Js_css.jsp"%>
</head>
<body>
	<%@include file="components/nav.jsp"%>

	<main class="mt-5">
		<!--card-->
		<c:if test="${not empty book}">
			<div class="container">
				<div class="row">
					<c:forEach var="b" items="${books}">
						<div class="col-md-4">
							<div class="card">
								<div class="card-body">
									<h4 class="card-title" style="position: absolute;">${b.booktitle}</h4>
								<h5 class="card-title text-right" style="position: relative; color: red;"><span style="font-size: 15px">Available: </span>${b.bookquantity}</h5>
									<p class="card-text">${b.bookdescription}</p>
									<h6 class="text-right">Author: ${b.bookauthor}</h6>
									<a href="#" class="btn primary-background text-white">Read
										more</a>
									<c:if test="${logedUser!=null}">
										<a
											href="${pageContext.request.contextPath}/updatebook/${b.bookid}"
											class="btn btn-success text-white">Update</a>
										<a
											href="${pageContext.request.contextPath}/deletebook/${b.bookid}"
											class="btn btn-danger text-white">Delete</a>

									</c:if>


								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</c:if>
	</main>
</body>
</html>