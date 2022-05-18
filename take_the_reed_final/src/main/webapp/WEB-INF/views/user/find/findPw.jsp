<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="css/nice-select.css" type="text/css">
<link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="css/style.css" type="text/css">

<script type="text/javascript" src="/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/resources/js/user/email.js"></script>
</head>
<body>
 
<div align="center">
<span style="color: red; font-weight: bold;">이메일 인증 (이메일을 인증 받아야 회원가입으로 넘어갈 수 있습니다.)</span> <br> <br>    
<br> <br>
<table border="1" style="width: 402px; height: 302px; align-content: center;" onsubmit="return formChk();">
        

		<tr>
			<td>
				<form action="/user/pwFindChk" method="post"> <!-- 받아온 인증코드를 컨트롤러로 넘겨서 일치하는지 확인 -->
           			회원ID:<input type="text" id="userId" name="userId">
					<br>
					<div>
						이메일 : <input type="email" id="userEmail" name="userEmail" placeholder="이메일주소를 입력하세요. ">
					</div>                                                    
					<br>
					<button id="emailChk" onclick="clickEmail();">이메일 인증받기 (이메일 보내기)</button>
				</form>
			</td>
		</tr>
</table>
</div>
</body>
</html>