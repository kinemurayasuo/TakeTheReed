<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keyWords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>우리들의 프로젝트</title>
    
    <script type="text/javascript">
    	function JlistPaging() {
            var searchType = $("#searchType option:selected").val();
            var searchWord = $("#searchWord").val();

            $.ajax({
                url: "/eask/askList",
                type: "get",
                data: 
                {
                    searchType: searchType,
                    searchWord: searchWord
                }
            })
        }
    </script>

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
    <!-- Hero Section End -->

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="/resources/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Contact Us</h2>
                        <div class="breadcrumb__option">
                            <a href="/2">Home</a>
                            <span>Contact Us</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- 게시판 글 보기 -->
    <section>
    	<div class="row">
        <div class="col-md-12">
        	<div class = "table-wrapper">
        	<form action="/eask/askList">
				<label><input type="radio" value="date_desc" name="sort">Most Recent</label>
				<label><input type="radio" value="date_asc" name="sort">Oldest First</label>
				<input type="submit" value="Sort">
			</form>
      		 	 <table>
					<thead>
						<tr>
							<th>Num</th>
							<th>Title</th>
							<th>Writer</th>
							<th>Date Created</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test = "${empty askList }">
								<tr>
									<td colspan = "4">There is no post.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach items = "${askList }" var = "ask">
									
									<tr>
										<td>${ask.askNum }</td>
										<td>
											<a href = "/eask/ask?askNum=${ask.askNum }">
												${ask.askTitle }					
											</a>
										</td>
										<td>${ask.userNm }</td>
										<td>${ask.askTime }</td>
									</tr>
								</c:forEach>			
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>		
		<div style="text-align: center;">
		<span>
		<c:if test="${navi.currentPage > 1 }">
		<a href = "/eask/askList?currentPage=${(navi.currentGroup - 1) * 5 + 1 }" style="color=blue; text-decoration:none; text-align: center;font-size: 1.5em;">
			◀◀&nbsp;
	
		</a>
	</c:if>
	
	<c:forEach begin = "${navi.startPageGroup }" end = "${navi.endPageGroup }" var = "pageNum">
		<c:if test = "${pageNum == navi.currentPage }">
			<a href = "/eask/askList?currentPage=${pageNum }" style="color : red; text-decoration:none;text-align: center;font-size: 1.5em;">
				<span style = "color : red">
					${pageNum } 
				</span>
			</a>
		</c:if>
		<c:if test = "${pageNum != navi.currentPage }">
			<a href = "/eask/askList?currentPage=${pageNum }" style="color : black; text-decoration:none;text-align: center;font-size: 1.5em;">
				<span>
					${pageNum }
				</span>
			</a>
		</c:if>
	</c:forEach>
	
	<c:if test="${navi.currentPage < navi.totalPageCount }">
		<a href = "/eask/askList?currentPage=${(navi.currentGroup + 1) * 5 + 1 }" style="color=blue; text-decoration:none;text-align: center; font-size: 1.5em;">
			▶▶
		</a>
	</c:if>
	
	</span>
	</div>
				<div style="text-align: center;">
					<br>
					<input type = "button" value = "Write" onclick = "location.href = '/eask/askListWrite';" id = "submit">
 				</div>
        </div>
    </div>
</div>
<section>
	<div class="container">
			<div class="row">
				<form action = "/eask/askListSearch" method="get">
					<table class="pull-right">
						<tr>
							<td>
							<select id="searchType" name="searchType">
								<option value="askTitle">Title</option>
								<option value="askCon">Content</option>
								<option value="userNm">Nickname</option>
							</select>		
							</td>
							<td><input type="text" class="form-control" id="searchWord"
								placeholder="Search by title, author, subject" name="searchWord" maxlength="100" ></td>
							<td><button id = "searchBtn" onclick = "JlistPaging();">GO</button></td>	
						</tr>
					</table>
				</form>
			</div>
		</div>
</section>
    </section>
    
    <!-- Breadcrumb Section End -->

    <!-- Contact Section Begin -->
    <section class="contact spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-3 col-sm-6 text-center">
                    <div class="contact__widget">
                        <span class="icon_phone"></span>
                        <h4>Phone</h4>
                        <p>+01-3-8888-6868</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6 text-center">
                    <div class="contact__widget">
                        <span class="icon_pin_alt"></span>
                        <h4>Address</h4>
                        <p>60-49 Road 11378 New York</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6 text-center">
                    <div class="contact__widget">
                        <span class="icon_clock_alt"></span>
                        <h4>Open time</h4>
                        <p>10:00 am to 23:00 pm</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-6 text-center">
                    <div class="contact__widget">
                        <span class="icon_mail_alt"></span>
                        <h4>Email</h4>
                        <p>hello@colorlib.com</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Contact Section End -->

    <!-- Map Begin -->
    <!-- <div class="map">
        <iframe
            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d49116.39176087041!2d-86.41867791216099!3d39.69977417971648!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x886ca48c841038a1%3A0x70cfba96bf847f0!2sPlainfield%2C%20IN%2C%20USA!5e0!3m2!1sen!2sbd!4v1586106673811!5m2!1sen!2sbd"
            height="500" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
        <div class="map-inside">
            <i class="icon_pin"></i>
            <div class="inside-widget">
                <h4>New York</h4>
                <ul>
                    <li>Phone: +12-345-6789</li>
                    <li>Add: 16 Creek Ave. Farmingdale, NY</li>
                </ul>
            </div>
        </div>
    </div> -->
    <!-- Map End -->

    <!-- Contact Form Begin -->
   <!--  <div class="contact-form spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="contact__form__title">
                        <h2>Leave Message</h2>
                    </div>
                </div>
            </div>
            <form action="#">
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <input type="text" placeholder="Your name">
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <input type="text" placeholder="Your Email">
                    </div>
                    <div class="col-lg-12 text-center">
                        <textarea placeholder="Your message"></textarea>
                        <button type="submit" class="site-btn">SEND MESSAGE</button>
                    </div>
                </div>
            </form>
        </div>
    </div> -->
    <!-- Contact Form End -->

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