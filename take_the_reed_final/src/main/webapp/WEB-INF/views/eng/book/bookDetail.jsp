<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

 <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/style.css" type="text/css">
</head>

<script type="text/javascript">
//추천 기능
function clickLike() {
	$.ajax({
		url: "clickLike",
		type: "post",
		data: {
			bookNum: ${bookDetail.bookNum},
			likeChk: ${likeChk }
		},
		success: function(res){
			console.log(res);
			if(res == 0){
				alert("You added new book in your library.");
			} else if(res == 1) {
				alert("You deleted a book in your library.");
			} else if(res == -1){
				alert("You can recommend after sign in.");
			}
			location.reload();
		}
	});
}
</script>
<body>
	<!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

 <!-- Humberger Begin -->
	<div class="humberger__menu__overlay"></div>
	<div class="humberger__menu__wrapper">
		<div class="humberger__menu__logo">
			<a href="#"><img src="/resources/img/logo.png" alt=""></a>

		</div>
		<div class="humberger__menu__cart">
			<ul>
				<li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
				<li><a href="#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
			</ul>
			<div>
				구독 상태 : <span>로그인 하여 확인해 주세요</span>
			</div>
		</div>
		<div class="humberger__menu__widget">
			<div class="header__top__right__language">

				<img src="/resources/img/language.png" alt="">
				<div>ENGLISH</div>
				<span class="arrow_carrot-down"></span>
				<ul>
					<li><a href="/">한국어</a></li>
					<li><a href="/jp">日本語</a></li>
					<li><a href="/2">English</a></li>
				</ul>
			</div>
			<div class="header__top__right__auth">
				<a href="#"><i class="fa fa-user"></i> Login</a>
			</div>
		</div>
		<nav class="humberger__menu__nav mobile-menu">
			<ul>
				<li><a href="/jp"><img src="/resources/img/logo.png"
						style="width: 110px;height: 60px;" alt=""></a></li>
				<li class="active"><a href="/jp">ホーム</a></li>
				<li class="active"><a href="/jpCheckout/checkout">利用券</a></li>
				<li class="active"><a href="/jpBook/bookList">本</a></li>
				<li class="active"><a href="/jpAsk/askList">お問い合わせ</a></li>
				<c:if test="${loginName != null}">
				<li class="active"><a href="/jpLike/likeList">ブックマーク</a></li>
				</c:if>
			</ul>
		</nav>
		<div id="mobile-menu-wrap"></div>
	</div>
	<!-- Humberger End -->

	<!-- Header Section Begin -->
	<header class="header">
		<div class="header__top">
			<div class="container">
				<div class="row">
					<div class="col-lg-6 col-md-6">
						<div class="header__top__left">
							<nav class="header__menu">
								<ul>
									<li><a href="/jp"><img src="/resources/img/logo.png"
											style="width: 110px;height: 60px;" alt=""></a></li>
									<li class="active"><a href="/2">HOME</a></li>
									<li class="active"><a href="/echeckout/checkout">ORDER</a></li>
									<li class="active"><a href="/ebook/bookList">BOOK</a></li>
									<li class="active"><a href="/eask/askList">INQUIRY</a></li>
									<c:if test="${loginName != null}">
									<li class="active"><a href="/elike/likeList">BOOKMARK</a></li>
									</c:if>
								</ul>
							</nav>
						</div>
					</div>
					<div class="col-lg-6 col-md-6">
						<div class="header__top__right">
							<div class="header__top__right__language">
								<img src="/resources/img/japan.png" alt="">
								<div>日本語</div>
								<span class="arrow_carrot-down"></span>
								<ul>
									<li><a href="/">한국어</a></li>
									<li><a href="/jp">日本語</a></li>
									<li><a href="/2">English</a></li>
								</ul>
							</div>
							<div class="header__top__right__auth">
								<c:if test="${loginName == null }">
									<a href="/eng/login" class="login">Sign In</a>
	                               &nbsp;&nbsp;&nbsp;
	                               <a href="/eng/email" class="login">
										 Create an account</a>
								</c:if>
								<c:if test="${loginName != null}">
	                               <span class = "userLogin"> Hi,'${loginName}' </span>
									<a href="/eng/logout" class="portfolio">Logout</a>
									<a href="/eng/myPage" class="portfolio">My Account</a>
								</c:if>
								<div class="header__top__right__auth"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			</div>
			<div class="container">
				<div class="row">
					<div class="col-lg-6"></div>

				</div>
				<div class="humberger__open">
					<i class="fa fa-bars"></i>
				</div>
			</div>
	</header>
	<!-- Header Section End -->
	
	<form action="/ebook/bookDetail" method="get">
		<table border="1">
			<tr>
				<th rowspan="4">
					<img src="/uploadImg/${bookDetail.savedFilename1 }" style="width: 200px; height: 200px;">
				</th>
				<th colspan="2" align="center" style="width: 120px; height: 30px;">
					${bookDetail.bookName }
				</th>
			</tr>
			<tr>
				<td>
					평점들어갈부분
				</td>
				<td align="center">
					${bookDetail.bookWriter }
				</td>
			</tr>
			<tr>
				<td colspan="2" style="width: 120px; height: 30px;">
					${bookDetail.bookCon }
				</td>
			</tr>
			<tr>
				<th style="width: 120px; height: 30px;">
					<input type="button" value="My Library" onclick="location.href='/ebook/bookView?bookNum=${bookDetail.bookNum }'">
				</th>
				<td style="width: 50px; height: 30px;">
					<c:if test="${likeChk == 0 }">
						<input type="button" value="🤍" onclick="clickLike();" style="width: 50px; height: 30px;">
					</c:if>
					<c:if test="${likeChk == 1 }">
						<input type="button" value="🖤" onclick="clickLike();" style="width: 50px; height: 30px;">
					</c:if>
				</td>
			</tr>
		</table>
	</form>
	
	 <!-- Js Plugins -->
    <script src="/resources/js/jquery-3.3.1.min.js"></script>
    <script src="/resources/js/bootstrap.min.js"></script>
    <script src="/resources/js/jquery.nice-select.min.js"></script>
    <script src="/resources/js/jquery-ui.min.js"></script>
    <script src="/resources/js/jquery.slicknav.js"></script>
    <script src="/resources/js/mixitup.min.js"></script>
    <script src="/resources/js/owl.carousel.min.js"></script>
    <script src="/resources/js/main.js"></script>
	
</body>
</html>