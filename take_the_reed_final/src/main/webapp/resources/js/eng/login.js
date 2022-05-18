function loginCheck() {
	var checkId = document.getElementById("checkId").value;
	var checkPw = document.getElementById("checkPw").value;
	var result = false;
	
	if(checkId == "" || checkId.length == 0){
		alert("Enter your ID.");
		return result;
	}else if(checkId.length < 3 || checkId.length > 10){
		alert("Enter your ID 3~10 characters.");
		return result;
	}
	
	if(checkPw == "" || checkPw.length == 0){
		alert("Enter your PASSWORD.");
		return result;
	}else if(checkPw.length < 6 || checkPw.length > 16){
		alert("Enter your PASSWORD 6~16.");
		return result;
	}
	
	result = true;
	return result;
}