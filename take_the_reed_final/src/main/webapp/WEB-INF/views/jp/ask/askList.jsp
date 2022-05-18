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
    <title>お問い合わせ</title>
    
    <script type="text/javascript">
    	function JlistPaging() {
            var searchType = $("#searchType option:selected").val();
            var searchWord = $("#searchWord").val();

            $.ajax({
                url: "/jpAsk/askList",
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

    <!-- 게시판 글 보기 -->
	<section class="shoping-cart spad">
		<div class="row">
			<div class="col-md-12">
				<div class="shoping__cart__table">
					<form action="/jpAsk/askList">
						<label><input type="radio" value="date_desc" name="sort">最新順</label>
						<label><input type="radio" value="date_asc" name="sort">古い順</label>
						<input type="submit" value="整列" class="site-btn3" style="height: 35px;padding-left: 15px;
							padding-right: 15px;margin-right: 0px;padding-top: 10px;padding-bottom: 10px;">
					</form>
					<table>
						<thead>
							<tr>
								<th>番号</th>
								<th class="shoping__product">質問タイトル</th>
								<th>作成者</th>
								<th>作成時間</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${empty askList }">
									<tr>
										<td colspan="4">投稿されたお問い合わせがありません。</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach items="${askList }" var="ask">

										<tr>
											<td>${ask.askNum }</td>
											<td class="shoping__cart__item"><a
												href="/jpAsk/ask?askNum=${ask.askNum }"> ${ask.askTitle }
											</a></td>
											<td>${ask.userNm }</td>
											<td>${ask.askTime }</td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
					<br>
				</div>
				<div style="text-align: center;">
					<span> <c:if test="${navi.currentPage > 1 }">
							<a
								href="/jpAsk/askList?currentPage=${(navi.currentGroup - 1) * 5 + 1 }"
								style="text-decoration: none; text-align: center; font-size: 1.5em;">
								◀◀&nbsp; </a>
						</c:if> <c:forEach begin="${navi.startPageGroup }"
							end="${navi.endPageGroup }" var="pageNum">
							<c:if test="${pageNum == navi.currentPage }">
								<a href="/jpAsk/askList?currentPage=${pageNum }"
									style="color: red; text-decoration: none; text-align: center; font-size: 1.5em;">
									<span style="color: red"> ${pageNum } </span>
								</a>
							</c:if>
							<c:if test="${pageNum != navi.currentPage }">
								<a href="/jpAsk/askList?currentPage=${pageNum }"
									style="color: black; text-decoration: none; text-align: center; font-size: 1.5em;">
									<span> ${pageNum } </span>
								</a>
							</c:if>
						</c:forEach> <c:if test="${navi.currentPage < navi.totalPageCount }">
							<a
								href="/jpAsk/askList?currentPage=${(navi.currentGroup + 1) * 5 + 1 }"
								style="text-decoration: none; text-align: center; font-size: 1.5em;">
								▶▶ </a>
						</c:if>
					</span>
				</div>
				<section>
					<div class="container">
						<div class="col-lo-8 col-md-7">
							<form action="/ask/askListSearch" method="get">
								<div align="center" class="row">
									<div class="col-lg-6_1 col-md-6 col-sm-6">
										<table class="sp--box">
											<tr>
												<td><select id="searchType" name="searchType">
														<option value="askTitle">タイトル</option>
														<option value="askCon">内容</option>
														<option value="userNm">作成者</option>
												</select></td>
												<td><input type="text" class="form-control"
													id="searchWord" placeholder="検索キーワード" name="searchWord"
													maxlength="100"></td>
												<td><button id="searchBtn" class="site-btn3"
														onclick="JlistPaging();" style="width: 88px; height: 38px;">検索</button></td>
											</tr>
										</table>
									</div>
									<div class="col-lg-6_1 col-md-6 col-sm-6">
										<input type="button" value="投稿"
											onclick="location.href = '/jpAsk/askListWrite';" id="submit"
											class="site-btn3" style="margin-left: 800px;">
										</div>
											<div class="col-lg-6_1 col-md-6 col-sm-6">
										<input type="button" value="1対1トーク"
											onclick="location.href = '/chat/chat.do';" id="submit"
											class="site-btn3" style="margin-left: 430px;">
											</div>
									
								</div>
							</form>
						</div>
					</div>
				</section>

			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

    <!-- Footer Section Begin -->
	<footer class="footer spad">
		<div class="container">

			<div class="x">
				<div class="footer__about">
					<div class="footer__about__logo">
						<a href="/jp"></a>
					</div>
					住所: ソウル特別市 鍾路区 チョンワデロ 1 (セジョンノ) 携帯番号: 02-730-5800 <i
						class="fa fa-envelope"> yoehadu815@gmail.com</i>

				</div>
			</div>
			<div class="x">
				<div class="footer__widget">
					<h6>Useful Links</h6>
					<a href="#">利用約款 </a> <a href="#">個人情報処理方針</a> <a href="#">未成年保護約款</a>
					<a href="#">カスタマーセンター</a> <a href="#">b2b お問い合わせ</a> <a href="#">コンテンツ
						提携</a>
				</div>
			</div>
			<div class="x">
				<div class="footer__widget">
					Copyright © 2022 take the reed (テーク・ザ・リード) ALL rights Reserved
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