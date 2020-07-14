<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">



<link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css"/>">

</head>
<body>

	<div class="container">
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
			<h1 class="display-5">All Product</h1>
			<p class="lead">Checkout all the awesome available now!</p>



		</div>

		<div class="row">

			<div class="col-12">
				<a class="btn btn-primary mb-2"
					href="${pageContext.request.contextPath }/admin/productForm"
					role="button">Add Product</a>
			</div>

			<div class="col-12">
				<table class="table table-striped">
					<thead>
						<tr>

							<th scope="col">Photo Thumb</th>
							<th scope="col">Name</th>
							<th scope="col">Category</th>
							<th scope="col">Condition</th>
							<th scope="col">Price</th>
							<th scope="col"></th>
						</tr>
					</thead>
					<tbody>

						<c:forEach items="${products }" var="product">
							<tr>
								<th scope="row"><c:forEach items="${product.files }"
										var="file">
										<img style="width: 200px; height: auto" alt="Image"
											src="${pageContext.request.contextPath }${file.path}">
									</c:forEach></th>
								<td>${product.name }</td>
								<td>${product.category }</td>
								<td>${product.cndition }</td>
								<td>${product.price }</td>
								<td><a
									href="${pageContext.request.contextPath }/product/${product.id}"><img
										src="<c:url value="/img/Information24.gif" />"></a><a
									onclick="return confirm('Are you sure?')"
									href="${pageContext.request.contextPath }/admin/delete/product/${product.id}"><img
										src="<c:url value="/img/Delete24.gif" />"></a><a
									href="${pageContext.request.contextPath }/admin/edit/product/${product.id}"><img
										src="<c:url value="/img/Edit24.gif" />"></a></td>
							</tr>
						</c:forEach>


					</tbody>
				</table>
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
	</div>

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="<c:url value="/js/jquery-3.5.1.slim.min.js"/>"></script>
	<script src="<c:url value="/js/popper.min.js"/>"></script>
	<script src="<c:url value="/js/bootstrap.min.js"/>"></script>




</body>
</html>