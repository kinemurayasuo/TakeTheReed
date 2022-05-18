<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/resources/js/jquery-3.3.1.min.js"></script>
<title>ID検索</title>
</head>
<body>
	<div align="center">
		<form action="/jpUser/findingId" method="get">
			이름 <input type="text" id="userName" name="userName">
			<br><br>
	
		<input type="submit" value="ID検索" onclick="IdFind();">
		</form>
		<br>
		<br>
		<table border="1" style="margin: auto;">
			<c:forEach items="${findId }" var="findId">
				<tr>
					<th style="width:300px;">名前</th>
					<th style="width:300px;">ユーザーID</th>
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