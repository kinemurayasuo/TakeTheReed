//회원가입 페이지로 넘어가기 전에 이메일인증 단계로, 이메일형식을 바르게 작성했는지 유효성검사
	function formChk() { 
				
	var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

	var email = document.getElementById('userEmail').value;
	if (email == '' || !re.test($email)) {
	alert("無効なメールアドレスです")
	return false;
	}
	return true;
}