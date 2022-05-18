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
    <title>마이페이지</title>

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
	<style type="text/css">
	table {
 		border-collapse: separate;
  		border-spacing: 20px 15px;
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

   <!-- 마이페이지  begin -->      
   <section class="checkout spad">
       <div class="container">      
           <div class="checkout__form">
               <h4>마이페이지</h4>
                
  <form method = "post">
	<c:if test="${not empty userList }"> 
	  <c:forEach items ="${userList }" var="user">
		<table style="margin-left: auto; margin-right: auto;" class="checkout__input">
	 		<tr>
	 			<td>아이디</td>
	 			<td>${user.userId }</td>
	        </tr>
	        <tr>
	            <td>이름</td>
	            <td>${user.userName }</td>
	        </tr>
	         <tr>
	            <td>닉네임</td>
	            <td>${user.userNm }</td>
	        </tr>
	         <tr>
	            <td>전화번호</td>
	            <td>${user.userTel }</td>
	        </tr>
	        <tr>
	            <td>이메일</td>
	            <td>${user.userEmail }</td>
	        </tr>
	        <tr>
	            <td>구독여부</td>
	            <td></td>
	        </tr>
	        <tr>
	        	<td colspan="2">
	        		<input type="button" value="정보수정" style="background-color:#ADFA7E; color:black; font-weight:bold; height:37pt; font-family:'IBM Plex Sans KR';  position:relative; top:15px; width:180pt;"
								onclick="location.href='/user/pwchk'">
				</td>
				<td></td>
			</tr>	
	   </table>
      </c:forEach>
    </c:if>
	  
	 <c:if test="${not empty userList1 }"> 
	  <c:forEach items ="${userList1 }" var="user1">
		<table style="margin-left: auto; margin-right: auto;">
		    <h5 style="color:red; font-weight:bold; text-align:center;">소셜로그인한 회원은 정보수정 불가합니다.</h5>
	 		<tr>
	 			<td>소셜 아이디</td>
	 			<td>${user1.userId }</td>
	        </tr>
	 		<tr>
	 			<td>소셜 닉네임 </td>
	 			<td>${user1.userNm }</td>
	        </tr>
	        <tr>
	            <td>소셜 이름</td>
	           <td>${user1.userName }</td>
	        </tr>
	         <tr>
	            <td>소셜 전화번호</td>
	            <td>${user1.userTel }</td>
	        </tr>
	        <tr>
	            <td>소셜 이메일</td>
	            <td>${user1.userEmail }</td>
	        </tr>
	        <tr>
	            <td>구독여부</td>
	            <td></td>
	        </tr>
	    </table>
	  </c:forEach>
	</c:if>
	<br>
	
	<!-- 과거이용내역 -->
	<section class="checkout spad"></section>
        <div class="container"></div>      
            <div class="checkout__form"></div>
                <h4>과거이용내역</h4>
	
	<c:if test = "${empty pastList }">
		과거이용내역이 없습니다.
	</c:if>
	
	<c:if test="${not empty pastList }">
		<c:forEach items ="${pastList }" var="past" varStatus="status">
			<div style="display:inline-block; text-align:center; margin: 0 auto; width:200px">
				<img src="/uploadImg/${past.savedFilename1 }" style="width: 100px; height: 100px; ">
				<ul> ${past.bookName }</ul>
				<ul>조회수:${past.bookCk } &nbsp;&nbsp; 별점:</ul>
			</div>
		</c:forEach>
	</c:if>
   </form>
  </div>
 </section>
 <!-- 마이페이지 end -->  

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