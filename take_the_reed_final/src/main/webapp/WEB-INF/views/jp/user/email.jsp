<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>アカウント登録[メール認証]</title>
 	<!-- JavaScripts -->
	<script type="text/javascript" src="/resources/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="/resources/js/user/jp/email.js"></script>
	
</head>
<body>
 
<table border="1"  width="300" height="300" align="center" onsubmit="return formChk();">
<center>
<span style="color: red; font-weight: bold;">メール認証 </span> <br> <br>    
        <br> <br>
        

        <div style="text-align:center;">
            <tr>        
                <td>
                <center>
                    <form action="/jpUser/email" method="post" >
                    
                    <center>
                        <br>
                        <div>
                            メール : <input type="email" id="userEmail" name="userEmail" placeholder="メールアドレス">
                        </div>                                                    
 
                        <br> <br>
                        <button type="submit" name="submit">メール認証 [送信]</button>
                        </div>
                    </td>
                </tr>
                    </center>
            </table>
        </form>
</center>
 
</body>
</html>
			