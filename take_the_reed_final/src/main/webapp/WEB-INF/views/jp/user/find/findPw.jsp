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
<script type="text/javascript" src="/resources/js/jpUser/email.js"></script>
</head>
<body>
 
<div align="center">
<br><br>
<span style="color: red; font-weight: bold;">メール認証 </span> <br> <br>    
<br> <br>
<table border="1" style="width: 402px; height: 302px; align-content: center;" onsubmit="return formChk();">
        

		<tr>
			<td>
				<form action="/jpUser/pwFindChk" method="post"> <!-- 받아온 인증코드를 컨트롤러로 넘겨서 일치하는지 확인 -->
           			ユーザーID : <input type="text" id="userId" name="userId">
					<br>
					<div>
						メールアドレス : <input type="email" id="userEmail" name="userEmail" placeholder="メールアドレスを入力してください">
					</div>                                                    
					<br>
					<button id="emailChk" onclick="clickEmail();">メール認証 []送信]</button>
				</form>
			</td>
		</tr>
</table>
</div>
</body>
</html>