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
<body class="container">

	<div class="row">
		
		<div class="col-12 my-2">
			<a class="btn btn-danger" href="${pageContext.request.contextPath }/cart/deleteAll">Clear Cart</a>
			<a class="btn btn-success" href="${pageContext.request.contextPath }/product">Continue</a>
		
		</div>
	
		<div class="col-12">

			<table class="table table-striped">
				<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col">Product</th>
						<th scope="col">Unit Price</th>
						<th scope="col">Quantity</th>
						<th scope="col">Price</th>
						<th scope="col">Action</th>
					</tr>
				</thead>
				<tbody>


					<c:forEach var="cartItem" items="${cartItems }">
						<c:set var="cartId" value="${cartItem.product.id }" />
						<c:set var="product" value="${cartItem.product }" />
						<c:set var="quantity" value="${cartItem.quantity }" />

						<tr>
							<td scope="row"></td>
							<td>${product.name }</td>
							<td>${product.price }</td>
							<td>${quantity }</td>
							<td>${quantity * product.price }</td>
							<td><a
								href="${pageContext.request.contextPath }/cart/delete/${cartId}">Remove</a></td>
						</tr>


					</c:forEach>

				</tbody>
			</table>
		</div>
		<div class="col-12">
			${totalPrice }
		</div>
	</div>



	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="<c:url value="/js/jquery-3.5.1.slim.min.js"/>"></script>
	<script src="<c:url value="/js/popper.min.js"/>"></script>
	<script src="<c:url value="/js/bootstrap.min.js"/>"></script>




</body>
</html>