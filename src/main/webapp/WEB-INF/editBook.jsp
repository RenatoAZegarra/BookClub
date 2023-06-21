<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Book Share</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
	<h1>Change Your Entry</h1>
	<a href="/books">back to shelves</a>
	<form:form action="/books/${oneBook.id}/edit" method="PUT" modelAttribute="oneBook" class="form-control">
		<form:hidden path="user"/>
			<div class="form-group">
				<form:label path="title">Title: </form:label>
				<form:input path="title" class="form-control" />
				<form:errors path="title" class="text-danger" />
			</div>
			<div class="form-group">
				<form:label path="author">Author: </form:label>
				<form:input path="author" class="form-control" />
				<form:errors path="author" class="text-danger" />
			</div>
			<div class="form-group">
				<form:label path="myThoughts">My Thoughts: </form:label>
				<form:textarea path="myThoughts" class="form-control" />
				<form:errors path="myThoughts" class="text-danger" />
			</div>
			<button type="submit" class="btn btn-primary">Submit</button>
		</form:form>
</div>


</body>
</html>