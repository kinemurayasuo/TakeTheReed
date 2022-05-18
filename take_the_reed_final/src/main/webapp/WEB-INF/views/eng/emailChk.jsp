<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Verification Code</title>
</head>
<body>
 
<table border="1" width="300" height="300" align= "center">
<center>
<span style="color: red; font-weight: bold;">You can sign in  after entering a verification code.</span> <br> <br>    
        <br> <br>
        
        
        <div style="text-align:center;">
            <tr>        
                <td>
                <center>
                    <form action="/eng/emailChk${dice}" method="post">              
                    <center>
                        <br>
                        <div>
                            Verification Code: <input type="number" name="emailInjeung"
                                placeholder="Enter your verification code.">
                        </div>                                        
 
                        <br> <br>
                        <button type="submit" name="submit">Continue</button>
 
                        </div>
                    </td>
                </tr>
                    </center>
            </table>
        </form>
</center>
 
 
</body>
</html>