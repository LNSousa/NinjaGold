<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ninja Gold</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
</head>
<body>
<div class="container text-center">
	<h1 style="color:red;">YOU LOSE</h1>
	<form action="/reset" method="post">
		<button class="btn btn-danger">Reset</button>
	</form>
</div>
</body>
</html>