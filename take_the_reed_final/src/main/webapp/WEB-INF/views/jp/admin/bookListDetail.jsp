<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="f"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>本管理</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <script type="text/javascript" src="/resources/js/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" href="/resources/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/nice-select.css" type="text/css">
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
									<li class="active"><a href="/jp">ホーム</a></li>
									<li class="active"><a href="/jpCheckout/checkout">利用券</a></li>
									<li class="active"><a href="/jpBook/bookList">本</a></li>
									<li class="active"><a href="/jpAsk/askList">お問い合わせ</a></li>
									<c:if test="${loginName != null}">
									<li class="active"><a href="/jpLike/likeList">ブックマーク</a></li>
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
									<a href="/jpUser/login" class="login"> ログイン</a>
	                               &nbsp;&nbsp;&nbsp;
	                               <a href="/jpUser/email" class="login">
										アカウント登録</a>
								</c:if>
								<c:if test="${loginName != null}">
	                               <span class = "userLogin"> '${loginName}' 様  </span>
									<a href="/jpUser/logout" class="portfolio">ログアウト</a>
									<a href="/jpUser/myPage" class="portfolio">マイページ</a>
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
	
		<form action="/admin/bookListDetail" method="get">
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
					<input type="button" value="読む" onclick="location.href='/admin/bookView?bookNum=${bookDetail.bookNum }'">
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
			<tr>
				<td><input type="button" value="修正" class="btn btn-primary" onclick="location.href = '/admin/bookListUpdate?bookNum=${bookDetail.bookNum }'"></td>
			</tr>
		</table>
	</form>
	<form action="/admin/bookListDetail" method="post">
		<input type="hidden" name="bookNum" value="${bookDetail.bookNum }">
 				<select name="bookStar" id="star" class="form-control">
                     <option value="1">1</option>
                     <option value="2">2</option>
                     <option value="3">3</option>
                     <option value="4">4</option>
                     <option value="5">5</option>
                </select>
		<input type="submit" class="btn btn-primary" value="評価入力">
	</form>
	
    <!-- Footer Section Begin -->
    <footer class="footer spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="footer__about">
                        <div class="footer__about__logo">
                            <a href="./index.html"><img src="/resources/img/logo.png" alt=""></a>
                        </div>
                        <ul>
                            <li>Address: 60-49 Road 11378 New York</li>
                            <li>Phone: +65 11.188.888</li>
                            <li>Email: </li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-6 offset-lg-1">
                    <div class="footer__widget">
                        <h6>Useful Links</h6>
                        <ul>
                            <li><a href="#">About Us</a></li>
                            <li><a href="#">About Our Shop</a></li>
                            <li><a href="#">Secure Shopping</a></li>
                            <li><a href="#">Delivery infomation</a></li>
                            <li><a href="#">Privacy Policy</a></li>
                            <li><a href="#">Our Sitemap</a></li>
                        </ul>
                        <ul>
                            <li><a href="#">Who We Are</a></li>
                            <li><a href="#">Our Services</a></li>
                            <li><a href="#">Projects</a></li>
                            <li><a href="#">Contact</a></li>
                            <li><a href="#">Innovation</a></li>
                            <li><a href="#">Testimonials</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-4 col-md-12">
                    <div class="footer__widget">
                        <h6>Join Our Newsletter Now</h6>
                        <p>Get E-mail updates about our latest shop and special offers.</p>
                        <form action="#">
                            <input type="text" placeholder="Enter your mail">
                            <button type="submit" class="site-btn">Subscribe</button>
                        </form>
                        <div class="footer__widget__social">
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-instagram"></i></a>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-pinterest"></i></a>
                        </div>
                    </div>
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
    <script type="text/javascript">
    
    (function () {
        var starEls = document.querySelectorAll('#star span.star');
        var rate = 0;

        loop(starEls, function (el, index) {
            el.addEventListener('click', function () {
                rating(index + 1);
            });
        });

        function loop(list, func) {
            Array.prototype.forEach.call(list, func);
        }

        function rating(score) {
            loop(starEls, function (el, index) {
                if (index < score) {
                    el.classList.add('on');
                } else {
                    el.classList.remove('on');
                }
            });

            rate = score;
        }
    })();
   
	
	</script>



</body>

</html>