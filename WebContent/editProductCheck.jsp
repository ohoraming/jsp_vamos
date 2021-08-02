<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="mvc.model.ProductDTO"%>
<%-- <%@ page import="mvc.model.ProductDAO"%> --%>
<%
	ProductDTO list = (ProductDTO) request.getAttribute("list") ;
//	ProductDTO list = new ProductDTO();
	String id = String.valueOf(list.getId());
	/* getAttribute(String name) : 속성 이름이 name인 값을 가져옴 */ 
	
%>
<!DOCTYPE html>
<html lang="en">
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
		<section class="home" id="home" data-stellar-background-ratio="0.4"></section>
		
        <section class="check">
            <div class="jumbotron">
                <div class="container">
                    <h2>관리자용 상품 수정 페이지입니다</h2>
                </div>
            </div>
        </section>

        <section>
			<form action="./CafeListAction.do?id=<%=list.getId()%>" method="post" enctype="multipart/form-data">
				<div class="container" style="display:flex; justify-content: center;">
					
					<div class="col-sm-8" style="transform: translateX(25%);">
						<div class="form-group">
							<label for="id">상품 아이디</label>
							<input type="text" id="id" name="id" style="width: 100%;" 
									value="<%=list.getId()%>" placeholder="숫자 형식으로 입력하세요"><br>
						</div>
						<div class="form-group">
							<label for="name">상품 이름</label>
							<input type="text" id="name" name="name" style="width: 100%;" 
							value="<%=list.getName()%>"><br>
						</div>
						<div class="form-group">
							<label for="pic1">상품 사진1</label>
							<input type="file" id="pic1" name="pic1">
						</div>
						<div class="form-group">
							<label for="pic2">상품 사진2</label>
							<input type="file" id="pic2" name="pic2">
						</div>
						<div class="form-group">
							<label for="pic3">상품 사진3</label>
							<input type="file" id="pic3" name="pic3">
						</div>
						<div class="form-group">
							<label for="pic4">상품 사진4</label>
							<input type="file" id="pic4" name="pic4">
						</div>
						<div>
							<label for="cate">상품 분류(카페/숙소/맛집 중 하나 선택)</label>
							<input type="text" id="cate" name="cate" value="<%=list.getCate()%>">
						</div>
						<div class="form-group">
							<label for="region">상품 지역</label>
							<input type="text" id="region" name="region" 
							value="<%=list.getRegion()%>">
						</div>	
						<div class="form-group">
							<label for="addr">상품의 주소</label>
							<input type="text" id="addr" name="addr" placeholder="주소 작성" 
							style="width: 100%;" value="<%=list.getAddr()%>"> 
						</div>
						<div class="form-group">
							<label for="phone">상품의 전화번호</label>
							<input type="text" id="phone" name="phone" placeholder="전화번호 작성" 
							style="width: 100%;" value="<%=list.getPhone()%>"> 
						</div>
						<div class="form-group">
							<label for="unitPrice">예약금</label>
							<input type="text" id="unitPrice" name="unitPrice"
							style="width: 95%;" value="<%=list.getUnitPrice()%>">원
						</div>
						<div class="form-group">
							<label for="descrip">상품 설명</label><br>
							<textarea name="descrip" rows="10" cols="30" 
							id="descrip" name="descrip" placeholder="간단한 설명 작성" 
							style="width: 100%;"><%=list.getDescrip()%></textarea>
						</div>
						<div class="form-group" style="text-align: center;">
							<!-- <input type="#" class="btn btn-main btn-lg" value="이전페이지"> -->
							<input type="submit" class="btn btn-main btn-lg" value="수정 하기">
						</div>	
					</div>
					<div class="col-sm-4"></div>
				</div>
			</form>
        </section>
        
		<section>
		<!--여기까지 본문 작성하면 됨! -->
		<%@ include file="footer.jsp" %>
	</body>
</html>