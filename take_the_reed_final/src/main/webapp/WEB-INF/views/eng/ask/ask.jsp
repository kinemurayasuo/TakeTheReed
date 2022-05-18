<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${askList.askTitle }</title>
</head>
<body>
<div class="col-me-12">
	<table class="table-bordered" border ="1">
	   <tbody>
	      <tr>
	       <th width="80" style="text-align: center;">title</th>
	       <td width="300" height="50">${askList.askTitle }</td>
	       <th width="100" style="text-align: center;">date</th>
	       <td width="140" style="text-align: center;">${askList.askTime }</td>
	       <th width="100" style="text-align: center;">writer</th>
	       <td width="100" style="text-align: center;">${askList.userId }</td>
	       <td width="100" style="text-align: center;">${askList.userNm }</td>
	    </tr>
	    <tr>
	       <td colspan="6" height="370" style="vertical-align: top; text-align: left;">
	             <br>
	             ${askList.askCon }
	            </td>
	         </tr>
	      </tbody>
	   </table>
	</div>
	
	<!-- 댓글 테이블 -->
    <c:if test="${not empty loginId }">
    <div style= "margin:auto; width:1000px;" >
       <table class="table table-bordered" style="width: 1000px">
          <c:forEach items="${replyList }" var="reply">
             <tr>
                <th >${reply.userNm }</th>
                
                <td id="updateReply${reply.replyNum }">
                   <span id="updateReplyContent${reply.replyNum }">${reply.replyContent }</span>               
                </td>   
                      
                <td align="right" >
                   <span>
                      ${reply.replyDate }
                      <!-- 자신이 작성한 댓글 일 시 -->
                      <c:if test="${reply.userId == sessionScope.loginId}">
                         <input type="button" value="Delete" class="btn btn-primary" onclick="deleteReply(${reply.replyNum},${askList.askNum });">
                         <input type="button" value="Modify" class="btn btn-primary" id ="updateReply" onclick="updateReply(${reply.replyNum});">
                 </c:if>
                   </span>   
                </td>   
             </tr>
          </c:forEach>
             <tr>
                <td colspan="3">
                   <form action="/eask/replyWrite" method="post">
                      <br>
                         <div class="mb-3">
                            <textarea class="form-control" name="replyContent" rows="4" style="resize: none;width: 1000px;"></textarea>
                         </div>
                      <div align="right">
                      	<br>
                            <button type="submit" class="btn btn-primary">Leave a comment.</button>
                      </div>
                      <input type="hidden" name="askNum" value="${askList.askNum}">
                   </form>
                </td>
             </tr>
       </table>
       </div>
       </c:if>
	
	<div style="text-align: center;">
                     <!-- 글, 수정 삭제 -->
                     <!-- 자신이 작성한 글 일 시 -->
                     <c:if test="${askList.userId == sessionScope.userId}">
                     <input type="button" value="Modify" class="btn btn-primary" onclick="location.href ='/eask/askListUpdate?askNum=${askList.askNum }'">
                     <input type="button" value="Delete" class="btn btn-primary" onclick="deleteAsk(${askList.askNum });">
                     </c:if>
                     <input type="button" value="List" class="btn btn-primary" onclick="location.href='askList'">
                  </div>

<script type="text/javascript" src = "/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	
	// 글 삭제
	function deleteAsk(askNum)
	{
		var result = confirm("Are you sure you want to delete it?");
		
		if(result)
		{
			location.href = "/eask/deleteAsk?askNum=" + askNum;
		}
	}
	
	// 댓글 삭제
	function deleteReply(replyNum,askNum)
	{
		var result = confirm("Are you sure you want to delete it?");
		var str = "";
		if(result)
		{
			str += "/eask/deleteReply?replyNum=";
			str += replyNum;
			str += "&askNum=";
			str += askNum;
			location.href = str;
		}
	}
	
	$(function(){
 		$("input:button").click(function(){
				$("#updateReply").hide();		
		});
	});
	
	// 댓글 수정
	function updateReply(replyNum){
		var tr = document.getElementById("updateReply" + replyNum);
		var updateReplyContent = document.getElementById("updateReplyContent" + replyNum).innerHTML;
		
		var str = "";
		str += "<form action='/eask/updateReply' method='post'>";
		str += "	<textarea class='form-control' name='replyContent' id='exampleFormControlTextarea1' rows='4' style='resize: none;width: 700px;'>";
		str += 			updateReplyContent;
		str += 		"</textarea>";
		str += "	<div align='right'>";
		str += "		<input type='submit' value='Modify Comment' class='btn btn-primary'>";
		str += "	</div>";
		str += "	<input type='hidden' name='replyNum' value='" + replyNum + "'>";
		str += "	<input type='hidden' name='askNum' value='" + ${askList.askNum } + "'>";
		str += "</form>";
		
		tr.innerHTML = str;
	}
</script>
	
</body>
</html>