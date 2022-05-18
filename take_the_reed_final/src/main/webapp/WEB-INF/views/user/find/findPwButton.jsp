<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function openPwFind() {
		window.open("/user/pwFind", "findPw", "width=500, height=550, left=100, top=50");
	}
</script>
</head>
<body>
<div align="center">
<input type="button" value="이메일 인증" onclick="openPwFind();"  style="width: 270px; height: 145px; font-size: 30px;">
</div>
</body>
</html>