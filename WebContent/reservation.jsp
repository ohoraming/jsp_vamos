<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="mvc.model.MemberDTO" %>
<%@ page import="mvc.model.ReservationDTO" %>
<%
	ArrayList<ReservationDTO> cafeList = (ArrayList<ReservationDTO>) request.getAttribute("reservationList");
	List memberList = (List) request.getAttribute("memberlist");
	MemberDTO memberlist = new MemberDTO();
	ReservationDTO list = new ReservationDTO();
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
		
        <section class="cart">
        	<div class="jumbotron">
        		<div class="container">
        			<h2><%=name%>님의 전체 예약 리스트</h2>
        		</div> 
        	</div>
            <div class="container">
            	<form name="addForm" action="./CheckedReservationDeleteAction.re?num=<%=list.getNum()%>"" method="post">
	        		<table class="table">
	                    <tr>
		                    <th style="text-align:center">선택</th>
	                        <th style="text-align:center">상품 이름</th>
	                        <th style="text-align:center">예약금</th>
	                        <th style="text-align:center">이용 인원</th>
	                        <th style="text-align:center">소계</th>
	                        <th style="text-align:center">이용 날짜</th>
							<th style="text-align:center">예약 시간</th>
							<th style="text-align:center">이용 시간</th>
							<th style="text-align:center">수정/삭제</th>
	                    </tr>
	                    <%
							for (int i = 0; i < cafeList.size(); i++)
							{
								list = (ReservationDTO) cafeList.get(i);
								int unitPrice = Integer.parseInt(list.getRe_unitPrice());
								int usingPeople = Integer.parseInt(list.getRe_usingPeople());
								int subtotal = unitPrice * usingPeople;
								String cate = null;
								String pname = null;
								String subname = list.getRe_pname();
								cate = subname.split("_")[0];
								pname = subname.split("_")[1];
								System.out.println(cate);
								System.out.println(pname);
	                    %>
			             <tr>
			             	<td><input type="checkbox" name="num" value="<%=list.getNum()%>"></td>
			                <td><input type="text" name="p_name" value="<%=list.getRe_pname()%>" style="text-align:center;" readOnly></td>
			                <td><input type="text" name="p_unitPrice" value="<%=list.getRe_unitPrice()%>" style="text-align:right;" readOnly>원</td>
			                <td>
								<label for="usingPeople"></label>
								<input type="number" id="usingPeople" name="usingPeople" min="1" max="5" style="text-align:center;" value="<%=list.getRe_usingPeople() %>">인
							</td>
							<td>
								<label for="subtotal"></label>
								<input type="text" id="subtotal" name="subtotal" style="text-align:right;" value="<%=subtotal%>" readOnly>원
							</td>
			                <td><input type="date" name="usingDate" style="text-align:center;" value="<%=list.getRe_usingDate() %>"></td>
							<td><input type="time" name="usingTime" style="text-align:center;" value="<%=list.getRe_usingTime() %>"></td>
							<td>
								<label for="usingHours"></label>
								<input type="number" id="using" name="usingHours" min="1" max="5" style="text-align:right;" value="<%=list.getRe_usingHours() %>">시간
							</td>
							<td><a href="./ThisReservationDeleteAction.re?num=<%=list.getNum()%>" class="btn btn-danger btn-sm">삭제</a>
								<a href="./PreReservationMakeAction.re?num=<%=list.getNum() %>&usingPeople=<%=list.getRe_usingPeople() %>&usingTime=<%=list.getRe_usingTime() %>&usingDate=<%=list.getRe_usingDate() %>&usingHours=<%=list.getRe_usingHours() %>&p_name=<%=pname %>&p_unitPrice=<%=unitPrice %>&cate=<%=cate %>" class="btn btn-warning btn-sm">수정하기</a>
							</td>
							
			            </tr>
			            <%
			            
			            	}
			            %>
			            <tr>
			            	<td></td>
			            	<td></td>
			            	<td></td>
			            	<td></td>
			            	<td></td>
			            	<td></td>
			            	<td></td>
			            	<td></td>
			            	<td></td>
			            </tr>
	                </table>
	                <div align="right">
	                	<input type="submit" class="btn btn-danger btn-sm" value="선택 삭제하기">
	                </div>
	            </form>
	            <div class="container">
					<div class="row">
						<form class="form-group">
							<h4>주문 확인서를 받을 이메일 주소를 입력해주세요</h4>
							<input type="email" class="form-control" placeholder="이메일을 입력해주세요">
						</form>	
					</div>
				</div>
				<div class="container" style="display:flex; justify-content: center;">
	                <div class="row">
	                    <div class="col-md-12">
							<a href="./ReservationDeleteAction.re?email=<%=email %>" class="btn btn-danger">나의 예약 리스트 전체 삭제하기</a>
							<a href="#" class="btn btn-success" onclick="addToCart()">예약하기</a>
	                    </div>
                    </div>
                </div>
            </div>
			
        </section>	
		<%@ include file="footer.jsp" %>
		<script type="text/javascript">
		function addToCart() 
		{
			if (confirm("지정한 옵션대로 상품을 예약하시겠습니까?")) 
			{
				document.addForm.submit();
			} 
			else 
			{		
				document.addForm.reset();
			}
		}
		
		function toEdit()
		{
			document.editTo.submit();
		}
		
		</script>
	</body>
</html>
</html>	
	