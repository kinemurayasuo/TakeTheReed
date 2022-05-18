<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>take | the | reed</title>

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
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
<link rel="stylesheet" href="/resources/css/star.css" type="text/css">

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
			bookNum: ${bookDetail.bookNum},
			likeChk: ${likeChk }
		},
		success: function(res){
			console.log(res);
			if(res == 0){
				alert("내 서제에 추가하였습니다");
			} else if(res == 1) {
				alert("내 서재에서 삭제하였습니다.");
			} else if(res == -1){
				alert("로그인 후 추천 가능합니다.");
			}
			location.reload();
		}
	});
}


function starUpdate(bookNum) {
	$.ajax({
		url: "/book/starUpdate",
		type: "POST",
		data: {
			bookNum : bookNum, 
			bookStar : $("#starScore").val(),
		},
		
		success: function(res) {
			if(res = "available")
			{
			console.log("성공");
			alert("별점이 입력되었습니다");
			$("#star").attr("disabled","disabled");
			}
		},
		error : function(e) {
			console.log(e);
			consele.log("실패");
		}
		
		
	});
}

</script>
<body>
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
	<section class="product-details spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6">
					<div class="product__details__pic">
						<div class="product__details__pic__item">
							<img class = "bookDetail__img" src="/uploadImg/${bookDetail.savedFilename1 }">
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
								<c:if test="${star.bookStarCk != null }">
									<li><b>별점</b> <span>${star.bookStarAvg }</span></li>
								</c:if>
								<c:if test="${star.bookStarCk == null }">
									<li><b>별점</b> <span>☆☆☆☆☆</span></li>
								</c:if>
								<c:if test="${bookDetail.userId == sessionScope.loginId}">
								<li><b>내 서재에 넣기</b>
								<c:if test="${likeChk == 0 }">
								<input type="button" value="🤍" onclick="clickLike();"
									class="icon_heart_alt" style="width: 50px; height: 30px;">
								</c:if>
								<c:if test="${likeChk == 1 }">
								<input type="button" value="🖤" onclick="clickLike();"
									class="icon_heart_alt" style="width: 50px; height: 30px;">
								</c:if>
								</li>
								<li><b>책 보러 가기</b> <input style="width: 50px;" type="button" value="보기" onclick="location.href='/book/bookView?bookNum=${bookDetail.bookNum }'"></li>
								<li>
								<br>
								<c:choose>
									<c:when test="${star.bookStarCk == null}">
										<input id = "star" name = "star" class = "StarInput" type="button" value="별점주기" onclick="starUpdate(${bookNum });">
										<select id = "starScore" name = "starScore" class = "StarScoreInput">
											<option value = "10">★★★★★</option>
											<option value = "9">★★★★☆</option>
											<option value = "8">★★★★</option>
											<option value = "7">★★★☆</option>
											<option value = "6">★★★</option>
											<option value = "5">★★☆</option>
											<option value = "4">★★</option>
											<option value = "3">★☆</option>
											<option value = "2">★</option>
											<option value = "1">☆</option>
										</select>
									</c:when>
									<c:otherwise>
										<c:if test="${star.bookStarCk == 1 }">
											<span>별점을  ${star.bookStar } 점 입력하였습니다</span>
											<input type="hidden" value="${bookNum }" id="bookNum">
										</c:if>
									</c:otherwise>
								</c:choose>
								</li>
								</c:if>
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
	</section>
	<!-- Product Details Section End -->
	
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
				</div>
			</div>
		</div>

	</footer>



	<!-- Js Plugins -->
	<script src="/resources/js/jquery-3.3.1.min.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/jquery.nice-select.min.js"></script>
	<script src="/resources/js/jquery-ui.min.js"></script>
	<script src="/resources/js/jquery.slicknav.js"></script>
	<script src="/resources/js/mixitup.min.js"></script>
	<script src="/resources/js/owl.carousel.min.js"></script>
	<script src="/resources/js/main.js"></script>

	<!-- <div class="starRev" id = "starScore">
	  <span class="starR1 on">1</span>
	  <span class="starR2">2</span>
	  <span class="starR1">3</span>
	  <span class="starR2">4</span>
	  <span class="starR1">5</span>
	  <span class="starR2">6</span>
	  <span class="starR1">7</span>
	  <span class="starR2">8</span>
	  <span class="starR1">9</span>
	  <span class="starR2">10</span>
	</div> -->
	<script type="text/javascript">
    $('.starRev span').click(function(){
    	  $(this).parent().children('span').removeClass('on');
    	  $(this).addClass('on').prevAll('span').addClass('on');
    	  return false;
    	});
    </script>
</body>
</html>