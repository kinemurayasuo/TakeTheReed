function loginCheck() {
	var checkId = document.getElementById("checkId").value;
	var checkPw = document.getElementById("checkPw").value;
	var result = false;
	
	if(checkId == "" || checkId.length == 0){
		alert("ID를 입력해주세요");
		return result;
	}else if(checkId.length < 3 || checkId.length > 10){
		alert("ID는 3~10글자 사이로 입력해주세요");
		return result;
	}
	
	if(checkPw == "" || checkPw.length == 0){
		alert("비밀번호를 입력해주세요");
		return result;
	}else if(checkPw.length < 6 || checkPw.length > 16){
		alert("비밀번호는 6~16글자 사이로 입력해주세요");
		return result;
	}
	
	result = true;
	return result;
}