<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>take | the | reed ${askList.askTitle }</title>

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

				function JlistPaging1() {
					var searchWord = $("#searchWord").val();

					$.ajax({
						url: "/book/bookList",
						type: "get",
						data: {
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

	<section class="latest-product spad">
		<div class="container">
			<div class = "ask">
				<div class="col-md-10">
					<table class="table table-condensed">
						<thead>
							<tr align="center">
								<th width="10%">??????</th>
								<th width="60%">${askList.askTitle }</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>?????????</td>
								<td>${askList.askTime }</td>
							</tr>
							<tr>
								<td>?????????</td>
								<td>${askList.userId }${askList.userNm }</td>
							</tr>
							<tr>
								<td>??????</td>
								<td>${askList.askCon }</td>
							</tr>
							<tr>
								<td>??????</td>
								<td></td>
							<tr>
								<c:if test="${not empty loginId }">
									<div style="margin: auto; width: 1000px;">
										<table class="table table-condensed">
											<c:forEach items="${replyList }" var="reply">
												<tr>
													<td>${reply.userNm }</td>

													<td id="updateReply${reply.replyNum }"><span
														id="updateReplyContent${reply.replyNum }">${reply.replyContent }</span>
													</td>

													<td align="right"><span> ${reply.replyDate } <!-- ????????? ????????? ?????? ??? ??? -->
															<c:if test="${reply.userId == sessionScope.loginId}">
																<input type="button" value="??????" class="btn btn-primary"
																	onclick="deleteReply(${reply.replyNum},${askList.askNum });">
																<input type="button" value="??????" class="btn btn-primary"
																	id="updateReply"
																	onclick="updateReply(${reply.replyNum});">
															</c:if>
													</span></td>
												</tr>
											</c:forEach>
											<tr>
												<td colspan="3">
													<form action="/ask/replyWrite" method="post">
														<div class="mb-3">
															<textarea class="form-control" name="replyContent"
																rows="4"
																style="resize: none; width: 100%; height: 44px;"></textarea>
														</div>
														<div align="right">
															<button type="submit" class="btn btn-primary">??????
																??????</button>
														</div>
														<input type="hidden" name="askNum"
															value="${askList.askNum}">
													</form>
												</td>
											</tr>
										</table>
									</div>
								</c:if>
							</tr>
						</tbody>
					</table>
					<table id="commentTable" class="table table-condensed"></table>
					<table class="table table-condensed">
						<thead>
							<tr>
								<td>
									<!-- ???, ?????? ?????? --> <!-- ????????? ????????? ??? ??? ??? --> <span
									style='float: right'><c:if
											test="${askList.userId == sessionScope.userId}">
											<input type="button" value="??????" class="btn btn-primary"
												onclick="location.href = '/ask/askListUpdate?askNum=${askList.askNum }'">
											<input type="button" value="??????" class="btn btn-primary"
												onclick="deleteAsk(${askList.askNum });">
										</c:if> <input type="button" value="?????????" class="btn btn-primary"
										onclick="location.href='askList'"></span>
								</td>
							</tr>
						</thead>
					</table>
				</div>
			</div>
		</div>
	</section>
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
				</div>
			</div>
		</div>

	</footer>
	<!-- Footer Section End -->
	
	<script type="text/javascript"
		src="/resources/js/jquery-3.3.1.min.js"></script> <script
		type="text/javascript">

				// ??? ??????
				function deleteAsk(askNum) {
					var result = confirm("?????? ??????????????????????");

					if (result) {
						location.href = "/ask/deleteAsk?askNum=" + askNum;
					}
				}

				// ?????? ??????
				function deleteReply(replyNum, askNum) {
					var result = confirm("?????? ??????????????????????");
					var str = "";
					if (result) {
						str += "/ask/deleteReply?replyNum=";
						str += replyNum;
						str += "&askNum=";
						str += askNum;
						location.href = str;
					}
				}

				$(function () {
					$("input:button").click(function () {
						$("#updateReply").hide();
					});
				});

				// ?????? ??????
				function updateReply(replyNum) {
					var tr = document.getElementById("updateReply" + replyNum);
					var updateReplyContent = document.getElementById("updateReplyContent" + replyNum).innerHTML;

					var str = "";
					str += "<form action='/ask/updateReply' method='post'>";
					str += "	<textarea class='form-control' name='replyContent' id='exampleFormControlTextarea1' rows='4' style='resize: none;width: 700px;'>";
					str += updateReplyContent;
					str += "</textarea>";
					str += "	<div align='right'>";
					str += "		<input type='submit' value='?????? ??????' class='btn btn-primary'>";
					str += "	</div>";
					str += "	<input type='hidden' name='replyNum' value='" + replyNum + "'>";
					str += "	<input type='hidden' name='askNum' value='" + ${ askList.askNum } + "'>";
					str += "</form>";

					tr.innerHTML = str;
				}


			</script> <!-- Js Plugins --> <script src="/resources/js/jquery-3.3.1.min.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script> <script
		src="/resources/js/jquery.nice-select.min.js"></script> <script
		src="/resources/js/jquery-ui.min.js"></script> <script
		src="/resources/js/jquery.slicknav.js"></script> <script
		src="/resources/js/mixitup.min.js"></script> <script
		src="/resources/js/owl.carousel.min.js"></script> <script
		src="/resources/js/main.js"></script>
</body>

</html>