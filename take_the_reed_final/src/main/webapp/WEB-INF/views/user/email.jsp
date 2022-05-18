<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일인증</title>
 	<!-- JavaScripts -->
	<script type="text/javascript" src="/resources/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="/resources/js/user/email.js"></script>
	
</head>
<body>
 
<table border="1"  width="300" height="300" align="center" onsubmit="return formChk();">
<center>
<span style="color: red; font-weight: bold;">이메일 인증 (이메일을 인증 받아야 회원가입으로 넘어갈 수 있습니다.)</span> <br> <br>    
        <br> <br>
        

        <div style="text-align:center;">
            <tr>        
                <td>
                <center>
                    <form action="/user/email" method="post" >
                    
                    <center>
                        <br>
                        <div>
                            이메일 : <input type="email" id="userEmail" name="userEmail" placeholder="이메일주소를 입력하세요. ">
                        </div>                                                    
 
                        <br> <br>
                        <button type="submit" name="submit">이메일 인증받기 (이메일 보내기)</button>
                        </div>
                    </td>
                </tr>
                    </center>
            </table>
        </form>
</center>
 
</body>
</html>
			