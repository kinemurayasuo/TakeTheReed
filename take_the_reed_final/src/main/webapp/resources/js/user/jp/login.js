function loginCheck() {
	var checkId = document.getElementById("checkId").value;
	var checkPw = document.getElementById("checkPw").value;
	var result = false;
	
	if(checkId == "" || checkId.length == 0){
		alert("IDを入力してください。");
		return result;
	}else if(checkId.length < 3 || checkId.length > 10){
		alert("ユーザーIDは3文字以上10文字以内でお願いします。");
		return result;
	}
	
	if(checkPw == "" || checkPw.length == 0){
		alert("パスワードを入力してください。");
		return result;
	}else if(checkPw.length < 6 || checkPw.length > 16){
		alert("パスワードは6文字以上16文字以下でお願いします。");
		return result;
	}
	
	result = true;
	return result;
}