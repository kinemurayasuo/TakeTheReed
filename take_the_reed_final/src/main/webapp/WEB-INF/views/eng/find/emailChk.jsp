<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Verification Code</title>
</head>
<body>
 
<span style="color: red; font-weight: bold;">You can sign in  after entering a verification code.</span> <br> <br>    
        <br> <br>
<div style="text-align:center;">
<table border="1" style=" width:300px; height:300px; margin: auto;">
        
        
            <tr>        
                <td>
                    <form action="/eng/emailChk${dice}" method="post"> 
                        <br>
                        <div>
                           Verification Code: <input type="number" name="emailInjeung"
                                placeholder="Enter your verification code.">
                        </div>                                        
 
                        <br> <br>
                        <button type="submit" name="submit">Continue</button>
			        </form>
                    </td>
                </tr>
            </table>
</div>
 
 
</body>
</html>