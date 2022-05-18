<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/resources/js/jquery-3.3.1.min.js"></script>
<title>ID찾기</title>
<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">
	
<!-- Css Styles -->
<link rel="stylesheet" href="/resources/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/elegant-icons.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/nice-select.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/jquery-ui.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/style.css" type="text/css">

</head>
<body>
	<div align="center">
		<form action="/user/findingId" method="get">
			이름 <input type="text" id="userName" name="userName">
			<br><br>
	
		<input type="submit" value="아이디 찾기" onclick="IdFind();">
		</form>
		<br>
		<br>
		<table border="1" style="margin: auto;">
			<c:forEach items="${findId }" var="findId">
				<tr>
					<th style="width:300px;">이름</th>
					<th style="width:300px;">ID</th>
				</tr>
				<tr>
					<td>${findId.userName }</td>
					<td>${findId.userId }</td>
				</tr>		
			</c:forEach>	
		</table>
	</div>
</body>

</html>