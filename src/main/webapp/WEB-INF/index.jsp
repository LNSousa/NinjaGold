<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ninja Gold</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
</head>
<body>
<div class="container">
	<div class="d-flex justify-content-between align-items-center">
	<h2 class="mt-5">Your gold: 
		<c:choose>
		<c:when test="${ gold == null }"> 
			0
		</c:when>
		<c:otherwise>
			<c:out value="${ gold }"/>
		</c:otherwise>
	</c:choose>
	</h2>
	<form action="/reset" method="post">
		<button class="btn btn-danger">Reset</button>
	</form>
	</div>
	<div class="d-flex justify-content-around my-5">
		<div class="border text-center p-4">
			<h2>Farm</h2>
			<p class="my-3">(earns 10-20 gold)</p>
			<form action="/job" method="post"> 
				<input type="hidden" name="job" value="farm">
				<button type="submit" class="btn btn-primary">Find Gold!</button>
			</form>
		</div>
		<div class="border text-center p-4">
			<h2>Cave</h2>
			<p class="my-3">(earns 5-10 gold)</p>
			<form action="/job" method="post"> 
				<input type="hidden" name="job" value="cave">
				<button type="submit" class="btn btn-primary">Find Gold!</button>
			</form>
		</div>
		<div class="border text-center p-4">
			<h2>House</h2>
			<p class="my-3">(earns 2-5 gold)</p>
			<form action="/job" method="post"> 
				<input type="hidden" name="job" value="house">
				<button type="submit" class="btn btn-primary">Find Gold!</button>
			</form>
		</div>
		<div class="border text-center p-4">
			<h2>Quest</h2>
			<p class="my-3">(earns/takes 0-50 gold)</p>
			<form action="/job" method="post"> 
				<input type="hidden" name="job" value="quest">
				<button type="submit" class="btn btn-primary">Find Gold!</button>
			</form>
		</div>
	</div>
	<div>
		<h2>Activities: </h2>
		<div class="border flex-column-reverse" id="scroll" style="height:200px; overflow-y:auto;">
			<c:forEach var="activity" items="${ activities }">
				<c:if test = "${fn:contains(activity, 'failed')}">
					<p style="color:red"><c:out value="${ activity }"/></p>
			    </c:if>
			
			    <c:if test = "${fn:contains(activity, 'entered')}">
					<p style="color:green"><c:out value="${ activity }"/></p>
			    </c:if>
			</c:forEach>
		</div>
	</div>
</div>
</body>
</html>