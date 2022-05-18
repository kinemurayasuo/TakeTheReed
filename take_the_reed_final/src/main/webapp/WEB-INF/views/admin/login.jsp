<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/sample.css">
<meta charset="UTF-8">
<title>take | the | reed</title>
</head>
<body>
	<c:if test="${loginId == 'admin'}">
		<h1>LOGIN</h1>
		<form action="login_check" method="post">
			<c:if test="${param.ng!=null}">
				<p>
					error :
					<c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}" />
				</p>
			</c:if>
			USER : <input type="text" name="user_id"><br> PASSWORD :
			<input type="password" name="user_pw"><br> <input
				type="submit" value="Login">
		</form>
	</c:if>
	
	<c:if test="${loginId != 'admin'}">
		<script type="text/javascript">
			alert("관리자만 접근 가능한 페이지 입니다.");
			location.href="/"
		</script>
	</c:if>
	
</body>
</html>