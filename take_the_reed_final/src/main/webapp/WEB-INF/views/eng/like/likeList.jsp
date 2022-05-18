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
    <title>My Book List</title>

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
    <section class="hero hero-normal">
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
                                <div class="hero__search__categories">
                                    All Categories
                                    <span class="arrow_carrot-down"></span>
                                </div>
                                <input type="text" placeholder="Search by title, author, subject">
                                <button type="submit" class="site-btn">GO</button>
                            </form>
                        </div>
                        <div class="hero__search__phone">
                            <div class="hero__search__phone__icon">
                                <i class="fa fa-phone"></i>
                            </div>
                            <div class="hero__search__phone__text">
                                <h5>+65 11.188.888</h5>
                                <span>support 24/7 time</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="/resources/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Blog</h2>
                        <div class="breadcrumb__option">
                            <a href="/2">HOME</a>
                            <span>Blog</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Blog Section Begin -->
    <section class="blog spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-5">
                    <div class="blog__sidebar">
                        <div class="blog__sidebar__search">
                            <form action="#">
                                <input type="text" placeholder="Search...">
                                <button type="submit"><span class="icon_search"></span></button>
                            </form>
                        </div>
                        <div class="blog__sidebar__item">
                            <h4>Category</h4>
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
                </div>
                <div class="col-lg-8 col-md-7">
                    <div align="center" class="row">
                    	<table border="1">
							<c:choose>
								<c:when test="${empty likeList }">
									<tr>
										<td colspan="4">There is no post.</td>
									</tr>	
								</c:when>
								<c:otherwise>
									<c:forEach items="${likeList }" var="list">
										<tr>
											<td colspan="2">
												<a href="#" onclick='showPopup(${list.bookNum });'>
													<img src="/uploadImg/${list.savedFilename1 }" style="width: 200px; height: 200px;">
												</a>
											</td>
										</tr>
										<tr>
											<td colspan="2">
													${list.bookName }
											</td>
										</tr>
										<tr>
											<td>${list.bookCk }</td>
										</tr>				
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</table>
					</div>
					<hr>
					<div align="center">
						<c:if test="${navi.currentPage > 1 }">
							<a href="/elike/likeList?currentPage=${(navi.currentGroup - 1) * 5 + 5 }" style="color:blue; text-decoration:none;">
								◀◀
							</a>
							<a href="/elike/likeList?currentPage=${navi.currentPage - 1 }" style="color:blue; text-decoration:none;">
								◀
							</a>
						</c:if>
						
						<c:forEach begin="${navi.startPageGroup }" end="${navi.endPageGroup }" var="pageNum">
							<c:if test="${pageNum == navi.currentPage }">
								<a href="/elike/likeList?currentPage=${pageNum }" style="color:red; text-decoration:none;">
									${pageNum }
								</a>
							</c:if>
							<c:if test="${pageNum != navi.currentPage }">
								<a href="/elike/likeList?currentPage=${pageNum }" style="color:black; text-decoration:none;">
									${pageNum }
								</a>
							</c:if>
						</c:forEach>
						
						<c:if test="${navi.currentPage < navi.totalPageCount }">
							<a href="/elike/likeList?currentPage=${navi.currentPage + 1 }" style="color:blue; text-decoration:none;">
								▶
							</a>
							<a href="/elike/likeList?currentPage=${(navi.currentGroup + 1) * 5 + 1 }" style="color:blue; text-decoration:none;">
								▶▶
							</a>
						</c:if>
					</div>
                </div>
            </div>
        </div>
    </section>
    <!-- Blog Section End -->

  	<!-- Footer Section Begin -->
	<footer class="footer spad">
		<div class="container">

			<div class="x">
				<div class="footer__about">
					<div class="footer__about__logo">
						<a href="./index.html"></a>
					</div>
					ADDRESS: 1, Cheongwadae-ro, Jongno-gu, Seoul, Republic of Korea  phone number: 02-730-5800 <i
						class="fa fa-envelope"> yoehadu815@gmail.com</i>

				</div>
			</div>
			<div class="x">
				<div class="footer__widget">
					<h6>Useful Links</h6>
					<a href="#">terms and conditions </a> <a href="#">privacy policy</a> <a href="#">Teenager Protection Policy</a>
					<a href="#">CUSTOMER SERVICE</a> <a href="#">b2b INQUIRY</a> <a href="#">
						</a>
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