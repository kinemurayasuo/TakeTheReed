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
				?????? ?????? : <span>????????? ?????? ????????? ?????????</span>
			</div>
		</div>
		<div class="humberger__menu__widget">
			<div class="header__top__right__language">

				<img src="/resources/img/language.png" alt="">
				<div>?????????</div>
				<span class="arrow_carrot-down"></span>
				<ul>
					<li><a href="/">?????????</a></li>
					<li><a href="/jp">?????????</a></li>
					<li><a href="/2">English</a></li>
				</ul>
			</div>
			<div class="header__top__right__auth">
				<a href="#"><i class="fa fa-user"></i> Login</a>
			</div>
		</div>
		<nav class="humberger__menu__nav mobile-menu">
			<ul>
				<li class="active"><a href="/">??????</a></li>
				<li class="active"><a href="./shop-grid.html">???????????????</a></li>
				<li class="active"><a href="#">Pages</a>
					<ul class="header__menu__dropdown">
						<li><a href="./shop-details.html">Shop Details</a></li>
						<li><a href="./shoping-cart.html">Shoping Cart</a></li>
						<li><a href="./checkout.html">Check Out</a></li>
						<li><a href="./blog-details.html">Blog Details</a></li>
					</ul></li>
				<li><a href="/book/bookList">??? ??????</a></li>
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
									<li class="active"><a href="/">??????</a></li>
									<li class="active"><a href="/checkout/checkout">??????</a></li>
									<li class="active"><a href="/book/bookList">??????</a></li>
									<li class="active"><a href="/ask/askList">??????</a></li>
									<c:if test="${loginName != null}">
									<li class="active"><a href="/like/likeList">?????????</a></li>
									</c:if>
								</ul>
							</nav>
						</div>
					</div>
					<div class="col-lg-6 col-md-6">
						<div class="header__top__right">
							<div class="header__top__right__language">
								<img src="/resources/img/korean.png" alt="">
								<div>?????????</div>
								<span class="arrow_carrot-down"></span>
								<ul>
									<li><a href="/">?????????</a></li>
									<li><a href="/jp">?????????</a></li>
									<li><a href="/2">English</a></li>
								</ul>
							</div>
							<div class="header__top__right__auth">
								<c:if test="${loginName == null }">
									<a href="/user/login" class="login"> ?????????</a>
	                               &nbsp;&nbsp;&nbsp;
	                               <a href="/user/email" class="login">
										????????????</a>
								</c:if>
								<c:if test="${loginName != null}">
	                               <span class = "userLogin"> '${loginName}' ?????? ??? </span>
									<a href="/user/logout" class="portfolio">????????????</a>
									<a href="/user/myPage" class="portfolio">?????? ?????????</a>
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

	<!-- ????????? ??? ?????? -->
	<c:if test="${loginId == 'admin'}">
		<section class="shoping-cart spad">
			<div class="row">
				<div class="col-md-12">
					<div class="shoping__cart__table">
						<form action="/admin/bookList"></form>
						<table>
							<thead>
								<tr>
									<th scope="col">?????????</th>
									<th scope="col">????????????</th>
									<th scope="col">?????????</th>
									<th scope="col">?????????</th>
									<th scope="col">?????????</th>
									<th scope="col">????????????</th>
									<th scope="col">?????? ???</th>
									<th scope="col"><input id="allCheck" type="checkbox"
										name="allCheck" /></th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${empty bookList }">
										<tr>
											<td colspan="4">???????????? ????????????.</td>
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
													<option value="bookName">??????</option>
													<option value="bookCon">??????</option>
													<option value="bookCate">????????????</option>
											</select></td>
											<td><input type="text" class="form-control"
												id="searchWord" placeholder="????????? ??????" name="searchWord"
												maxlength="100"></td>
											<td><button id="searchBtn" onclick="JlistPaging();"
													style="width: 66px; height: 38px; font-size: 14px; color: #ffffff; font-weight: 800; text-transform: uppercase; background: #f89b00; border: none;">??????</button>
											</td>
											<td><input type="button" value="????????????"
												onclick="location.href = '/admin/bookUpload'" id="submit"
												style="margin-left: 500px; height: 38px; font-size: 14px; color: #ffffff; font-weight: 800; text-transform: uppercase; padding: 13px 30px 12px; background: #f89b00; border: none;">
											</td>
											<td><input type="button" value="?????????"
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
			alert("???????????? ?????? ????????? ????????? ?????????.");
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
					??????: ??????????????? ????????? ???????????? 1 (?????????) ????????????: 02-730-5800 <i
						class="fa fa-envelope"> yoehadu815@gmail.com</i>

				</div>
			</div>
			<div class="x">
				<div class="footer__widget">
					<h6>Useful Links</h6>
					<a href="#">???????????? </a> <a href="#">????????????????????????</a> <a href="#">?????????????????????</a>
					<a href="#">????????????</a> <a href="#">b2b ??????</a> <a href="#">?????????
						????????????</a>
				</div>
			</div>
			<div class="x">
				<div class="footer__widget">
					Copyright ?? 2022 take the reed (????????? ??? ??????) ALL rights Reserved
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

					// ??? ?????? ??????
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

					// ??? ??????
					function deleteValue() {
						var url = "bookListDelete"; // Controller??? ???????????? ?????? URL (.dh????????? ????????? ????????? ????????? ???????????????)
						var valueArr = new Array();
						var list = $("input[name='RowCheck']");
						for (var i = 0; i < list.length; i++) {
							if (list[i].checked) { //???????????? ????????? ????????? ?????? ?????????
								valueArr.push(list[i].value);
							}
						}
						if (valueArr.length == 0) {
							alert("????????? ?????? ????????????.");
						} else {
							var chk = confirm("?????? ?????????????????????????");
							$.ajax({
								url: url, // ?????? URL
								type: 'POST', // GET or POST ??????
								traditional: true,
								data: {
									valueArr: valueArr
									// ???????????? ?????? data ?????? ??????
								},
								success: function (jdata) {
									if (jdata = 1) {
										alert("?????? ??????");
										location.replace("bookList")
									} else {
										alert("?????? ??????");
									}
								}
							});
						}
					}
				</script>



</body>

</html>