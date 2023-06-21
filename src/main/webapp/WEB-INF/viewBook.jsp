<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- Formatting (dates) --> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Read Share</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
 <!-- change to match your file/naming structure -->
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<!-- change to match your file/naming structure -->
</head>
<body>
	<div class="container mt-5">
		<div class="row">
			<div class="col-md-6">
				<h1><c:out value="${oneBook.title }"/></h1>
			</div>
			<div class="col-md-6 text-md-end">
				<a href="/books" class="btn btn-primary">Back to Shelves</a>
			</div>
		</div>
		<hr>
		<div class="row">
			<div class="col-md-6">
				<h3><c:out value="${oneBook.user.name}"/> read <c:out value="${oneBook.title}"/> by <c:out value="${oneBook.author}"/></h3>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6">
				<h3>Here are <c:out value="${oneBook.user.name}"/>'s thoughts:</h3>
				<p><c:out value="${oneBook.myThoughts}"/></p>
			</div>
			<div class="col-md-6 text-md-end">
				<c:if test="${oneBook.user.id.equals(userId)}">
					<form action="/books/${oneBook.id }" method="post">
						<input type="hidden" name="_method" value="delete" />
						<button type="submit" class="btn btn-danger">Delete</button>
						<a href="/books/${oneBook.id}/edit" class="btn btn-warning">Edit</a>
					</form>
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>