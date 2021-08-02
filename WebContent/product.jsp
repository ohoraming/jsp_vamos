<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="mvc.model.ProductDTO"%>
<%
	String id = (String) request.getAttribute("id");
	int pageNum = ((Integer) request.getAttribute("pageNum")).intValue();
	ProductDTO list = (ProductDTO) request.getAttribute("list");
%>
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
		
		<script type="text/javascript">
		function addToCart() 
		{
			if (confirm("상품을 나의 예약 리스트에 추가하시겠습니까?")) 
			{
				document.addForm.submit();
			} 
			else 
			{		
				document.addForm.reset();
			}
		}
		</script>
</head>
<body data-spy="scroll" data-target=".main-nav">
	
	<%@ include file="menu.jsp"%>
	<section class="home" id="home" data-stellar-background-ratio="0.4"></section>
	
	<section class="place" id="place">
		<form name="addForm" action="./PreReservationMakeAction.re?cate=<%=list.getCate() %>&p_name=<%=list.getName() %>&p_unitPrice=<%=list.getUnitPrice() %>" method="post">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
							<h2><%=list.getRegion()%> <%=list.getCate()%> "<%=list.getName()%>"</h2>
					</div>
					<div class="col-md-6">
						<img class="img-responsive" src="./resources/photos/<%=list.getPic1()%>" width="460px" height="350px">
					</div>
					<div class="col-md-6">
						<p><%=list.getDescrip()%></p>
						<p>주소 : <%=list.getAddr()%></p>
						<p>문의 : <%=list.getPhone()%></p>
						<p>예약금 : <%=list.getUnitPrice()%>원</p>
					</div>
					<input type="hidden" name="p_name" value="<%=list.getName()%>">
					<input type="hidden" name="p_unitPrice" value="<%=list.getUnitPrice()%>">
						<a href="./CafeListAction.do?pageNum=<%=pageNum%>" class="btn btn-main btn-lg">목록</a>
						<a href="./ReservationList.re" class="btn btn-main btn-lg">나의 예약 리스트</a>
						<a href="#" class="btn btn-main btn-lg" onclick="addToCart()">상품 예약하기</a>
						<a href="./ProductUpdateForm.do?id=<%=list.getId()%>&pageNum=<%=pageNum %>" class="btn btn-main btn-lg">상품 수정</a>
						<a href="./ProductDeleteAction.do?id=<%=list.getId()%>" class="btn btn-main btn-lg">상품 삭제</a> 
				</div>
			</div>	
		</form>
		<div class="container">
				<h2></h2>
				<div class="row">
				  <div class="col-md-4">
					<div class="thumbnail">
					  <img src="./resources/photos/<%=list.getPic2()%>" width="400px" height="230px">
					</div>
				  </div>
				  <div class="col-md-4">
					<div class="thumbnail">
					  <img src="./resources/photos/<%=list.getPic3()%>" width="400px" height="230px">
					 </div>
				  </div>
				  <div class="col-md-4">
					<div class="thumbnail">
					  <img src="./resources/photos/<%=list.getPic4()%>" width="400px" height="230px">
					 </div>
				  </div>
				</div>
			  </div>
		</section>
		
		
	<%@ include file="footer.jsp"%>
</body>
</html>