<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>로그인</title>

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
    
     <!-- JavaScripts -->
	<script type="text/javascript" src="/resources/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="/resources/js/user/login.js"></script>
	
    <style type="text/css">
	#r {
		color:red;
		font-weight:bold;
	}
	</style>
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


    <!-- 로그인  begin -->     
    <section class="checkout spad">
        <div class="container">      
            <div class="checkout__form">
                <h4>로그인</h4>
                
       <form action="/user/login" method="post" onsubmit="return loginCheck();">
			<table style="margin-left:auto; margin-right:auto;" class="checkout__input">
				<tr>
					<td>아이디</td>
						<td><input type="text" name="userId" id="checkId"/></td>
						<td rowspan="2"><input type="submit" value="로그인" style="background-color:#ADFA7E; color:black; width: 70pt; height:70pt; font-family:'IBM Plex Sans KR'; font-weight:bold; text-align: center;"/>
					</td>
				</tr>
				<tr>
					<td class="bold">비밀번호</td>
					<td><input type="password" name="userPw" id="checkPw"/></td>
				</tr>
				<c:if test="${not empty errorMessage}">
				<tr id="r">
					<td colspan="2"> ${errorMessage } </td>
				</tr>
				</c:if> 
			</table><br>
           
	      	<p align="center" style="font-weight:bold;">아이디/비밀번호를 잊어버리셨습니까?</p>
			<div align="center"  class="checkout__input">
	      		<input type="button" value="ID/비밀번호 찾기 " style="font-family:'IBM Plex Sans KR'; color:black; width:150pt; height:37pt; font-weight:bold; background-color:#ADFA7E;" 
	      															onclick="location.href='/user/find';">
	      	</div><br>
	  </form>
		
		<!-- 네이버 로그인 창으로 이동 -->
		<div id="naver_id_login" style="text-align:center"><a href="${url}">
		<img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></a>
		</div>
		<br>           
                
     </div>      
    </div>
  </section>
  <!-- 로그인 end -->   

    <!-- Footer Section Begin -->
	<footer class="footer spad">
		<div class="container">

			<div class="x">
				<div class="footer__about">
					<div class="footer__about__logo">
						<a href="./index.html"></a>
					</div>
					주소: 서울특별시 종로구 청와대로 1 (세종로) 전화번호: 02-730-5800 <i
						class="fa fa-envelope"> yoehadu815@gmail.com</i>

				</div>
			</div>
			<div class="x">
				<div class="footer__widget">
					<h6>Useful Links</h6>
					<a href="#">이용약관 </a> <a href="#">개인정보처리방침</a> <a href="#">청소년보호정책</a>
					<a href="#">고객센터</a> <a href="#">b2b 문의</a> <a href="#">콘텐츠
						제휴문의</a>
				</div>
			</div>
			<div class="x">
				<div class="footer__widget">
					Copyright © 2022 take the reed (테이크 더 리드) ALL rights Reserved
					<!-- <div class="footer__widget__social">
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-instagram"></i></a>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-pinterest"></i></a>
                        </div> -->
				</div>
			</div>
		</div>

	</footer>
	<!-- Footer Section End -->

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