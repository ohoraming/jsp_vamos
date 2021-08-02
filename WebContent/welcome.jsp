<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>MY_PORTFOLIO</title>
		
		<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,800italic,800,700italic,700,600italic,400italic,600,300italic,300|Oswald:400,300,700' rel='stylesheet' type='text/css'>
		<!-- Bootstrap -->
		<link href="./resources/css/bootstrap.min.css" rel="stylesheet">
		<link href="./resources/css/font-awesome.min.css" rel="stylesheet">
		<link href="./resources/css/owl.carousel.css" rel="stylesheet">
		<link href="./resources/css/owl.theme.css" rel="stylesheet">
		<link href="./resources/css/owl.transitions.css" rel="stylesheet">
		<link href="./resources/css/style.css" rel="stylesheet">

		<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
		<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
		<!--[if lt IE 9]>
		<script src="js/html5shiv.min.js"></script>
		<script src="js/respond.min.js"></script>
		<![endif]-->
		
		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
		<script src="./resources/js/jquery.min.js"></script>
		<!-- Include all compiled plugins (below), or include individual files as needed -->
		<script src="./resources/js/bootstrap.min.js"></script>
		<script src="./resources/js/jquery.easing.min.js"></script>
		<script src="./resources/js/jquery.stellar.js"></script>
		<script src="./resources/js/jquery.appear.js"></script>
		<script src="./resources/js/jquery.nicescroll.min.js"></script>
		<script src="./resources/js/jquery.countTo.js"></script>
		<script src="./resources/js/jquery.shuffle.modernizr.js"></script>
		<script src="./resources/js/jquery.shuffle.js"></script>
		<script src="./resources/js/owl.carousel.js"></script>
		<script src="./resources/js/jquery.ajaxchimp.min.js"></script>
		<script src="./resources/js/script.js"></script>
	</head>
	<body data-spy="scroll" data-target=".main-nav">
		
		<%@ include file="menu.jsp" %>
				
		<section class="home" id="home" data-stellar-background-ratio="0.4">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<div class="st-home-unit">
								<div class="hero-txt">
									<p class="hero-work" style="text-shadow : 0px 0px 3px #000000;">어디로 떠나고 싶나요?</p>
									<form action="./CafeListAction.do?pageNum=1" method="post">
										<div class="input-group">
											<input type="text" name="addr" class="form-control" placeholder="지역을 검색해보세요!">
											<div class="input-group-btn">
												<input type="submit" class="btn btn-main btn-lg" value="Go!">
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			<div class="mouse-icon"><div class="wheel"></div></div>
		</section>
		
		<section class="cafe" id="cafe">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="section-title st-center">
							<h3>여기는 카페자리</h3>
							<p>어디가 좋을까?</p>
						</div>
						<div class="row mb90">
							<div class="col-md-6">
								<p>Texit l, habere se indocti magnosque culpa gravioribus discedere eas indignae diogenem, praetermissum effugiendorum vult dicent, periculum dolere putat. Iucunditatem quid turbulenta patre eae depravatum talem elaborare plerisque repellere, o potiendi tuo aliter, militaris sint tranquillat liberalitati. Locus delicata divelli intemperantes audeam maximisque sitne pulcherrimum aegritudines studium. Habent inveniri fidelissimae aequi andriam laudabilis. Libido censet assiduitas quae probantur tantalo exquisitaque erunt laudatur optari. Late suapte veterum enim qui magna securi eaque proficiscuntur.</p>
							</div>
							<div class="col-md-6">
								<img src="./resources/photos/cafe1.jpg" class="img-responsive">
							</div>
							<a href="./CafeListAction.do?pageNum=1&cate=카페" class="btn btn-main btn-lg">더 많은 카페 보기</a>
						</div>
					</div>
				</div>
			</div>
		</section>

		<section class="accomodation" id="accomodation">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="section-title st-center">
							<h3>여기는 숙소자리</h3>
							<p>원하는 숙소를 골라보자!</p>
						</div>
						<div class="row mb90">
							<div class="col-md-6">
								<p>Texit l, habere se indocti magnosque culpa gravioribus discedere eas indignae diogenem, praetermissum effugiendorum vult dicent, periculum dolere putat. Iucunditatem quid turbulenta patre eae depravatum talem elaborare plerisque repellere, o potiendi tuo aliter, militaris sint tranquillat liberalitati. Locus delicata divelli intemperantes audeam maximisque sitne pulcherrimum aegritudines studium. Habent inveniri fidelissimae aequi andriam laudabilis. Libido censet assiduitas quae probantur tantalo exquisitaque erunt laudatur optari. Late suapte veterum enim qui magna securi eaque proficiscuntur.</p>
							</div>
							<div class="col-md-6">
								<img src="./resources/photos/full2.jpg" class="img-responsive">
							</div>
							<a href="./CafeListAction.do?pageNum=1&cate=숙소" class="btn btn-main btn-lg">더 많은 숙소 보기</a>
						</div>
					</div>
				</div>
			</div>
		</section>

		<section class="restaurant" id="restaurant">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="section-title st-center">
							<h3>여기는 맛집자리</h3>
							<p>맛난거 먹으러 고고씽</p>
						</div>
						<div class="row mb90">
							<div class="col-md-6">
								<p>Texit l, habere se indocti magnosque culpa gravioribus discedere eas indignae diogenem, praetermissum effugiendorum vult dicent, periculum dolere putat. Iucunditatem quid turbulenta patre eae depravatum talem elaborare plerisque repellere, o potiendi tuo aliter, militaris sint tranquillat liberalitati. Locus delicata divelli intemperantes audeam maximisque sitne pulcherrimum aegritudines studium. Habent inveniri fidelissimae aequi andriam laudabilis. Libido censet assiduitas quae probantur tantalo exquisitaque erunt laudatur optari. Late suapte veterum enim qui magna securi eaque proficiscuntur.</p>
							</div>
							<div class="col-md-6">
								<img src="./resources/photos/nam1.jpg" class="img-responsive">
							</div>
							<a href="./CafeListAction.do?pageNum=1&cate=맛집" class="btn btn-main btn-lg">더 많은 맛집 보기</a>
						</div>
					</div>
				</div>
			</div>
		</section>

		<%@ include file="theOthers.jsp" %>

		<%@ include file="login.jsp" %>
		
		<%@ include file="footer.jsp" %>
		<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
	</body>
</html>