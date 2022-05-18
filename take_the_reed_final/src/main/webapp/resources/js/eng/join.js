//ID중복검사를 통과했는지 여부를 저장하는 변수
var isIdChecked = false;

//닉네임 중복검사를 통과했는지 여부를 저장하는 변수
var isNmChecked = false;

// AJAX 방식으로 ID 중복검사를 실행하는 함수
function idChk() {
   var userId =$("#userId").val().trim(); // 사용자가 입력한ID값을 가져와서 공백 제거
   if(userId.length == 0) { // ID를 입력하지 않은 경우
      alert("Enter your ID.");

      return false;
   }
   if(userId.length < 3 || userId.length > 10 ) { // ID를 3~10자리 사이로 입력하지 않은 경우
               alert("Enter your ID 3~10 characters.");

               return false;
            }
   else {
   $.ajax({
      url: "/eng/idChk",
      data: {
         idChk: $("#userId").val()
      },
      success: function(res) {
         if(res == "available") {
            isIdChecked = confirm("ID is available. Will you use it?");
            
            if(userId.length < 3 || userId.length > 10 ) { // ID를 3~10자리 사이로 입력하지 않은 경우
               alert("Enter your ID 3~10 characters.");

               return false;
            }
            if (isIdChecked) { // 확인을 누른 경우, 더이상 값을 변경하지 못하게 입력란을 읽기 전용으로 바꾸고 id중복검사 버튼을 비활성화
               $("#userId").attr("readonly","readonly"); 
               $("#user1").attr("disabled","disabled");
            }
            } else {
            alert("ID is already taken.");
            }
         }
      });
   }
}

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

 if(!isIdChecked) { //Id중복검사를 통과하지 못한 경우
 	alert("Click on the 'Duplicate ID check.'");
 	
 	return false;
 }
  
  if(!isNmChecked) { //닉네임중복검사를 통과하지 못한 경우
 	alert("Click on the 'Duplicate Nickname check.'");
 	
 	return false;
 }
 
// 사용자가 이름을 입력했는지 확인하는 검사
if ($("#userName").val() == "" || $("#userName").val().length == 0) {
	alert("Enter your Name.");
   
	return false;
}
 
 var userId =$("#userId").val().trim(); // 사용자가 입력한ID값을 가져와서 공백 제거
 if(userId.length == 0) { // ID를 입력하지 않은 경우
    alert("Enter your ID.");
 
    return false;
 }
 if(userId.length < 3 || userId.length > 10 ) { // ID를 3~10자리 사이로 입력하지 않은 경우
    alert("Enter your ID 3~10 characters.");
 
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
			
return true;
}