<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
							url: "/ask/askList",
							type: "get",
							data: {
								searchType: searchType,
								searchWord: searchWord
							}
						})
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

	<!-- 게시판 글 보기 -->
	<c:if test="${loginId == 'admin'}">
		<section class="shoping-cart spad">
			<div class="row">
				<div class="col-md-12">
					<div class="shoping__cart__table">
						<form action="/admin/bookList"></form>
						<table>
							<thead>
								<tr>
									<th scope="col">책번호</th>
									<th scope="col">회원이름</th>
									<th scope="col">책저자</th>
									<th scope="col">책내용</th>
									<th scope="col">책체크</th>
									<th scope="col">카테고리</th>
									<th scope="col">완독 수</th>
									<th scope="col"><input id="allCheck" type="checkbox"
										name="allCheck" /></th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${empty bookList }">
										<tr>
											<td colspan="4">게시글이 없습니다.</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach items="${bookList }" var="book">
											<tr>
												<td>${book.bookNum }</td>
												<td><a
													href="/admin/bookListDetail?bookNum=${book.bookNum }">
														${book.bookName } </a></td>
												<td>${book.bookWriter }</td>
												<td>${book.bookCon }</td>
												<td>${book.bookCk }</td>
												<td>${book.bookCate }</td>
												<td>${book.bookEnd }</td>
												<td><input type="checkbox" name="RowCheck"
													value="${book.bookNum}"></td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>
					<section>
						<div class="container">
							<div class="col-lo-8 col-md-7">
								<form action="/book/bookListSearch" method="get">
									<table>
										<tr>
											<td><select id="searchType" name="searchType">
													<option value="bookName">제목</option>
													<option value="bookCon">내용</option>
													<option value="bookCate">카테고리</option>
											</select></td>
											<td><input type="text" class="form-control"
												id="searchWord" placeholder="검색어 입력" name="searchWord"
												maxlength="100"></td>
											<td><button id="searchBtn" onclick="JlistPaging();"
													style="width: 66px; height: 38px; font-size: 14px; color: #ffffff; font-weight: 800; text-transform: uppercase; background: #f89b00; border: none;">검색</button>
											</td>
											<td><input type="button" value="책업로드"
												onclick="location.href = '/admin/bookUpload'" id="submit"
												style="margin-left: 500px; height: 38px; font-size: 14px; color: #ffffff; font-weight: 800; text-transform: uppercase; padding: 13px 30px 12px; background: #f89b00; border: none;">
											</td>
											<td><input type="button" value="책삭제"
												onclick="deleteValue();" id="submit"
												style="height: 38px; font-size: 14px; color: #ffffff; font-weight: 800; text-transform: uppercase; padding: 13px 30px 12px; background: #f89b00; border: none;">
											</td>
										</tr>
									</table>
									<div></div>
								</form>
							</div>
						</div>
					</section>
				</div>
			</div>
		</section>
	</c:if>
	
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
					function JlistPaging2() {
						var searchType = $("#searchType option:selected").val();
						var searchWord = $("#searchWord").val();

						$.ajax({
							url: "/book/bookList",
							type: "get",
							data: {
								searchType: searchType,
								searchWord: searchWord
							}
						})
					}

					// 책 선택 기능
					$(function () {
						var chkObj = document.getElementsByName("RowCheck");
						var rowCnt = chkObj.length;

						$("input[name='allCheck']").click(function () {
							var chk_listArr = $("input[name='RowCheck']");
							for (var i = 0; i < chk_listArr.length; i++) {
								chk_listArr[i].checked = this.checked;
							}
						});
						$("input[name='RowCheck']").click(function () {
							if ($("input[name='RowCheck']:checked").length == rowCnt) {
								$("input[name='allCheck']")[0].checked = true;
							} else {
								$("input[name='allCheck']")[0].checked = false;
							}
						});
					});

					// 책 삭제
					function deleteValue() {
						var url = "bookListDelete"; // Controller로 보내고자 하는 URL (.dh부분은 자신이 설정한 값으로 변경해야됨)
						var valueArr = new Array();
						var list = $("input[name='RowCheck']");
						for (var i = 0; i < list.length; i++) {
							if (list[i].checked) { //선택되어 있으면 배열에 값을 저장함
								valueArr.push(list[i].value);
							}
						}
						if (valueArr.length == 0) {
							alert("선택된 글이 없습니다.");
						} else {
							var chk = confirm("정말 삭제하시겠습니까?");
							$.ajax({
								url: url, // 전송 URL
								type: 'POST', // GET or POST 방식
								traditional: true,
								data: {
									valueArr: valueArr
									// 보내고자 하는 data 변수 설정
								},
								success: function (jdata) {
									if (jdata = 1) {
										alert("삭제 성공");
										location.replace("bookList")
									} else {
										alert("삭제 실패");
									}
								}
							});
						}
					}
				</script>



</body>

</html>