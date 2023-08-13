<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Register page</title>
<%@include file="components/All_Js_css.jsp"%>
<style type="text/css">
.error {
	color: red;
}
</style>

</head>
<body>
	<%@include file="components/nav.jsp"%>


	<main class="primary-background pt-4 pb-5 banner-background">
		<div class="container">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-header  primary-background text-white text-center">
						<span class="fa fa-user-circle fa-3x"></span>
						<c:if test="${user.id==0}">
						<p>Register here</p>
						</c:if>
						<c:if test="${user.id!=0}">
						<p>Upadate Details</p>
						</c:if>
					</div>
					<div class="card-body">
						<!--form-->
						<c:url var="addAction" value="/registerform"></c:url>
						<form:form action="${addAction}" method="post"
							modelAttribute="user">
							<c:if test="${user.id!=0}">
							<form:input path="id" class="form-control" />
							</c:if>
							<div class="form-group">
								<label for="Name">First Name</label>
								<form:input path="firstName" class="form-control"
									placeholder="Enter here" />
								<form:errors path="firstName" cssClass="error" />
							</div>
							<div class="form-group">
								<label for="Name">Last Name</label>
								<form:input path="lastName" class="form-control"
									placeholder="Enter here" />
								<form:errors path="lastName" cssClass="error" />
							</div>
							<div class="form-group">
								<label for="Username">Email address</label>
								<form:input path="email" class="form-control"
									placeholder="Enter email" />
								<form:errors path="email" cssClass="error" />
							</div>
							<div class="form-group">
								<label for="password">Password</label>
								<form:password path="password" class="form-control"
									placeholder="Enter here" />
								<form:errors path="password" cssClass="error" />
							</div>

							<div class="form-group">
								<label for="phone">Phone</label>
								<form:input path="phone" class="form-control"
									placeholder="Enter here" />
								<form:errors path="phone" cssClass="error" />
							</div>

							<div class="form-group">
								<label for="address">Address</label>
								<form:textarea path="address" rows="4" class="form-control"
									placeholder="Enter here" />
								<form:errors path="address" cssClass="error" />
							</div>

							<%-- 	<div class="form-group">
								<label for="address">Profile</label>
								<form:input path="profilepic" type="file" rows="4" class="form-control"/>
								<form:errors path="profilepic" cssClass="error" />
							</div> --%>
							<div class="container text-center">
								<a href="login" style="font-weight: bold;">If you've already
									accout ! login here</a>

							</div>
							<div class="container text-center mt-2">
								<button type="submit" class="btn btn-success">Sign up</button>
							</div>
						</form:form>
					</div>

				</div>

			</div>
		</div>
	</main>

	<script>
		
	</script>

</body>
</html>
