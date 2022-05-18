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
<title>이메일 인증번호 입력</title>
<script type="text/javascript">
function emailChk() {
	$.ajax({
		url: "/user/updatePw{dice}",
		type: "post",
		data: {
			emailInjeung: $("#emailInjeung").val()
		},
		success: function(res) {
			opener.location.href='/user/updatePw';
			window.close();
		}
	})
}
</script>
</head>
<body>
 
<span style="color: red; font-weight: bold;">입력한 이메일로 받은 인증번호를 입력하세요. (인증번호가 맞아야 회원가입단계로 넘어가실 수 있습니다.)</span> <br> <br>    
        <br> <br>
<div style="text-align:center;">
	<table border="1" style=" width:300px; height:300px; margin: auto;">
		<tr>        
			<td>
				<form action="updatePw${dice}" method="post"> <!-- 받아온 인증코드를 컨트롤러로 넘겨서 일치하는지 확인 -->
					회원ID : <input type="text" id="userId" name="userId" disabled value="${userInfo.userId }">
					<br>
					<div>
						이메일 : <input type="email" id="userEmail" name="userEmail" disabled value="${userInfo.userEmail }">
					</div>                                                    
					<br><br>
					<div>
						인증번호 입력 : <input type="number" id="emailInjeung" name="emailInjeung"
							placeholder="인증번호를 입력하세요.">
					</div>                                        
					<br> <br>
					<button type="submit" name="submit" onclick="emailChk();">인증번호 전송</button>
				</form>
			</td>
		</tr>
	</table>
</div>
 
 
</body>
</html>