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

	<div class="row mt-2">

		<div class="col-12">
			<div class="row">
				<div class="col-3"></div>
				<div class="col-6">
					<c:if test="${param.logout != null }">
						<div class="alert alert-info" role="alert">Logout Successful</div>

					</c:if>


					<c:if test="${param.error != null }">
						<div class="alert alert-danger" role="alert">Username or
							password is invalid!</div>
					</c:if>
				</div>
				<div class="col-3"></div>
			</div>

			<div class="row">
				<div class="col-3"></div>
				<div class="col-6">
					<form:form method="post"
						action="${pageContext.request.contextPath }/admin/authenticateTheUser">
						<div class="form-group">
							<label for="inputUsername">Username</label> <input
								name="username" type="text" class="form-control"
								id="inputUsername">
						</div>
						<div class="form-group">
							<label for="inputPassword">Password</label> <input
								name="password" type="password" class="form-control"
								id="inputPassword">
						</div>

						<button type="submit" class="btn btn-primary">Login</button>
					</form:form>
				</div>
				<div class="col-3"></div>
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