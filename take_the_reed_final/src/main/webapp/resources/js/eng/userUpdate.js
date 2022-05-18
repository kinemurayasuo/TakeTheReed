//닉네임 중복검사를 통과했는지 여부를 저장하는 변수
var isNmChecked = false;

// AJAX 방식으로 닉네임 중복검사를 실행하는 함수
function nmChk() {
   var userNm =$("#userNm").val().trim(); // 사용자가 입력한닉네임을 가져와서 공백 제거
   if(userNm.length == 0) { // 닉네임 입력하지 않은 경우
      alert("Enter your Nickname.");

      return false;
   }
   if(userNm.length < 2 || userNm.length > 8 ) { // 닉네임을 2~8자리 사이로 입력하지 않은 경우
               alert("Enter your Nickname 2~8 characters.");

               return false;
            }
   else {
   $.ajax({
      url: "/eng/nmChk",
      data: {
         nmChk: $("#userNm").val()
      },
      success: function(res) {
         if(res == "available") {
            isNmChecked = confirm("Nickname is available. Will you use it?");
            
            if(userNm.length < 2 || userNm.length > 8 ) { // 닉네임을 2~8자리 사이로 입력하지 않은 경우
               alert("Enter your Nickname 2~8 characters.");

               return false;
            }
            if (isNmChecked) { // 확인을 누른 경우, 더이상 값을 변경하지 못하게 입력란을 읽기 전용으로 바꾸고 닉네임중복검사 버튼을 비활성화
               $("#userNm").attr("readonly","readonly"); 
               $("input:button").attr("disabled","disabled");
            }
            } else {
            alert("Nickname is already taken.");
            }
         }
      });
   }
}

//회원가입 페이지에서 사용자가 입력한 데이터의 유효성을 검사하는 함수
function formChk() { 
 if(!isNmChecked) { //닉네임중복검사를 통과하지 못한 경우
 	alert("Click on the 'Duplicate Nickname check.'");
 	
 	return false;
 }
  
 var userPw =$("#userPw").val().replaceAll(" ",""); //사용자가 입력한PW 값을 가져와서 모든공백을 제거
 if(userPw.length == 0) { // PW를 입력하지 않은 경우
    alert("Enter your PASSWORD.");
 
    return false;
 }
if(userPw.length < 6 || userPw.length > 16 ) { // Pw를 6~16자리 사이로 입력하지 않은 경우
    alert("Enter your PASSWORD 6~16.");
 
    return false;
 }
 
 var userPwChk = $("#userPwChk").val().replaceAll(" ","");
 if(userPw != userPwChk) {
    alert("These passwords don’t match.");
 
    return false;
 }

// 핸드폰 유효성 검사
if ($("#userTel").val() == "" || $("#userTel").val().length != 11) {
	alert("Please check your phone number.");
   
	return false;
}

// 이메일 유효성 검사		
var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

var userEmail =$("#userEmail").val().trim(); 
if (userEmail == '' || !re.test(userEmail)) {
	alert("Please check your email address. ex)123@naver.com")
	return false;
}
			
return true;
}