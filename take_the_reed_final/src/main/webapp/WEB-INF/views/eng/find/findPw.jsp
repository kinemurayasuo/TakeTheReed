<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="/resources/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="/resources/js/eng/email.js"></script>
	
</head>
<body>
 
<div style="text-align:center;">
<span style="color: red; font-weight: bold;">Email Verification (You can sign in after verify your email)</span> <br> <br>    
<br> <br>
<table border="1" style="width: 300px; height: 300; align-content: center;" onsubmit="return formChk();">
        

            <tr>
            	<td>
            		ID:<input type="text" id="userId" name="userId">
            	</td>
                <td>
                    <form action="/eng/email" method="post" >
					<br>
                        <div>
							Email : <input type="email" id="userEmail" name="userEmail" placeholder="Enter your email address.">
                        </div>                                                    
					<br>
						<button type="submit" name="submit">Send Code</button>
					</form>
					<c:if test="">
						<form action="emailChk${dice}" method="post"> <!-- 받아온 인증코드를 컨트롤러로 넘겨서 일치하는지 확인 -->
                        <br>
                        <div>
							Verification Code : <input type="number" name="emailInjeung" placeholder="Enter your verification code.">
						</div>                                        
                        <br> <br>
                        <button type="submit" name="submit">Continue</button>
			        </form>
					</c:if>
				</td>
			</tr>
</table>
</div>
</body>
</html>