<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>take | the | reed</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="/resources/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/elegant-icons.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/nice-select.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/jquery-ui.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/style.css" type="text/css">
</head>

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
				<div>한국어</div>
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
				<li class="active"><a href="/">메인</a></li>
				<li class="active"><a href="./shop-grid.html">안녕하세요</a></li>
				<li class="active"><a href="#">Pages</a>
					<ul class="header__menu__dropdown">
						<li><a href="./shop-details.html">Shop Details</a></li>
						<li><a href="./shoping-cart.html">Shoping Cart</a></li>
						<li><a href="./checkout.html">Check Out</a></li>
						<li><a href="./blog-details.html">Blog Details</a></li>
					</ul></li>
				<li><a href="/book/bookList">책 보기</a></li>
				<li><a href="/book/bookDetail">Contact</a></li>
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
									<li><a href="/"><img src="/resources/img/logo.png"
											style="width: 110px;height: 60px;" alt=""></a></li>
									<li class="active"><a href="/">메인</a></li>
									<li class="active"><a href="/checkout/checkout">결제</a></li>
									<li class="active"><a href="/book/bookList">도서</a></li>
									<li class="active"><a href="/ask/askList">문의</a></li>
									<c:if test="${loginName != null}">
									<li class="active"><a href="/like/likeList">북마크</a></li>
									</c:if>
								</ul>
							</nav>
						</div>
					</div>
					<div class="col-lg-6 col-md-6">
						<div class="header__top__right">
							<div class="header__top__right__language">
								<img src="/resources/img/korean.png" alt="">
								<div>한국어</div>
								<span class="arrow_carrot-down"></span>
								<ul>
									<li><a href="/">한국어</a></li>
									<li><a href="/jp">日本語</a></li>
									<li><a href="/2">English</a></li>
								</ul>
							</div>
							<div class="header__top__right__auth">
								<c:if test="${loginName == null }">
									<a href="/user/login" class="login"> 로그인</a>
	                               &nbsp;&nbsp;&nbsp;
	                               <a href="/user/email" class="login">
										회원가입</a>
								</c:if>
								<c:if test="${loginName != null}">
	                               <span class = "userLogin"> '${loginName}' 회원 님 </span>
									<a href="/user/logout" class="portfolio">로그아웃</a>
									<a href="/user/myPage" class="portfolio">마이 페이지</a>
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

	<!-- Hero Section End -->
	<section class="latest-product spad">
		<div class="contact-form spad">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="contact__form__title">
							<h2>글 쓰기</h2>
						</div>
					</div>
				</div>
				<form action="/ask/askListWrite" method="post" class="form">
					<div class="row">
						<div class="col-lg-12 text-center">
							<input type="text" placeholder="제목" name="askTitle" id = "askTitle">
						</div>
						<div class="col-lg-12 text-center">
							<textarea placeholder="내용" name="askCon" id = "askCon"></textarea>
						</div>
					</div>
					<div>
						<button type="submit" class="site-btn1" onclick = "return askTable();" >작성하기</button>
						<button type="submit" class="site-btn2">취소</button>
					</div>
				</form>
			</div>
		</div>
		
	</section>
	<!-- Js Plugins -->
	<script src="/resources/js/jquery-3.3.1.min.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/jquery.nice-select.min.js"></script>
	<script src="/resources/js/jquery-ui.min.js"></script>
	<script src="/resources/js/jquery.slicknav.js"></script>
	<script src="/resources/js/mixitup.min.js"></script>
	<script src="/resources/js/owl.carousel.min.js"></script>
	<script src="/resources/js/main.js"></script>

	<script type="text/javascript" src="/resources/js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function() {

		$(".cancel_btn").on("click", function() {
			event.preventDefault();
			location.href = "/ask/askList";
		})
	})
		
	function askTable() 
	{
	   var askTitle = $("#askTitle").val(); // 사용자가 입력한닉네임을 가져와서 공백 제거
	   var askCon = $("#askCon").val();
	   var result = true;
	   var wordChk = ["고한영바보", "고한영멍청이", "패왕고한영" ,"청와대", "야스쿠니신사", "고한영친일파"];
	   
	   if(askTitle.length == 0) 
	   {
	      alert("제목을 입력해주세요.");
	      if(askCon.length == 0)
		   {
			   alert("내용을 입력해주세요.");
			   return false;
		   }
	      return false;
	   }
	   
	   if(askCon.length == 0)
	   {
		   if(askTitle.length == 0) 
		   {
			   alert("제목을 입력해주세요.");
		   }
		   alert("내용을 입력해주세요.");
		   return false;
	   }
	   
	   
	   
		for ( var i = 0; i < wordChk.length; i++ )
		{
			if ( (askCon.trim()).indexOf(wordChk[i]) > -1 )
			{
				alert("는 금지어입니다.");
				return false;
			}
		}
		
		return result;
	}
	</script>
</body>
</html>
