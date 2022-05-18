<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
/* $(document).on('click','#findId',function(){
	var userName = $('#name').val();

	$.ajax({
        url:'/user/findId',
        type:'POST',
        data: userName,

        success:function(data){
        	var idList = data.userName;
       	 		 $("#idList").append("<h1>"+"회원님의 ID는 : "+findId+" 입니다.</h1>")

        },
        error: function (XMLHttpRequest, textStatus, errorThrown){

        	alert('정보를 다시 입력해주시길 바랍니다.' );
        }
    });
}); */

	function IdFind() {
		var userName = $("#userName").val();
	
		$.ajax({
	        url:'/eng/findingId',
	        type:'get',
	        data: {
	        	userName: userName
	        }
	    })
	}

</script>
<title>Find ID</title>
</head>
<body>
	<form action="/eng/findingId" method="get">
		NAME <input type="text" id="userName" name="userName"><br>

	<input type="submit" value="Find ID" onclick="IdFind();">
	</form>
	<br>
	<br>

	<table border="1">
		<tr>
			<th style="width:300px;">NAME</th>
			<th style="width:300px;">ID</th>
		</tr>
		<c:choose>
			<c:when test="${empty findId }">
				<tr>
					<td>There’s no Account with the info you provided.</td>
				</tr>	
			</c:when>
			<c:otherwise>
					<tr>
						<td>${userName }</td>
						<td>${findId }</td>
					</tr>				
			</c:otherwise>
		</c:choose>
	</table>
</body>

</html>