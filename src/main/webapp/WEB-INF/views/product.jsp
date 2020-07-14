<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">



<link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css"/>">

</head>
<body class="container">


	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="#">Navbar</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="#">Home
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="#">About</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Contact</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> Dropdown </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">Action</a> <a
							class="dropdown-item" href="#">Another action</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Something else here</a>
					</div></li>

			</ul>
			<!-- 				<form class="form-inline my-2 my-lg-0"> -->
			<!-- 					<input class="form-control mr-sm-2" type="search" -->
			<!-- 						placeholder="Search" aria-label="Search"> -->
			<!-- 					<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button> -->
			<!-- 				</form> -->
		</div>
	</nav>

	<div class="jumbotron"
		style="padding: 2rem 1rem; margin-bottom: 1rem; margin-top: 1rem;">
		<h1 class="display-5">Product Detail</h1>
		<p class="lead">Here is the detail information of the product!</p>
	</div>

	<div class="row mb-3">
		<div class="col-12">
			<c:if test="${param.overUnit != null}">
						<div class="alert alert-danger">Error</div>
					</c:if>
		</div>
	</div>


	<div class="row mb-3">

		<div class="col-4">
			<c:forEach items="${product.files }" var="file">
				<img src="<c:url value="${file.path }"/>" alt="Demo"
					class="border img-fluid">
			</c:forEach>
		</div>

		<div class="col-8">


			<div class="row">

				<div class="col-12">
					<h3>${product.name }</h3>
				</div>
				<div class="col-12">${product.description }</div>
				<div class="col-12">
					<h5 class="d-inline-block mr-2">Manufacturer</h5>${product.manufacturer }</div>
				<div class="col-12">
					<h5 class="d-inline-block mr-2">Category</h5>${product.category }</div>
				<div class="col-12">
					<h5 class="d-inline-block mr-2">Condition</h5>${product.cndition }</div>

				<div class="col-12">${product.price }USD</div>

				<div class="col-12">
					<form method="POST"
						action="${pageContext.request.contextPath }/cart/addCartItem">
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token }" /> <input type="hidden" name="productId"
							value="${product.id }"> <input type="number"
							name="quantity"> <input type="submit" value="Add to Cart">

					</form>
				</div>



			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-12">
			<p class="float-left">
				© 2015 Company, Inc. <a href="#">Privacy</a> <a href="#">Terms</a>

			</p>
			<a href="#" class="float-right">Back to top</a>
		</div>
	</div>




	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="<c:url value="/js/jquery-3.5.1.slim.min.js"/>"></script>
	<script src="<c:url value="/js/popper.min.js"/>"></script>
	<script src="<c:url value="/js/bootstrap.min.js"/>"></script>




</body>
</html>