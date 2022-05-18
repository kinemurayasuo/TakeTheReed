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
    <title>アカウント情報管理</title>

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
	 h1,h2 {
		text-align:center;
	} 
	#note {
		text-align:center;
		color:red;
		font-weight:bold;
	}
	tr,th,td {
		color:#547B54;
	}
	#but {
		color:white;
		background-color:#324B32;
		text-align:center;
		height:50px;
		width:140px;
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

  <!-- Contact Form Begin -->
    <div class="contact-form spad">
        <div class="container">
            <div class="row">  </div>
            </div>
            
    <!-- 마이페이지  begin -->  
 	<div style="width:100%; height:100px;"></div>
	<h1 style="color:#547B54;">마이페이지</h1><br>
	
	<form method = "post">
	<c:if test="${not empty userList }"> 
	  <c:forEach items ="${userList }" var="user">
		<table style="margin-left: auto; margin-right: auto;">
	 		<tr>
	 			<th>ユーザーID</th>
	 			<td>${user.userId }</td>
	        </tr>
	        <tr>
	            <th>名前</th>
	            <td>${user.userName }</td>
	        </tr>
	         <tr>
	            <th>ユーザネーム</th>
	            <td>${user.userNm }</td>
	        </tr>
	         <tr>
	            <th>携帯番号</th>
	            <td>${user.userTel }</td>
	        </tr>
	        <tr>
	            <th>アドレスメール</th>
	            <td>${user.userEmail }</td>
	        </tr>
	        <tr>
	            <th>登録状態</th>
	            <td></td>
	        </tr>
	        <td><input type="button" value="정보수정" id="but" style="font-family: 'IBM Plex Sans KR';  position: relative; top: 20px;"
								onclick="location.href='/jpUser/pwchk'"></td>	
	   </table>
      </c:forEach>
    </c:if>
	  
	  
	 <c:if test="${not empty userList1 }"> 
	  <c:forEach items ="${userList1 }" var="user1">
		<table style="margin-left: auto; margin-right: auto;">
		    	<h4 id="note">ソーシャルユーザーは修正できません。</h4>
	 		<tr>
	 			<th>ソーシャル ID </th>
	 			<td>${user1.userId }</td>
	        </tr>
	 		<tr>
	 			<th>ソーシャルニックネーム </th>
	 			<td>${user1.userNm }</td>
	        </tr>
	        <tr>
	            <th>名前</th>
	           <td>${user1.userName }</td>
	        </tr>
	         <tr>
	            <th>携帯番号</th>
	            <td>${user1.userTel }</td>
	        </tr>
	        <tr>
	            <th>アカウントメール</th>
	            <td>${user1.userEmail }</td>
	        </tr>
	        <tr>
	            <th>登録状態</th>
	            <td></td>
	        </tr>
	    </table>
	  </c:forEach>
	</c:if>
	
	
	<hr color="green" width="75%" align="center">
	<h2 style="color:#547B54;">閲覧履歴</h2><br>
	<c:if test = "${empty pastList }">
		現在表示できる履歴がありません。
	</c:if>
	<c:if test="${not empty pastList }">
	 <table class="pastList" style="margin-left: auto; margin-right: auto;">
		<c:forEach items ="${pastList }" var="past" varStatus="status">
			<tr>
				<th>タイトル</th>
				<td>${past.bookName }</td>
			</tr>
			<tr>
				<th>作家</th>
				<td>${past.bookWriter }</td>
			</tr>
			<tr>
				<th>イラスト</th>
				<td>${past.savedFilename1 }</td>
			</tr>
			<tr>
				<th>ビュー</th>
				<td>${past.bookCk }</td>
			</tr>
			<tr>
				<th>評価</th>
				<td>${past.bookStar }</td>
			</tr>
		</c:forEach>
	  </table>
	</c:if>
  </form>
    <!-- 마이페이지 end -->

    <!-- Footer Section Begin -->
	<footer class="footer spad">
		<div class="container">

			<div class="x">
				<div class="footer__about">
					<div class="footer__about__logo">
						<a href="./index.html"></a>
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