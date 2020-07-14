<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form:form enctype="multipart/form-data" action="${pageContext.request.contextPath }/admin/demo?${_csrf.parameterName }=${_csrf.token }" modelAttribute="demo" method="POST">
	<form:input path="demo"/>
	<input type="file" name="image">
	<input type="submit" value="Submit">
</form:form>

</body>
</html>