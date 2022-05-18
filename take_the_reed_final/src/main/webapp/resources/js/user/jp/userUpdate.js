//닉네임 중복검사를 통과했는지 여부를 저장하는 변수
var isNmChecked = false;

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
 
 if(!isNmChecked) { //닉네임중복검사를 통과하지 못한 경우
 	alert("ユーザーネーム重複チェックをしてください。");
 	
 	return false;
 }
  
 var userPwChk = $("#userPwChk").val().replaceAll(" ","");
 if(userPw != userPwChk) {
    alert("パスワードを入力してください。");
 
    return false;
 }

// 핸드폰 유효성 검사
if ($("#userTel").val() == "" || $("#userTel").val().length != 11) {
	alert("携帯番号を正確に入力してください。");
   
	return false;
}

// 이메일 유효성 검사		
var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

var userEmail =$("#userEmail").val().trim(); 
if (userEmail == '' || !re.test(userEmail)) {
	alert("無効なメールアドレスです ex)123@naver.com")
	return false;
}
			
return true;
}