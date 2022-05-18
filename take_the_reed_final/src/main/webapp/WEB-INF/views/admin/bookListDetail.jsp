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
<title>책관리</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<script type="text/javascript" src="/resources/js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="/resources/css/jquery-ui.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/elegant-icons.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/nice-select.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/style.css" type="text/css">

</head>

<style>
.starR1 {
	background:
		url('http://miuu227.godohosting.com/images/icon/ico_review.png')
		no-repeat -52px 0;
	background-size: auto 100%;
	width: 15px;
	height: 30px;
	float: left;
	text-indent: -9999px;
	cursor: pointer;
}

.starR2 {
	background:
		url('http://miuu227.godohosting.com/images/icon/ico_review.png')
		no-repeat right 0;
	background-size: auto 100%;
	width: 15px;
	height: 30px;
	float: left;
	text-indent: -9999px;
	cursor: pointer;
}

.starR1.on {
	background-position: 0 0;
}

.starR2.on {
	background-position: -15px 0;
}
</style>

<script type="text/javascript">
					//추천 기능
					function clickLike() {
						$.ajax({
							url: "clickLike",
							type: "post",
							data: {
								bookNum: ${ bookDetail.bookNum },
							likeChk: ${ likeChk }
		},
					success: function(res) {
						console.log(res);
						if (res == 0) {
							alert("내 서제에 추가하였습니다");
						} else if (res == 1) {
							alert("내 서재에서 삭제하였습니다.");
						} else if (res == -1) {
							alert("로그인 후 추천 가능합니다.");
						}
						location.reload();
					}
	});
}

					function starUpdate(userId, bookNum) {
						alert(bookNum, "추천이 입력되었습니다");
						$.ajax({
							url: "/book/starUpdate",
							type: "POST",
							data: {
								userId: userId,
								bookNum: bookNum,
								bookStar: $("#starScore").val()
							},

							success: function (res) {
								console.log("성공");

							},
							error: function (e) {
								console.log(e);
								consele.log("실패");
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

	<!-- Product Details Section Begin -->
	<c:if test="${loginId == 'admin'}">
		<section class="product-details spad">
			<form action="/admin/bookListDetail" method="get">
				<div class="container">
					<div class="row">
						<div class="col-lg-6 col-md-6">
							<div class="product__details__pic">
								<div class="product__details__pic__item">
									<img class="bookDetail__img"
										src="/uploadImg/${bookDetail.savedFilename1 }">
								</div>
							</div>
						</div>
						<div class="col-lg-6 col-md-6">
							<div class="product__details__text">
								<h3>${bookDetail.bookName }</h3>
								<div class="product__details__rating">
									<ul>
										<li><b>저자</b> <span>${bookDetail.bookWriter }</span></li>
										<li><b>조회수</b> <span>${bookDetail.bookCk }</span></li>
										<li><b>카테고리</b> <span>${bookDetail.bookCate }</span></li>
										<li><b>내 서재에 넣기</b> <c:if test="${likeChk == 0 }">
												<input type="button" value="🤍" onclick="clickLike();"
													class="icon_heart_alt" style="width: 50px; height: 30px;">
											</c:if> <c:if test="${likeChk == 1 }">
												<input type="button" value="🖤" onclick="clickLike();"
													class="icon_heart_alt" style="width: 50px; height: 30px;">
											</c:if></li>
										<li><b>책 보러 가기</b> <input type="button" value="보기"
											class="btn btn-primary"
											onclick="location.href='/book/bookView?bookNum=${bookDetail.bookNum }'">
										</li>
										<li><br> <input type="button" value="별점주기"
											class="btn btn-primary"
											onclick="starUpdate(${loginId},	${bookDetail.bookNum});">
											<select id="starScore">
												<option value="10">10</option>
												<option value="9">9</option>
												<option value="8">8</option>
												<option value="7">7</option>
												<option value="6">6</option>
												<option value="5">5</option>
												<option value="4">4</option>
												<option value="3">3</option>
												<option value="2">2</option>
												<option value="1">1</option>
										</select> <input type="button" value="수정" class="btn btn-primary"
											onclick="location.href = '/admin/bookListUpdate?bookNum=${bookDetail.bookNum }'">
										</li>
									</ul>

								</div>
							</div>
							<div class="col-lg-12">
								<div class="product__details__tab">
									<div class="tab-content">
										<div class="tab-pane active" id="tabs-1" role="tabpanel">
											<div class="product__details__tab__desc">
												<h6>책 줄거리</h6>
												${bookDetail.bookCon }
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</form>
		</section>
	</c:if>
	<!-- Product Details Section End -->

	<c:if test="${loginId != 'admin'}">
		<script type="text/javascript">
			alert("관리자만 접근 가능한 페이지 입니다.");
			location.href="/"
		</script>
	</c:if>

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