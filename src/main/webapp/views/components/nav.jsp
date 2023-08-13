<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav class="navbar navbar-expand-lg navbar-dark primary-background">
	<a class="navbar-brand" href="${pageContext.request.contextPath}/"><span
		class="fa fa-asterisk"></span>Online Bookstore</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="#"><span
					class="fa fa-bell-o"></span>Online Bookstore<span class="sr-only">(current)</span></a>
			</li>

			<li class="nav-item"><a class="nav-link" href="#"><span
					class="fa fa-address-book-o"></span>Contect</a></li>

			<c:if test="${empty logedUser}">
				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath}/login"><span
						class="fa fa-user-circle"></span>Login</a></li>
				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath}/register"><span
						class="fa fa-user-plus"></span>Sign up</a></li>
			</c:if>


			<c:if test="${not empty logedUser}">

				<c:if test="${usertype=='admin'}">

					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/users"><span
							class="fa fa-users"></span>See Users</a></li>
				</c:if>
				<li class="nav-item" style="font-size: 20px;"><a
					class="nav-link" href="#"><span class="fa fa-user-circle"></span>${name}</a></li>
				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath}/logout"><span
						class="fa fa-user"></span>Logout</a></li>

			</c:if>

		</ul>



		<form class="form-inline my-2 my-lg-0" action="search">
			<label style="color: white; font-size: 18px;">Search By
				&nbsp;</label> 
				
			 <input class="form-control mr-sm-2" name="searchValue" type="search"
				placeholder="Enter Book's Name" aria-label="Search">
			<button class="btn btn-outline-light my-2 my-sm-0" type="submit">Search</button>
		</form>
	</div>
</nav>



