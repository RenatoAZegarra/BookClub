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
    <title>Book Club</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
 <!-- change to match your file/naming structure -->
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<!-- change to match your file/naming structure -->
</head>
<body>
   <div class="container mt-5">
      <div class="row">
         <div class="col-md-6">
            <h1>Welcome, <c:out value="${name}"/></h1>
         </div>
         <div class="col-md-6 text-md-end">
            <a href="/logout" class="btn btn-primary">Log Out</a>
            <a href="/books/new" class="btn btn-success">+ Add a book to my shelf</a>
         </div>
      </div>
      <p>Books from everyone's shelves:</p>
      <table class="table table-striped">
         <thead>
            <tr>
               <th>ID</th>
               <th>Title</th>
               <th>Author Name</th>
               <th>Posted By</th>
            </tr>
         </thead>
         <tbody>
            <c:forEach var="eachBook" items="${bookList}">
               <tr>
                  <td>${eachBook.id}</td>
                  <td><a href="/books/${eachBook.id }"><c:out value="${eachBook.title}"/></a></td>
                  <td><c:out value="${eachBook.author}"/></td>
                  <td><c:out value="${eachBook.user.name}"/></td>      
               </tr>
            </c:forEach>
         </tbody>
      </table>
   </div>
</body>
</html>

