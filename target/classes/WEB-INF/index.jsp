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
    <title>Login and Register</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/app.js"></script><!-- change to match your file/naming structure -->
</head>
<body class="container">
   <h1>Welcome!</h1>
   <div class="d-flex justify-content-between">
   	
   	<div class="register container">
   	<form:form action="/register" class="p-3 d-flex flex-column form gap-3" method="post" modelAttribute="newUser">
   			<p>
   				<form:label path="userName">Username:</form:label>
   				<form:errors class="text-danger" path="userName"></form:errors>
   				<form:input path="userName"></form:input>
   			</p>
   			<p>
   				<form:label path="email">Email:</form:label>
   				<form:errors class="text-danger" path="email"></form:errors>
   				<form:input path="email"></form:input>
   			</p>
   			<p>
   				<form:label path="password">Password:</form:label>
   				<form:errors class="text-danger" path="password"></form:errors>
   				<form:input type="password" path="password"></form:input>
   			</p>
   			<p>
   				<form:label path="confirm">Confirm Password:</form:label>
   				<form:errors class="text-danger" path="confirm"></form:errors>
   				<form:input type="password" path="confirm"></form:input>
   			</p>
   			<div class="">
   			<input class="btn btn-primary" type="submit" value="Submit" />
   			</div>
   	</form:form>
   	</div>
   	<div class="login container">
   	<form:form action="/login" class="login d-flex flex-column gap-3 p-3" method="post" modelAttribute="newLogin">
   			<p>
   				<form:label path="email">Email:</form:label>
   				<form:errors class="text-danger" path="email"></form:errors>
   				<form:input path="email"></form:input>
   			</p>
   			<p>
   				<form:label path="password">Password:</form:label>
   				<form:errors class="text-danger" path="password"></form:errors>
   				<form:input type="password"  path="password"></form:input>
   			</p>
   			<div class="">
   			<input class="btn btn-primary" type="submit" value="Submit" />
   			</div>
   	</form:form>
   	</div>
   </div>
</body>
</html>

