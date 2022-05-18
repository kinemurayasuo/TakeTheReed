<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>アカウント登録[メール認証]</title>
</head>
<body>
 
<table border="1" width="300" height="300" align= "center">
<center>
<span style="color: red; font-weight: bold;">メールを送信しました。記載されている確認コードを入力してください。</span> <br> <br>    
        <br> <br>
        
        
        <div style="text-align:center;">
            <tr>        
                <td>
                <center>
                    <form action="emailChk${dice}" method="post"> <!-- 받아온 인증코드를 컨트롤러로 넘겨서 일치하는지 확인     -->              
                    <center>
                        <br>
                        <div>
                            確認コード : <input type="number" name="emailInjeung"
                                placeholder="例：0000000">
                        </div>                                        
 
                        <br> <br>
                        <button type="submit" name="submit">確認する</button>
 
                        </div>
                    </td>
                </tr>
                    </center>
            </table>
        </form>
</center>
 
 
</body>
</html>