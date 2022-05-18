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
<title>メール認証</title>
<script type="text/javascript">
function emailChk() {
	$.ajax({
		url: "/jpUser/updatePw{dice}",
		type: "post",
		data: {
			emailInjeung: $("#emailInjeung").val()
		},
		success: function(res) {
			opener.location.href='/jpUser/updatePw';
			window.close();
		}
	})
}
</script>
</head>
<body>
 
<span style="color: red; font-weight: bold;">メールを送信しました。記載されている確認コードを入力してください。</span> <br> <br>    
        <br> <br>
<div style="text-align:center;">
	<table border="1" style=" width:300px; height:300px; margin: auto;">
		<tr>        
			<td>
				<form action="updatePw${dice}" method="post"> <!-- 받아온 인증코드를 컨트롤러로 넘겨서 일치하는지 확인 -->
					ユーザーID : <input type="text" id="userId" name="userId" disabled value="${userInfo.userId }">
					<br>
					<div>
						メールアドレス : <input type="email" id="userEmail" name="userEmail" disabled value="${userInfo.userEmail }">
					</div>                                                    
					<br><br>
					<div>
						確認コード : <input type="number" id="emailInjeung" name="emailInjeung"
							placeholder="確認コードを入力してください。">
					</div>                                        
					<br> <br>
					<button type="submit" name="submit" onclick="emailChk();">次へ</button>
				</form>
			</td>
		</tr>
	</table>
</div>
 
 
</body>
</html>