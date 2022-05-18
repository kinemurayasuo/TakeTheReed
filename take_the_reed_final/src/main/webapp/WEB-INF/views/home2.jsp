<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Our Project</title>
    
    <script type="text/javascript">
    	function JlistPaging() 
    	{
    		var searchType = $("#searchType option:selected").val();
            var searchWord = $("#searchWord").val();

            $.ajax({
                url: "/ebook/bookList",
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
                url: "/ebook/bookList",
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
				구독 상태 : <span>로그인 하여 확인해 주세요</span>
			</div>
		</div>
		<div class="humberger__menu__widget">
			<div class="header__top__right__language">

				<img src="/resources/img/language.png" alt="">
				<div>ENGLISH</div>
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
									<li class="active"><a href="/2">HOME</a></li>
									<li class="active"><a href="/echeckout/checkout">ORDER</a></li>
									<li class="active"><a href="/ebook/bookList">BOOK</a></li>
									<li class="active"><a href="/eask/askList">INQUIRY</a></li>
									<c:if test="${loginName != null}">
									<li class="active"><a href="/elike/likeList">BOOKMARK</a></li>
									</c:if>
								</ul>
							</nav>
						</div>
					</div>
					<div class="col-lg-6 col-md-6">
						<div class="header__top__right">
							<div class="header__top__right__language">
								<img src="/resources/img/language.png" alt="">
								<div>English</div>
								<span class="arrow_carrot-down"></span>
								<ul>
									<li><a href="/">한국어</a></li>
									<li><a href="/jp">日本語</a></li>
									<li><a href="/2">English</a></li>
								</ul>
							</div>
							<div class="header__top__right__auth">
								<c:if test="${loginName == null }">
									<a href="/eng/login" class="login">Sign In</a>
	                               &nbsp;&nbsp;&nbsp;
	                               <a href="/eng/email" class="login">
										 Create an account</a>
								</c:if>
								<c:if test="${loginName != null}">
	                               <span class = "userLogin"> Hi,'${loginName}' </span>
									<a href="/eng/logout" class="portfolio">Logout</a>
									<a href="/eng/myPage" class="portfolio">My Account</a>
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

   <!-- Hero Section Begin -->
	<section class="hero">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="hero__categories">
						<div class="hero__categories__all">
							<i class="fa fa-bars"></i> <span>All departments</span>
						</div>
						<ul>

							<li class="title"><a
								href="http://localhost:8888/ebook/bookListSearch?searchType=bookCate&searchWord=Literature">Literature</a></li>
							<li class="title"><a
								href="http://localhost:8888/ebook/bookListSearch?searchType=bookCate&searchWord=Economy">Economy</a></li>
							<li class="title"><a
								href="http://localhost:8888/ebook/bookListSearch?searchType=bookCate&searchWord=Personal Development">Personal Development</a></li>
							<li class="title"><a
								href="http://localhost:8888/ebook/bookListSearch?searchType=bookCate&searchWord=Cartoon">Cartoon</a></li>
							<li class="title"><a
								href="http://localhost:8888/ebook/bookListSearch?searchType=bookCate&searchWord=Study">Study</a></li>
							<li class="title"><a
								href="http://localhost:8888/ebook/bookListSearch?searchType=bookCate&searchWord=Children">Children</a></li>
							<li class="title"><a
								href="http://localhost:8888/ebook/bookListSearch?searchType=bookCate&searchWord=Art">Art</a></li>
							<li class="title"><a
								href="http://localhost:8888/ebook/bookListSearch?searchType=bookCate&searchWord=Foreign Language">Foreign Language</a></li>
							<li class="title"><a
								href="http://localhost:8888/ebook/bookListSearch?searchType=bookCate&searchWord=Religion">Religion</a></li>
							<li class="title"><a
								href="http://localhost:8888/ebook/bookListSearch?searchType=bookCate&searchWord=Computers/Mobile Phone">Computers/Mobile Phone</a></li>

						</ul>
					</div>
				</div>
				<div class="col-lg-9">
					<div class="hero__search">
						<div class="hero__search__form">
							<form action="/ebook/bookListSearch">
							<div class="col-lg-8 col-md-7">
								<select id="searchType" name="searchType" class = "select1">
									<option value="bookName">Title</option>
									<option value="bookCon">Story</option>
								</select> 
								<input type="text" placeholder="Search by title, author, subject"
									name="searchWord">
								<button type="submit" class="site-btn" onclick="JlistPaging();">GO</button>
								</div>
							</form>
						</div>
					</div>
					<div class="hero__item set-bg"
						data-setbg=/resources/img/book/main.jpg>
						<div class="hero__text">
							<span>MAIN BOOK</span>
							<h2>
								IT'S FOR YOUR BOOK<br>
							</h2>
							<p>GO TO BOOK TRAVEL</p>
							<a href="/echeckout/checkout" class="primary-btn">SUBSCRIPTION</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Hero Section End -->

   <!-- Categories Section Begin -->
	<section class="categories">
		<div class="container">
			<div class="row">
				<div class="categories__slider owl-carousel">
					<c:forEach items="${homeBookList }" var="list">
						<div class="col-lg-3_1">
							<a href="#" onclick='showPopup(${list.bookNum });'>
								<div class="categories__item set-bg" data-setbg="/uploadImg/${list.savedFilename1 }">
								</div>
							</a>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</section>
	<!-- Categories Section End -->
<!-- Featured Section Begin -->
	<section class="featured spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title from-blog__title">
						<h2>All Book</h2>
					</div>
				</div>
			</div>
			<div class="row featured__filter">
				<c:forEach items="${homeBookList }" var="list">
					<div class="col-lg-3 col-md-4 col-sm-6 mix manga *">
						<div class="featured__item">
							<div class="featured__item__pic set-bg"
								data-setbg="/uploadImg/${list.savedFilename1 }">
								<ul class="featured__item__pic__hover">
									<li><a href="#"><i class="fa fa-heart"></i></a></li>
									<li><a href="/echeckout/checkout"><i class="fa fa-shopping-cart"></i></a></li>
								</ul>
							</div>
							<div class="featured__item__text">
								<h6>
									<a href="#" onclick='showPopup(${list.bookNum });'>${list.bookName }</a>
								</h6>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>
	<!-- Featured Section End -->
   
  	<!-- Latest Product Section Begin -->
	<section class="latest-product spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-4 col-md-6">
					<div class="latest-product__text">
						<h4>Featured Titles</h4>
						<div class="latest-product__slider owl-carousel">
							<div class="latest-prdouct__slider__item">
								<c:forEach items="${homeBookList }" var="list" begin="1" end="3">
								<a href="#" onclick='showPopup(${list.bookNum });' class="latest-product__item">
									<div class="latest-product__item__pic">
										<img src="/uploadImg/${list.savedFilename1 }" alt="">
									</div>
									<div class="latest-product__item__text">
										<h6>${list.bookName }</h6>
									</div>
								</a></c:forEach> 
							</div>
							<div class="latest-prdouct__slider__item">
								<c:forEach items="${homeBookList }" var="list" begin="4" end="6">
								<a href="#" onclick='showPopup(${list.bookNum });' class="latest-product__item">
									<div class="latest-product__item__pic">
										<img src="/uploadImg/${list.savedFilename1 }" alt="">
									</div>
									<div class="latest-product__item__text">
										<h6>${list.bookName }</h6>
									</div>
								
								</a></c:forEach>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="latest-product__text">
						<h4>Bestsellers</h4>
						<div class="latest-product__slider owl-carousel">
							<div class="latest-prdouct__slider__item">
								<c:forEach items="${homeBookList }" var="list" begin="7" end="9">
								<a href="#" onclick='showPopup(${list.bookNum });' class="latest-product__item">
									<div class="latest-product__item__pic">
										<img src="/uploadImg/${list.savedFilename1 }" alt="">
									</div>
									<div class="latest-product__item__text">
										<h6>${list.bookName }</h6>
									</div>
								</a></c:forEach> 
							</div>
							<div class="latest-prdouct__slider__item">
								<c:forEach items="${homeBookList }" var="list" begin="10" end="12">
								<a href="#" onclick='showPopup(${list.bookNum });' class="latest-product__item">
									<div class="latest-product__item__pic">
										<img src="/uploadImg/${list.savedFilename1 }" alt="">
									</div>
									<div class="latest-product__item__text">
										<h6>${list.bookName }</h6>
									</div>
								
								</a></c:forEach>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="latest-product__text">
						<h4>Ranking</h4>
						<div class="latest-product__slider owl-carousel">
							<div class="latest-prdouct__slider__item">
								<c:forEach items="${homeBookList }" var="list" begin="13" end="15">
								<a href="#" onclick='showPopup(${list.bookNum });' class="latest-product__item">
									<div class="latest-product__item__pic">
										<img src="/uploadImg/${list.savedFilename1 }" alt="">
									</div>
									<div class="latest-product__item__text">
										<h6>${list.bookName }</h6>
									</div>
								</a></c:forEach> 
							</div>
							<div class="latest-prdouct__slider__item">
								<c:forEach items="${homeBookList }" var="list" begin="16" end="18">
								<a href="#" onclick='showPopup(${list.bookNum });' class="latest-product__item">
									<div class="latest-product__item__pic">
										<img src="/uploadImg/${list.savedFilename1 }" alt="">
									</div>
									<div class="latest-product__item__text">
										<h6>${list.bookName }</h6>
									</div>
								
								</a></c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Latest Product Section End -->

    <!-- Blog Section Begin -->
	<section class="from-blog spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title from-blog__title">
						<h2>Popular</h2>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-4 col-md-4 col-sm-6">
					<div class="blog__item">
						<div class="blog__item__pic">
							<a href="http://localhost:8888/ebook/bookListSearch?searchType=bookCate&searchWord=Fate/Grand Order 1">
								<img src="/resources/img/book/literature/tonight.jpg" alt="">
							</a>
						</div>
						<div class="blog__item__text">
							<div class = "blog__item__textArea">
							<ul>
								<li><i class="fa fa-calendar-o"></i> june 06,2021</li>
							</ul>
							<h5>
								<a href="/ebook/bookDetail">69 Million Things I Hate About You</a>
							</h5>
							<p>“Sit back and enjoy the ride, because you're going to laugh your butt off!" - Brenda, AL. After personal assistant Kiersten</p>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-6">
					<div class="blog__item">
						<div class="blog__item__pic">
							<a href="http://localhost:8888/ebook/bookDetail?bookNum=2">
							<img src="/resources/img/book/Self-development/idea.jpg" alt="">
							</a>
						</div>
						<div class="blog__item__text">
							<div class = "blog__item__textArea">
							<ul>
								<li><i class="fa fa-calendar-o"></i> October 14,2019</li>
							</ul>
							<h5>
								<a href="/ebook/bookDetail">It Ends with Us</a>
							</h5>
							<p>In this “brave and heartbreaking novel that digs its claws into you and doesn’t let go, long after you’ve finished it” </p>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-6">
					<div class="blog__item">
						<div class="blog__item__pic">
							<a href="http://localhost:8888/ebook/bookDetail?bookNum=2">
							<img src="/resources/img/book/literature/편의점.jpg" alt="">
							</a>
						</div>
						<div class="blog__item__text">
							<div class = "blog__item__textArea">
							<ul>
								<li><i class="fa fa-calendar-o"></i> april 20,2021</li>
							</ul>
							<h5>
								<a href="/ebook/bookDetail">A Will and a Way</a>
							</h5>
							<p>From “America’s favorite novelist” ( The New Yorker ), a young woman inherits a fortune—and an even greater gift of love just in time for the holidays</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Blog Section End -->

	<!-- Footer Section Begin -->
	<footer class="footer spad">
		<div class="container">

			<div class="x">
				<div class="footer__about">
					<div class="footer__about__logo">
						<a href="./index.html"></a>
					</div>
					ADDRESS: 1, Cheongwadae-ro, Jongno-gu, Seoul, Republic of Korea  phone number: 02-730-5800 <i
						class="fa fa-envelope"> yoehadu815@gmail.com</i>

				</div>
			</div>
			<div class="x">
				<div class="footer__widget">
					<h6>Useful Links</h6>
					<a href="#">terms and conditions </a> <a href="#">privacy policy</a> <a href="#">Teenager Protection Policy</a>
					<a href="#">CUSTOMER SERVICE</a> <a href="#">b2b INQUIRY</a> <a href="#">
						</a>
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