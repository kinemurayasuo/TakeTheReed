<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>take | the | reed</title>
<script type="text/javascript">
	function JlistPaging() {
		var searchType = $("#searchType option:selected").val();
		var searchWord = $("#searchWord").val();

		$.ajax({
			url : "/book/bookList",
			type : "get",
			data : {
				searchType : searchType,
				searchWord : searchWord
			}
		})
	}

	function JlistPaging1() {
		var searchWord = $("#searchWord").val();

		$.ajax({
			url : "/book/bookList",
			type : "get",
			data : {
				searchWord : searchWord
			}
		})
	}
	
	function showPopup(bookNum) {
		window.open("/book/bookDetail?bookNum=" + bookNum, "bookDetail",
				"width=1600, height=1400, left=100, top=50");
	}
</script>

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

	<!-- Hero Section Begin -->
	<section class="hero">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="hero__categories">
						<div class="hero__categories__all">
							<i class="fa fa-bars"></i> <span>장르</span>
						</div>
						<ul>

							<li class="title"><a
								href="http://localhost:8888/book/bookListSearch?searchType=bookCate&searchWord=문학">문학</a></li>
							<li class="title"><a
								href="http://localhost:8888/book/bookListSearch?searchType=bookCate&searchWord=경제경영">경제경영</a></li>
							<li class="title"><a
								href="http://localhost:8888/book/bookListSearch?searchType=bookCate&searchWord=자기계발">자기개발</a></li>
							<li class="title"><a
								href="http://localhost:8888/book/bookListSearch?searchType=bookCate&searchWord=만화">만화</a></li>
							<li class="title"><a
								href="http://localhost:8888/book/bookListSearch?searchType=bookCate&searchWord=수험서">수험서</a></li>
							<li class="title"><a
								href="http://localhost:8888/book/bookListSearch?searchType=bookCate&searchWord=어린이">어린이</a></li>
							<li class="title"><a
								href="http://localhost:8888/book/bookListSearch?searchType=bookCate&searchWord=예술">예술</a></li>
							<li class="title"><a
								href="http://localhost:8888/book/bookListSearch?searchType=bookCate&searchWord=외국어">외국어</a></li>
							<li class="title"><a
								href="http://localhost:8888/book/bookListSearch?searchType=bookCate&searchWord=종교">종교</a></li>
							<li class="title"><a
								href="http://localhost:8888/book/bookListSearch?searchType=bookCate&searchWord=컴퓨터/모바일">컴퓨터/모바일</a></li>

						</ul>
					</div>
				</div>
				<div class="col-lg-9">
					<div class="hero__search">
						<div class="hero__search__form">
							<form action="/book/bookListSearch">
							<div class="col-lg-8 col-md-7">
								<select id="searchType" name="searchType" class = "select1">
									<option value="bookName">책이름</option>
									<option value="bookCon">내용</option>
								</select> 
								<input type="text" placeholder="What do yo u need?"
									name="searchWord">
								<button type="submit" class="site-btn" onclick="JlistPaging();">SEARCH</button>
								</div>
							</form>
						</div>
					</div>
					<div class="hero__item set-bg"
						data-setbg=/resources/img/book/main.jpg>
						<div class="hero__text">
							<span>메인책</span>
							<h2>
								우리가 원하는<br>여러분들의 도서
							</h2>
							<p>지식을 위한 이야기</p>
							<a href="/checkout/checkout" class="primary-btn">구독</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Hero Section End -->

	<!-- Categories Section Begin -->
	<section class="categories">
		<div class="container">
			<div class="row">
				<div class="categories__slider owl-carousel">
					<c:forEach items="${homeBookList }" var="list">
						<div class="col-lg-3_1">
							<a href="#" onclick='showPopup(${list.bookNum });'>
								<div class="categories__item set-bg" data-setbg="/uploadImg/${list.savedFilename1 }">
								</div>
							</a>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</section>
	<!-- Categories Section End -->

	<!-- Featured Section Begin -->
	<section class="featured spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title from-blog__title">
						<h2>전체 책</h2>
					</div>
				</div>
			</div>
			<div class="row featured__filter">
				<c:forEach items="${homeBookList }" var="list">
					<div class="col-lg-3 col-md-4 col-sm-6 mix manga *">
						<div class="featured__item">
							<div class="featured__item__pic set-bg"
								data-setbg="/uploadImg/${list.savedFilename1 }">
								<ul class="featured__item__pic__hover">
									<li><a href="#"><i class="fa fa-heart"></i></a></li>
									<li><a href="/checkout/checkout"><i class="fa fa-shopping-cart"></i></a></li>
								</ul>
							</div>
							<div class="featured__item__text">
								<h6>
									<a href="#" onclick='showPopup(${list.bookNum });'>${list.bookName }</a>
								</h6>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>
	<!-- Featured Section End -->


	<!-- Latest Product Section Begin -->
	<!-- Latest Product Section Begin -->
	<section class="latest-product spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-4 col-md-6">
					<div class="latest-product__text">
						<h4>최근 유행하는 도서</h4>
						<div class="latest-product__slider owl-carousel">
							<div class="latest-prdouct__slider__item">
								<c:forEach items="${homeBookList }" var="list" begin="1" end="3">
								<a href="#" onclick='showPopup(${list.bookNum });' class="latest-product__item">
									<div class="latest-product__item__pic">
										<img src="/uploadImg/${list.savedFilename1 }" alt="">
									</div>
									<div class="latest-product__item__text">
										<h6>${list.bookName }</h6>
									</div>
								</a></c:forEach> 
							</div>
							<div class="latest-prdouct__slider__item">
								<c:forEach items="${homeBookList }" var="list" begin="4" end="6">
								<a href="#" onclick='showPopup(${list.bookNum });' class="latest-product__item">
									<div class="latest-product__item__pic">
										<img src="/uploadImg/${list.savedFilename1 }" alt="">
									</div>
									<div class="latest-product__item__text">
										<h6>${list.bookName }</h6>
									</div>
								
								</a></c:forEach>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="latest-product__text">
						<h4>인기있는 도서</h4>
						<div class="latest-product__slider owl-carousel">
							<div class="latest-prdouct__slider__item">
								<c:forEach items="${homeBookList }" var="list" begin="7" end="9">
								<a href="#" onclick='showPopup(${list.bookNum });' class="latest-product__item">
									<div class="latest-product__item__pic">
										<img src="/uploadImg/${list.savedFilename1 }" alt="">
									</div>
									<div class="latest-product__item__text">
										<h6>${list.bookName }</h6>
									</div>
								</a></c:forEach> 
							</div>
							<div class="latest-prdouct__slider__item">
								<c:forEach items="${homeBookList }" var="list" begin="10" end="12">
								<a href="#" onclick='showPopup(${list.bookNum });' class="latest-product__item">
									<div class="latest-product__item__pic">
										<img src="/uploadImg/${list.savedFilename1 }" alt="">
									</div>
									<div class="latest-product__item__text">
										<h6>${list.bookName }</h6>
									</div>
								
								</a></c:forEach>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="latest-product__text">
						<h4>추천이 많은 도서</h4>
						<div class="latest-product__slider owl-carousel">
							<div class="latest-prdouct__slider__item">
								<c:forEach items="${homeBookList }" var="list" begin="13" end="15">
								<a href="#" onclick='showPopup(${list.bookNum });' class="latest-product__item">
									<div class="latest-product__item__pic">
										<img src="/uploadImg/${list.savedFilename1 }" alt="">
									</div>
									<div class="latest-product__item__text">
										<h6>${list.bookName }</h6>
									</div>
								</a></c:forEach> 
							</div>
							<div class="latest-prdouct__slider__item">
								<c:forEach items="${homeBookList }" var="list" begin="16" end="18">
								<a href="#" onclick='showPopup(${list.bookNum });' class="latest-product__item">
									<div class="latest-product__item__pic">
										<img src="/uploadImg/${list.savedFilename1 }" alt="">
									</div>
									<div class="latest-product__item__text">
										<h6>${list.bookName }</h6>
									</div>
								
								</a></c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Latest Product Section End -->

	<!-- Blog Section Begin -->
	<section class="from-blog spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title from-blog__title">
						<h2>대표적인 도서</h2>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-4 col-md-4 col-sm-6">
					<div class="blog__item">
						<div class="blog__item__pic">
							<a href="http://localhost:8888/book/bookListSearch?searchType=bookCate&searchWord=Fate/Grand Order 1">
								<img src="/resources/img/book/literature/tonight.jpg" alt="">
							</a>
						</div>
						<div class="blog__item__text">
							<div class = "blog__item__textArea">
							<ul>
								<li><i class="fa fa-calendar-o"></i> june 06,2021</li>
							</ul>
							<h5>
								<a href="/book/bookDetail">오늘밤, 세계에서 이 사랑이 사라진다 해도</a>
							</h5>
							<p>모르는 남자애의, 모르는 여자애 걸음을 뗀 두 사람 이 여름은 언제나 한 번 하얀 공백 모르는 여자애의,
								모르는 남자애 마음은 너를 그리니까</p>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-6">
					<div class="blog__item">
						<div class="blog__item__pic">
							<a href="http://localhost:8888/book/bookDetail?bookNum=2">
							<img src="/resources/img/book/Self-development/idea.jpg" alt="">
							</a>
						</div>
						<div class="blog__item__text">
							<div class = "blog__item__textArea">
							<ul>
								<li><i class="fa fa-calendar-o"></i> september 24,2018</li>
							</ul>
							<h5>
								<a href="/book/bookDetail">60분 읽었지만 평생 당신 곁을 떠나지 않을 아이디어 생산법</a>
							</h5>
							<p>“아이디어는 어디서 얻나요?” 이 까다로운 질문에 응답하는 책이다. 전설적 카피라이터 제임스 웹 영은
								자신의 오랜 경험과 관찰에 비추어 아이디어를 내는 과정을 서술했고, 1939년에 시작된 책은 지금껏 광고인들의
								경전이자 불후의 명저로 회자되고 있다.</p>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-6">
					<div class="blog__item">
						<div class="blog__item__pic">
							<a href="http://localhost:8888/book/bookDetail?bookNum=2">
							<img src="/resources/img/book/literature/편의점.jpg" alt="">
							</a>
						</div>
						<div class="blog__item__text">
							<div class = "blog__item__textArea">
							<ul>
								<li><i class="fa fa-calendar-o"></i> april 20,2021</li>
							</ul>
							<h5>
								<a href="/book/bookDetail">불편한 편의점</a>
							</h5>
							<p>불편한데 자꾸 가고 싶은 편의점이 있다! 힘들게 살아낸 오늘을 위로하는 편의점의 밤 정체불명의 알바로부터
								시작된 웃음과 감동의 나비효과『망원동 브라더스』 김호연의 ‘동네 이야기’ 시즌 2</p>
							</div>
						</div>
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