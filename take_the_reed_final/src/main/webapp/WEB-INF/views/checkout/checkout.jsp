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
    <title>take | the | reed</title>
    
    <script type="text/javascript">
    	function JlistPaging() 
    	{
    		var searchType = $("#searchType option:selected").val();
            var searchWord = $("#searchWord").val();

            $.ajax({
                url: "/book/bookList",
                type: "get",
                data: 
                {
                	searchType: searchType,
                    searchWord: searchWord
                }
            })
        }
    	
    	function JlistPaging1() 
    	{
            var searchWord = $("#searchWord").val();

            $.ajax({
                url: "/book/bookList",
                type: "get",
                data: 
                {
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

    <!-- Checkout Section Begin -->
    <section class="checkout spad">
        <div class="container">
            <div class="row">
            </div>
            <div class="checkout__form">
                <h4 class="checkout_form.title">?????? ??????</h4>
                <form action="/checkout/sub" id="payment" method="post">
                <input type="hidden" name="addDate" id="addDate" >
                </form>
                <form action="#">
                    <div class="row">
                        <div class="col-md-4 col-md-6-1">
                            <div class="checkout__order">
                                <h4>???  ?????? ?????????</h4>
                                
                                <div class="checkout__order__total">Total <span>9.900</span></div>
                                <input type="button" value="PLACE ORDER" onclick="submitSub(30);" class="site-btn">
                            </div>
                        </div>
                        <div class="col-md-4 col-md-6-1">
                            <div class="checkout__order">
                                <h4>6??????  ?????? ?????????</h4>
                                <div class="checkout__order__total">Total <span>49.900</span></div>
                                <input type="button" value="PLACE ORDER" onclick="submitSub(184);" class="site-btn">
                            </div>
                        </div>
                        <div class="col-md-4 col-md-6-1">
                            <div class="checkout__order">
                                <h4>???  ?????? ?????????</h4>
                                <div class="checkout__order__total">Total <span>99.900</span></div>
                                <input type="button" value="PLACE ORDER" onclick="submitSub(365);" class="site-btn">
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>
    <!-- Checkout Section End -->

    <!-- Footer Section Begin -->
    <footer class="footer spad">
        <div class="container">
            
                <div class="x">
                    <div class="footer__about">
                        <div class="footer__about__logo">
                            <a href="./index.html"></a>
                        </div>
                                                  ??????: ??????????????? ????????? ???????????? 1 (?????????) ????????????: 02-730-5800 <i class="fa fa-envelope"> yoehadu815@gmail.com</i>
                    
                    </div>
                </div>
                <div class="x">
                    <div class="footer__widget">
                        <h6>Useful Links</h6>
                            <a href="#">???????????? </a>
                            <a href="#">????????????????????????</a>
                            <a href="#">?????????????????????</a>
                            <a href="#">????????????</a>
                            <a href="#">b2b ??????</a>
                            <a href="#">????????? ????????????</a>
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

    <!-- Js Plugins -->
    <script src="/resources/js/jquery-3.3.1.min.js"></script>
    <script src="/resources/js/bootstrap.min.js"></script>
    <script src="/resources/js/jquery.nice-select.min.js"></script>
    <script src="/resources/js/jquery-ui.min.js"></script>
    <script src="/resources/js/jquery.slicknav.js"></script>
    <script src="/resources/js/mixitup.min.js"></script>
    <script src="/resources/js/owl.carousel.min.js"></script>
    <script src="/resources/js/main.js"></script>
    <script src="/resources/js/submitSub.js"></script>

 

</body>

</html>