<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="mvc.model.ProductDTO"%>
<%
	int pageNum = ((Integer) request.getAttribute("pageNum")).intValue();
	int total_page = ((Integer) request.getAttribute("total_page")).intValue();
	int total_record = ((Integer) request.getAttribute("total_record")).intValue();
	List<ProductDTO> cafeList = (List<ProductDTO>) request.getAttribute("cafeList");
	ProductDTO cafelist = new ProductDTO();
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
	</head>
	<body data-spy="scroll" data-target=".main-nav">
		
		<%@ include file="menu.jsp" %>
				
		<section class="home" id="home" data-stellar-background-ratio="0.4">
		</section>
		<!-- list -->
		<section class="cafe" id="cafe">
			<div class="container">
				<div class="row">
					<div class="col-md-12" style="text-align: center;">
						<div class="section-title st-center">
							<h3>list</h3>
						</div>
						<%
							for (int j = 0; j < cafeList.size(); j++) 
							{
								cafelist = (ProductDTO) cafeList.get(j);
						%>
												
						<div class="col-sm-4">
							<div class="thumbnail">
								<a href="./ProductViewAction.do?id=<%=cafelist.getId()%>&pageNum=<%=pageNum%>"> 
									<img src="./resources/photos/<%=cafelist.getPic1()%>" class="img-responsive" width="400" height="300">
									<div class="caption">
										<p><%=cafelist.getRegion()%> <%=cafelist.getCate()%> "<%=cafelist.getName()%>"</p>
							  		</div>
								</a>
							</div>
                        </div>
                            
                        <%
							}
						%>
                    </div>
				</div>
			</div>
		</section>
		
	<!-- 페이지 처리 -->
		<section class="accomodation" id="accomodation">
			<div class="container">
				<div class="row col-md-12">
					<c:set var="pageNum" value="<%=pageNum%>" /> 
					<c:forEach var="i" begin="1" end="<%=total_page%>">
						<a href="<c:url value="./CafeListAction.do?pageNum=${i}" /> ">
							<c:choose>
								<c:when test="${pageNum==i}">
									<font color='4C5317'><b> [${i}]</b></font>
								</c:when>
								<c:otherwise>
									<font color='4C5317'> [${i}]</font>
								</c:otherwise>
							</c:choose>
						</a>
					</c:forEach>
				</div>
			</div>
		</section>
		
	<!-- 지역 검색바 -->
		<section class="restaurant" id="restaurant">
			<div class="container">
				<div class="row">
					<div class="col-sm-2">
						<form action="./CafeListAction.do" style="display: flex;">
							<input type="hidden" name="pageNum" value="<%=pageNum %>"/>
							<input type="hidden" name="cate" value="<%=request.getParameter("cate") %>"/>
							<input type="text" name="text"/>
							<input type="submit" class="btn btn-main btn-md" value="지역명으로 검색하기"/>
						</form>
					</div>
				</div>
			</div>
		</section>

		<%@ include file="footer.jsp" %>
	</body>
</html>