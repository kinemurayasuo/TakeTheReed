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
 
<table border="1"  width="300" height="300" align="center" onsubmit="return formChk();">
<center>
<span style="color: red; font-weight: bold;">Email Verification (You can sign in after verify your email)</span> <br> <br>    
        <br> <br>
        

        <div style="text-align:center;">
            <tr>        
                <td>
                <center>
                    <form action="/eng/email" method="post">
                    
                    <center>
                        <br>
                        <div>
                            Email: <input type="email" id="userEmail" name="userEmail" placeholder="Enter your email address.">
                        </div>                                                    
 
                        <br> <br>
                        <button type="submit" name="submit">Send Code</button>
                        </div>
                    </td>
                </tr>
                    </center>
            </table>
        </form>
</center>
 
</body>
</html>
			