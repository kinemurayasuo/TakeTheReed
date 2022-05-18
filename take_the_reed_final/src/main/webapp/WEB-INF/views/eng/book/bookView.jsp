<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns:ng="http://angularjs.org/" ng-app="Reader">
<head>
<meta charset="UTF-8">
<script type="text/javascript">
</script>
<title></title>
	<!-- <script type="text/javascript">
		window.onload = function() {
			$.ajax({
				url: "/book/insertRead"
			})
		}
	</script> -->
</head>
<body>
	<%-- <iframe src="/uploadImg/${book.savedFilename2 }" style="width:700px;height:700px;"></iframe> --%>
	
	<epubreader src="/uploadImg/${book.savedFilename2 }"></epubreader>

	<script src="/resources/js/jquery-3.3.1.min.js"></script>
	<script src="/resources/js/676cfceb.scripts.js"></script>
</body>
</html>