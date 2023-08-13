<%@page import="com.bookstore.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My-Library</title>
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

<c:if test="${bookById.bookid!=null}">

	<script type="text/javascript">
		$(document).ready(function() {

			$('#bookUpdateModal').modal('show')
		});
	</script>

</c:if>


</head>
<body>
	<%@include file="components/nav.jsp"%>

	<div class="container-fluid p-0 m-0">
		<div class="jumbotron primary-background text-white banner-background">
			<div class="container">
				<h5 class="display-4">Hi ! ${name}</h5>

				<h3 class="display-3">Welcome to MY LIBRARY</h3>
				<h3>MY LIBRARY</h3>
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

				<button class="btn btn-outline-light btn-lg">
					<span class="fa fa-user-plus"></span> Start ! Learn
				</button>




				<c:if test="${user!=null}">
					<button type="button" class="btn btn-outline-light btn-lg"
						data-toggle="modal" data-target="#exampleModal">

						<span class="fa fa-book fa-spin"></span>Add New Books
					</button>
				</c:if>



			</div>
		</div>
	</div>

	<!-- Bootstrap Modal For add Book-->

	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="false">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Add Book</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
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
							<form:form action="registerbookform" method="post"
								modelAttribute="book">
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
									<label for="description">Description</label>
									<form:textarea path="bookdescription" rows="4"
										class="form-control" placeholder="Enter here" />
									<form:errors path="bookdescription" cssClass="error" />
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
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap modal section End -->





	<!-- Bootstrap Modal For Upadate Book-->

	<!-- Modal -->
	<div class="modal fade" id="bookUpdateModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="false">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Update Book</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
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
							<form:form action="updatebookform" method="post"
								modelAttribute="book">
								<div class="form-group">
									<form:input path="bookid" class="form-control"
										value="${bookById.bookid}" />
								</div>
								<div class="form-group">
									<label for="booktitle">Book Title</label>
									<form:input path="booktitle" class="form-control"
										placeholder="Book Title" value="${bookById.booktitle}" />
									<form:errors path="booktitle" cssClass="error" />
								</div>
								<div class="form-group">
									<label for="Name">Book Author</label>
									<form:input path="bookauthor" class="form-control"
										placeholder="Enter here" value="${bookById.bookauthor}" />
									<form:errors path="bookauthor" cssClass="error" />
								</div>


								<div class="form-group">
									<label for="description">Description</label>
									<form:textarea path="bookdescription" rows="4"
										class="form-control" placeholder="Enter here"
										value="${bookById.bookdescription}" />
									<form:errors path="bookdescription" cssClass="error" />
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
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary">Save
							changes</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap modal section End -->












	<!--card-->
	<div class="container">
		<div class="row">


			<c:forEach var="b" items="${books}">
				<div class="col-md-4">
					<div class="card">
						<div class="card-body">
							<h4 class="card-title">${b.booktitle}</h4>
							<p class="card-text">${b.bookdescription}</p>
							<h6 class="text-right">Author: ${b.bookauthor}</h6>
							<a href="#" class="btn primary-background text-white">Read
								more</a>

							<c:if test="${user!=null}">


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
</body>
</html>
