//ID중복검사를 통과했는지 여부를 저장하는 변수
var isIdChecked = false;

//닉네임 중복검사를 통과했는지 여부를 저장하는 변수
var isNmChecked = false;

// AJAX 방식으로 ID 중복검사를 실행하는 함수
function idChk() {
   var userId =$("#userId").val().trim(); // 사용자가 입력한ID값을 가져와서 공백 제거
   if(userId.length == 0) { // ID를 입력하지 않은 경우
      alert("ユーザーIDを入力してください。");

      return false;
   }
   if(userId.length < 3 || userId.length > 10 ) { // ID를 3~10자리 사이로 입력하지 않은 경우
               alert("ユーザーIDは3文字以上10文字以内でお願いします。");

               return false;
            }
   else {
   $.ajax({
      url: "/user/idChk",
      data: {
         idChk: $("#userId").val()
      },
      success: function(res) {
         if(res == "available") {
            isIdChecked = confirm("利用可能なIDです。使いますか。");
            
            if (isIdChecked) { // 확인을 누른 경우, 더이상 값을 변경하지 못하게 입력란을 읽기 전용으로 바꾸고 id중복검사 버튼을 비활성화
               $("#userId").attr("readonly","readonly"); 
               $("#user1").attr("disabled","disabled");
            }
            } else {
            alert("このIDはすでに登録されています。");
            }
         }
      });
   }
}

// AJAX 방식으로 닉네임 중복검사를 실행하는 함수
function nmChk() {
   var userNm =$("#userNm").val().trim(); // 사용자가 입력한닉네임을 가져와서 공백 제거
   if(userNm.length == 0) { // 닉네임 입력하지 않은 경우
      alert("ユーザーネームを入力してください。");

      return false;
   }
   if(userNm.length < 2 || userNm.length > 8 ) { // 닉네임을 2~8자리 사이로 입력하지 않은 경우
               alert("ユーザーネームは2文字以上8文字以下でお願いします。");

               return false;
            }
   else {
   $.ajax({
      url: "/user/nmChk",
      data: {
         nmChk: $("#userNm").val()
      },
      success: function(res) {
         if(res == "available") {
            isNmChecked = confirm("利用可能なユーザーネームです。使いますか。");
            
            if(userNm.length < 2 || userNm.length > 8 ) { // 닉네임을 2~8자리 사이로 입력하지 않은 경우
               alert("ユーザーネームは2文字以上8文字以下でお願いします。");

               return false;
            }
            if (isNmChecked) { // 확인을 누른 경우, 더이상 값을 변경하지 못하게 입력란을 읽기 전용으로 바꾸고 닉네임중복검사 버튼을 비활성화
               $("#userNm").attr("readonly","readonly"); 
               $("input:button").attr("disabled","disabled");
            }
            } else {
            alert("このユーザーネームはすでに登録されています。");
            }
         }
      });
   }
}

//회원가입 페이지에서 사용자가 입력한 데이터의 유효성을 검사하는 함수
function formChk() { 

 if(!isIdChecked) { //Id중복검사를 통과하지 못한 경우
 	alert("ID重複チェックをしてください。");
 	
 	return false;
 }
  
  if(!isNmChecked) { //닉네임중복검사를 통과하지 못한 경우
 	alert("ユーザーネーム重複チェックをしてください。");
 	
 	return false;
 }
 
// 사용자가 이름을 입력했는지 확인하는 검사
if ($("#userName").val() == "" || $("#userName").val().length == 0) {
	alert("名前を入力してください。");
   
	return false;
}
 
 var userId =$("#userId").val().trim(); // 사용자가 입력한ID값을 가져와서 공백 제거
 if(userId.length == 0) { // ID를 입력하지 않은 경우
    alert("ユーザーIDを入力してください。");
 
    return false;
 }
 if(userId.length < 3 || userId.length > 10 ) { // ID를 3~10자리 사이로 입력하지 않은 경우
    alert("ユーザーIDは3文字以上10文字以内でお願いします。");
 
    return false;
 }
 
 var userPw =$("#userPw").val().replaceAll(" ",""); //사용자가 입력한PW 값을 가져와서 모든공백을 제거
 if(userPw.length == 0) { // PW를 입력하지 않은 경우
    alert("パスワードを入力してください。");
 
    return false;
 }
if(userPw.length < 6 || userPw.length > 16 ) { // Pw를 6~16자리 사이로 입력하지 않은 경우
    alert("パスワードは6文字以上16文字以下でお願いします。");
 
    return false;
 }
 
 var userPwChk = $("#userPwChk").val().replaceAll(" ","");
 if(userPw != userPwChk) {
    alert("パスワードをご確認ください。");
 
    return false;
 }
 
// 핸드폰 유효성 검사
if ($("#userTel").val() == "" || $("#userTel").val().length != 11) {
	alert("携帯番号を正確に入力してください。");
   
	return false;
}
			
return true;
}