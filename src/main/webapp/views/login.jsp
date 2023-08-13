<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login page</title>
<%@include file="components/All_Js_css.jsp"%>
</head>
<body>
<!--navbar-->
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@include file="components/nav.jsp"%>
		<main
		class="d-flex align-items-center primary-background banner-background"
		style="height: 80vh;">
		<div class="container">
			<div class="row">
				<div class="col-md-4 offset-md-4">
					<div class="card">
						<div class="card-header primary-background text-white text-center">
							<span class="fa fa-user-plus fa-3x"></span> <br>

							<p>Login here</p>

						</div>

						<div class="card-body">
							<div class="alert ${clss}" role="alert">${msg}</div>
							<form action="loginform" method="post">
								<div class="form-group">
									<label for="Email1">Email address</label> <input type="email"
										class="form-control" id="InputEmail1" name="email"
										aria-describedby="emailHelp" placeholder="Enter email">
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">Password</label> <input
										type="password" class="form-control"
										id="exampleInputPassword1" name="password"
										placeholder="Password">
								</div>
								<div class="form-check">
									<input type="checkbox" class="form-check-input"
										id="exampleCheck1"> <label class="form-check-label"
										for="exampleCheck1">Check me out</label>
								</div>
								<button type="submit" class="btn btn-primary">Submit</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
</body>
</html>
