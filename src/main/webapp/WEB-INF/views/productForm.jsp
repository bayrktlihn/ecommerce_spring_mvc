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


		<div class="col-7">
			<form:form modelAttribute="product" method="POST"
				action="${pageContext.request.contextPath }/admin/product?${_csrf.parameterName }=${_csrf.token }"
				enctype="multipart/form-data">

				<form:hidden path="id" />


				<div class="form-group">
					<h6 class="d-inline-block mr-2">Name</h6>
					<form:errors path="name" cssClass="text-danger" />
					<form:input path="name" class="form-control" />
				</div>

				<div class="form-group">
					<h6>Category</h6>
					<c:forEach items="${categoryOptions }" var="categoryOption">
						<c:if test="${product.category == categoryOption}">
							<div class="form-check form-check-inline">
								<input class="form-check-input" checked type="radio"
									name="category" id="categoryOption${categoryOption }"
									value="${categoryOption }"> <label
									class="form-check-label" for="categoryOption${categoryOption }">${categoryOption }</label>
							</div>
						</c:if>

						<c:if test="${product.category != categoryOption}">
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="category"
									id="categoryOption${categoryOption }"
									value="${categoryOption }"> <label
									class="form-check-label" for="categoryOption${categoryOption }">${categoryOption }</label>
							</div>
						</c:if>

					</c:forEach>

				</div>

				<div class="form-group">
					<h6>Description</h6>
					<form:input path="description" class="form-control" />
				</div>

				<div class="form-group">
					<h6 class="d-inline-block mr-2">Price</h6>
					<form:errors path="price" cssClass="text-danger" />
					<form:input path="price" class="form-control" />
				</div>

				<div class="form-group">
					<h6>Condition</h6>
					<c:forEach items="${conditionOptions }" var="conditionOption">


						<c:if test="${product.cndition == conditionOption}">
							<div class="form-check form-check-inline">
								<input checked class="form-check-input" type="radio"
									name="cndition" id="conditionOption${conditionOption }"
									value="${conditionOption }"> <label
									class="form-check-label"
									for="conditionOption${conditionOption }">${conditionOption }</label>
							</div>
						</c:if>

						<c:if test="${product.cndition != conditionOption}">
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="cndition"
									id="conditionOption${conditionOption }"
									value="${conditionOption }"> <label
									class="form-check-label"
									for="conditionOption${conditionOption }">${conditionOption }</label>
							</div>
						</c:if>




					</c:forEach>

				</div>

				<div class="form-group">
					<h6>Status</h6>
					<c:forEach items="${statusOptions }" var="statusOption">

						<c:if test="${product.status == statusOption }">
							<div class="form-check form-check-inline">
								<input checked class="form-check-input" type="radio"
									name="status" id="statusOption${statusOption }"
									value="${statusOption }"> <label
									class="form-check-label" for="statusOption${statusOption }">${statusOption }</label>
							</div>
						</c:if>

						<c:if test="${product.status != statusOption }">
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="status"
									id="statusOption${statusOption }" value="${statusOption }">
								<label class="form-check-label"
									for="statusOption${statusOption }">${statusOption }</label>
							</div>
						</c:if>


					</c:forEach>

				</div>

				<div class="form-group">
					<h6 class="d-inline-block mr-2">Unit In Stock</h6>
					<form:errors path="unitInStock" cssClass="text-danger" />
					<form:input path="unitInStock" class="form-control" />
				</div>

				<div class="form-group">
					<h6>Manufacturer</h6>
					<form:input path="manufacturer" class="form-control" />
				</div>


				<div class="form-group">
					<h6>Image</h6>
					<input name="image" type="file" class="form-control-file">
				</div>





				<button type="submit" class="btn btn-primary">Submit</button>
			</form:form>
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