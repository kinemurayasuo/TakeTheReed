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
    <title>우리들의 프로젝트</title>

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

    <!-- Hero Section Begin -->
    <section class="hero">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="hero__categories">
                        <div class="hero__categories__all">
                            <i class="fa fa-bars"></i>
                            <span>All departments</span>
                        </div>
                        <ul>
                            <li><a href="#">Novel</a></li>
                            <li><a href="#">Essay</a></li>
                            <li><a href="#">Literature</a></li>
                            <li><a href="#">Economy</a></li>
                            <li><a href="#">Personal Development</a></li>
                            <li><a href="#">Cartoon</a></li>
                            <li><a href="#">Dictionary</a></li>
                            <li><a href="#">Study</a></li>
                            <li><a href="#">License</a></li>
                            <li><a href="#">Children</a></li>
                            <li><a href="#">Art</a></li>
                            <li><a href="#">Foreign Language</a></li>
                            <li><a href="#">Magazine</a></li>
                            <li><a href="#">Used Book</a></li>
                            <li><a href="#">Religion</a></li>
                            <li><a href="#">Computers/Mobile Phone</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="hero__search">
                        <div class="hero__search__form">
                            <form action="#">
                                <input type="text" placeholder="Search by title, author, subject">
                                <button type="submit" class="site-btn">GO</button>
                            </form>
                        </div>
                        
                    </div> 
                </div>
            </div>
        </div>
    </section>
	
	<form action = "/eask/askListUpdate" method = "post" class = "form">
		<input type="hidden" name="askNum" value="${askList.askNum }">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<table border = "1" class ="table">
						<tr>
							<td class="td1">Title</td>
							<td class="td3">
								<input class="td3" type="text" name="askTitle" placeholder="Tell us what you need help with" value = "${askList.askTitle}">
							</td>
						</tr>
						<tr>
							<td class="td2">Content</td>
							<td class="td4">
								<input class="td4" name="askCon" placeholder="Tell us what you need help with" value = "${askList.askCon}">
							</td>
						</tr>
						
					</table>
					<button type = "submit" class = "btn btn-primary">
						Registration
					</button>
					<button type = "button" class = "btn btn-primary">
						Cancellation
					</button>
				</div>
			</div>
		</div>
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