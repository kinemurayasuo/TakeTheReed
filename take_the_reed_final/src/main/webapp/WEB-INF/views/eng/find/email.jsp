<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Email Verification</title>
 	<!-- JavaScripts -->
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
                    <form action="/eng/email" method="post" >
                    
                        <br>
                        <div>
                            Email: <input type="email" id="userEmail" name="userEmail" placeholder="Enter your email address.">
                        </div>                                                    
 
                        <br> <br>
                        <button type="submit" name="submit">Send Code</button>
						</form>
				</td>
			</tr>
</table>
</div>
 
</body>
</html>
			