<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Ogani | Template</title>
    
    

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/style.css" type="text/css">
</head>
<body>

<!-- 게시판 글 보기 -->
    <section>
    	<div class="row">
        <div class="col-md-12">
        	<div class = "table-wrapper">
      		 	 <table>
					<thead>
						<tr>
							<th scope = "col">ID</th>
							<th scope = "col">NAME</th>
							<th scope = "col">PASSWORD</th>
							<th scope = "col">NICKNAME</th>
							<th scope = "col">MOBILE PHONE</th>
							<th scope = "col">EMAIL</th>
							<th scope = "col">SOCIAL-LOGIN STATUS</th>
							<th scope = "col"><input id="allCheck" type="checkbox" name="allCheck"/></th>
							
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test = "${empty userList }">
								<tr>
									<td colspan = "4">There is no post.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach items = "${userList }" var = "user">
									
									<tr>
										<td>${user.userId }</td>
										<td>${user.userName }</td>
										<td>
										${user.userPw }					
										</td>
										<td>${user.userNm }</td>
										<td>${user.userTel }</td>
										<td>${user.userEmail }</td>
										<td>${user.isSocialUser }</td>
										<td><input type = "checkbox" name = "RowCheck" value = "${user.userId}"></td>
										
									</tr>
								</c:forEach>			
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>		
		<div style="text-align: center;">
	</div>
				<div style="text-align: center;">
					<br>
					<input type = "button" value = "Edit" onclick="location.href = '/eadmin/userUpdate';" id = "submit">
					<input type = "button" value = "Delete" onclick = "deleteValue();" id = "submit">
 				</div>
        </div>
    </div>
</div>
<section>

<!-- Js Plugins -->
    <script src="/resources/js/jquery-3.3.1.min.js"></script>
    <script src="/resources/js/bootstrap.min.js"></script>
    <script src="/resources/js/jquery.nice-select.min.js"></script>
    <script src="/resources/js/jquery-ui.min.js"></script>
    <script src="/resources/js/jquery.slicknav.js"></script>
    <script src="/resources/js/mixitup.min.js"></script>
    <script src="/resources/js/owl.carousel.min.js"></script>
    <script src="/resources/js/main.js"></script>

<script type="text/javascript">
//책 선택 기능
$(function(){
	var chkObj = document.getElementsByName("RowCheck");
	var rowCnt = chkObj.length;
	
	$("input[name='allCheck']").click(function(){
		var chk_listArr = $("input[name='RowCheck']");
		for (var i=0; i<chk_listArr.length; i++){
			chk_listArr[i].checked = this.checked;
		}
	});
	$("input[name='RowCheck']").click(function(){
		if($("input[name='RowCheck']:checked").length == rowCnt){
			$("input[name='allCheck']")[0].checked = true;
		}
		else{
			$("input[name='allCheck']")[0].checked = false;
		}
	});
});

// 책 삭제
function deleteValue(){
	var url = "userDelete";    // Controller로 보내고자 하는 URL (.dh부분은 자신이 설정한 값으로 변경해야됨)
	var valueArr = new Array();
    var list = $("input[name='RowCheck']");
    for(var i = 0; i < list.length; i++){
        if(list[i].checked){ //선택되어 있으면 배열에 값을 저장함
            valueArr.push(list[i].value);
        }
    }
    if (valueArr.length == 0){
    	alert("There is no selected post.");
    }
    else{
		var chk = confirm("Are you sure you want to delete it?");				 
		$.ajax({
		    url : url,                    // 전송 URL
		    type : 'POST',                // GET or POST 방식
		    traditional : true,
		    data : {
		    	valueArr : valueArr        // 보내고자 하는 data 변수 설정
		    },
            success: function(jdata){
                if(jdata = 1) {
                    alert("Delete success");
                    location.replace("userList")
                }
                else{
                    alert("Delete fail");
                }
            }
		});
	}
}

</script>

</body>
</html>