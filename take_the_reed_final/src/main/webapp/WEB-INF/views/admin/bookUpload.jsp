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
    <title>책 업로드</title>
    
<script type="text/javascript">
	function JlistPaging() {
		var searchType = $("#searchType option:selected").val();
		var searchWord = $("#searchWord").val();
	
		$.ajax({
			url : "/ask/askList",
			type : "get",
			data : {
				searchType : searchType,
				searchWord : searchWord
			}
		})
	}
</script>

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
				<div>English</div>
				<span class="arrow_carrot-down"></span>
				<ul>
					<li><a href="/">Korean</a></li>
					<li><a href="#">japan</a></li>
					<li><a href="#">English</a></li>
				</ul>
			</div>
			<div class="header__top__right__auth">
				<a href="#"><i class="fa fa-user"></i> Login</a>
			</div>
		</div>
		<nav class="humberger__menu__nav mobile-menu">
			<ul>
				<li class="active"><a href="/">메인</a></li>
				<li><a href="./shop-grid.html">안녕하세요</a></li>
				<li><a href="#">Pages</a>
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
											alt=""></a></li>
									<li class="active"><a href="/">메인</a></li>
									<li><a href="/checkout/checkout">결제</a></li>
									<li><a href="/">굿즈</a>
										<ul class="header__menu__dropdown">
											<li><a href="/">아이돌마스터</a></li>
											<li><a href="/">러브라이브</a></li>
											<li><a href="/">듀얼리스트 고한영쿤</a></li>
										</ul></li>
									<li><a href="/book/bookList">도서</a></li>
									<li><a href="/ask/askList">게시판</a></li>
								</ul>
							</nav>
						</div>
					</div>
					<div class="col-lg-6 col-md-6">
						<div class="header__top__right">
							<!-- <div class="header__top__right__social">
                                <a href="#"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-linkedin"></i></a>
                                <a href="#"><i class="fa fa-pinterest-p"></i></a>
                            </div> -->

							<div class="header__top__right__language">
								<img src="resources/img/language.png" alt="">
								<div>English</div>
								<span class="arrow_carrot-down"></span>
								<ul>
									<li><a href="#">korean</a></li>
									<li><a href="#">English</a></li>
									<li><a href="#">Japan</a></li>
								</ul>
							</div>
							<div class="header__top__right__auth">
								<c:if test="${loginName == null }">
									<a href="/user/login" class="login"> 로그인</a>
                                                &nbsp;&nbsp;&nbsp;
                                                <a href="/user/email"
										class="login"> 회원가입</a>
								</c:if>
								<c:if test="${loginName != null}">
                                                '${loginName}' 구독자님
                                                <span></span>
									<a href="/user/logout" class="portfolio">로그아웃</a>
									<span></span>
									<a href="/user/myPage" class="portfolio">마이 페이지</a>
								</c:if>
								<div class="header__top__right__auth"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="container">
				<div class="row">
					<!-- <div class="col-lg-3"> -->
					<!-- <div class="header__logo"> -->

					<!-- </div> -->
					<!-- </div> -->
					<div class="col-lg-6"></div>

				</div>
				<div class="humberger__open">
					<i class="fa fa-bars"></i>
				</div>
			</div>
	</header>
	<!-- Header Section End -->
	
	<!-- upload 시작 -->
		<section class="latest-product spad">
			<div class="container">
				<div class="row" style="flex: 0 0 100%;max-width: 100%;background-color: white;padding: 30px; padding-bottom:82px; BORDER-RADIUS: 30PX 30PX; box-shadow: 10px 10px 4px rgb(0 0 0 / 10%);">
					<div class="col-lg-12">
						<div class="contact__form__title">
							<h2>관리자 책 업로드</h2>
						</div>
					</div>
					<form action="/admin/bookUpload" method="post" style="margin: auto;" onsubmit = "return formChk();" enctype = "multipart/form-data">
				      <table border="1">
				         <tr>
				            <td colspan="4">
				               <input type="text" id="bookName" name="bookName" placeholder="책 이름을 입력해주세요." style="width:100%;">
				            </td>
				         </tr>
				         <tr>
				            <th>책 표지</th>
				            <td colspan="3">
				               <input type="file" name="uploadFile1">
				            </td>
				         </tr>
				         <tr>
				         	<th>책 저자</th>
				         	<td><input type="text" id="bookWriter" name="bookWriter" style="width:100%;"></td>
				            <th>카테고리</th>
				            <td>
				               <input type="text" id="bookCate" name="bookCate" style="width:100%;">
				            </td>
				         </tr>
				         <tr>
				            <td colspan="4">
				               <input type="file" name="uploadFile2">
				            </td>
				         </tr>
				         <tr>
				         	<td colspan="4">
				         		<textarea rows="8" cols="115" id="bookCon" name="bookCon" placeholder="책설명을 입력해 주세요."></textarea>
				         	</td>
				         </tr>
				         <tr>
				            <td align="center" colspan="4">
				               <input type="submit" value="작성하기" id="submit">
				               <input type="reset" value="취소" id="cancel">
				            </td>
				         </tr>
				      </table>
				   </form>
			   </div>
			</div>
	   </section>
	<!-- upload 끝 -->
	
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