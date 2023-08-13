<%@page import="com.bookstore.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My-Online Bookstore</title>
<style type="text/css">
.error {
	color: red;
}
</style>

<%@include file="components/All_Js_css.jsp"%>

<!-- show model automatically -->

<c:if test="${error==true}">

	<script type="text/javascript">
		$(document).ready(function() {

			$('#exampleModal').modal('show')
		});
	</script>

</c:if>

<c:if test="${book.bookid!=0}">

	<script type="text/javascript">
		$(document).ready(function() {

			$('#exampleModal').modal('show')

		});
	</script>

</c:if>


</head>
<body>
	<%@include file="components/nav.jsp"%>

	<div class="container-fluid p-0 m-0">
		<div class="jumbotron primary-background text-white banner-background">
			<div class="container">

				<c:if test="${usertype=='admin'}">
					<h6 class="display-4">Hello ! Admin ${name}</h6>
				</c:if>
				<c:if test="${usertype!='admin'}">
					<h5 class="display-4">Hi ! ${name}</h5>
				</c:if>
				<h3 class="display-3">Welcome to MY Online Bookstore</h3>
				<h3>MY Online Bookstore</h3>
				<p>A programming language is a formal language comprising a set
					of strings that produce various kinds of machine code output.
					Programming languages are one kind of computer language, and are
					used in computer programming to implement algorithms.</p>

				<p>Most programming languages consist of instructions for
					computers.There are programmable machines that use a set of
					specific instructions, rather than general programming languages.
					Since the early 1800s, programs have been used to direct the
					behavior of machines such as Jacquard looms, music boxes and player
					pianos.[1] The programs for these machines (such as a player
					piano's scrolls) did not produce different behavior in response to
					different inputs or conditions.</p>

				<c:if test="${not empty logedUser}">

					<c:if test="${usertype=='admin'}">

						<button type="button" class="btn btn-outline-light btn-lg"
							data-toggle="modal" data-target="#exampleModal">

							<span class="fa fa-book fa-spin"></span>Add New Books
						</button>
						<a class="btn btn-outline-light btn-lg" href="${pageContext.request.contextPath}/sellBooks">
							<span class="fa fa-book fa-spin"></span>All Sells Books
						</a>
					</c:if>
				</c:if>




			</div>
		</div>
	</div>

	<!-- Bootstrap Modal For add Book-->

	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="false"
		data-keyboard="false" data-backdrop="static">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<c:if test="${book.bookid==0}">
						<h5 class="modal-title" id="exampleModalLabel">Add Book</h5>
					</c:if>
					<c:if test="${book.bookid!=0}">
						<h5 class="modal-title" id="exampleModalLabel">Update Book</h5>
					</c:if>

					<a type="button" class="close"
						href="${pageContext.request.contextPath}/"> <span
						aria-hidden="true">&times;</span>
					</a>
				</div>
				<div class="modal-body">
					<!-- Book form -->

					<div class="card">
						<div
							class="card-header  primary-background text-white text-center">
							<span class="fa fa-book fa-3x"></span>
							<p>Books Details</p>
						</div>
						<div class="card-body">
							<!--form-->
							<c:url var="addAction" value="/registerbookform"></c:url>

							<form:form action="${addAction}" method="post"
								modelAttribute="book">
								<c:if test="${book.bookid!=0}">

									<div class="form-group">
										<form:input path="bookid" class="form-control" />
									</div>
								</c:if>

								<div class="form-group">
									<label for="booktitle">Book Title</label>
									<form:input path="booktitle" class="form-control"
										placeholder="Book Title" />
									<form:errors path="booktitle" cssClass="error" />
								</div>
								<div class="form-group">
									<label for="Name">Book Author</label>
									<form:input path="bookauthor" class="form-control"
										placeholder="Enter here" />
									<form:errors path="bookauthor" cssClass="error" />
								</div>

								<div class="form-group">
									<label for="bookquantity">Book Quantity</label>
									<form:input path="bookquantity" class="form-control"
										placeholder="Enter here" />
									<form:errors path="bookquantity" cssClass="error" />
								</div>

								<div class="form-group">
									<label for="description">Description</label>
									<form:textarea path="bookdescription" rows="4"
										class="form-control" placeholder="Enter here" />
									<form:errors path="bookdescription" cssClass="error" />
								</div>

								<div class="form-group">
									<label for="price">Price</label>
									<form:input path="price" class="form-control"
										placeholder="Enter here" />
									<form:errors path="price" cssClass="error" />
								</div>
								
								<div class="form-group">
									<label for="price">Discount</label>
									<form:input path="discount" class="form-control"
										placeholder="Enter here" />
									<form:errors path="discount" cssClass="error" />
								</div>

								<%-- 	<div class="form-group">
								<label for="address">Profile</label>
								<form:input path="profilepic" type="file" rows="4" class="form-control"/>
								<form:errors path="profilepic" cssClass="error" />
							</div> --%>

								<div class="container text-center mt-2">

									<button type="submit" class="btn btn-success">Save
										Book</button>
								</div>
							</form:form>
						</div>
					</div>
					<div class="modal-footer">
						<a type="button" class="btn btn-secondary"
							href="${pageContext.request.contextPath}/">Close</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap modal section End -->



	<!-- Modal Add Student-->


	<!-- Bootstrap modal section End -->



	<!--card-->
	<c:if test="${not empty book}">
		<div class="container">
			<div class="row">


				<c:forEach var="b" items="${books}">
					<div class="col-md-4">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title" style="position: absolute;">${b.booktitle}</h4>
								<h5 class="card-title text-right"
									style="position: relative; color: red;">
									<span style="font-size: 15px">Available </span>${b.bookquantity}</h5>

								<p class="card-text">${b.bookdescription}</p>
								<h6 class="text-right">Author: ${b.bookauthor}</h6>
								<h5 class="primary-background">
									Rs.
									<span>${b.price}</span>
								</h5>
								
								<h5 class="primary-background">
									discount Price
									<span>${b.discount*b.price/100}</span>
								</h5>
								




							</div>
							<div class="card-footer text-center">
								<c:if test="${logedUser!=null}">

									<c:if test="${usertype=='admin'}">
										<a
											href="${pageContext.request.contextPath}/updatebook/${b.bookid}"
											class="btn btn-success text-white">Update</a>
										<a
											href="${pageContext.request.contextPath}/deletebook/${b.bookid}"
											class="btn btn-danger text-white">Delete</a>

									</c:if>

									<c:if test="${usertype!='admin'}">

										<a href="${pageContext.request.contextPath}/buy/${b.bookid}"
											class="btn btn-success text-white">Shop Now</a>

									</c:if>

								</c:if>
							</div>
						</div>
					</div>


				</c:forEach>


			</div>
		</div>
	</c:if>
</body>
</html>
