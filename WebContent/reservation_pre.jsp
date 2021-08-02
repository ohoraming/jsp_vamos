<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="mvc.model.MemberDTO" %>
<%@ page import="mvc.model.ReservationDTO" %>
<%
	String p_name = request.getParameter("p_name");
	String unitPrice = request.getParameter("p_unitPrice");
	String cate = request.getParameter("cate");
	String usingPeople="";
	String usingHours="";
	String usingDate="";
	String usingTime="";
	int num = 0;
	if(request.getParameter("usingPeople")!=null)
	{
		usingPeople = request.getParameter("usingPeople");
		usingHours = request.getParameter("usingHours");
		usingDate = request.getParameter("usingDate");
		usingTime = request.getParameter("usingTime");
		num = Integer.parseInt(request.getParameter("num"));
	}
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
        			<h2><%=name%>님의 예약 리스트</h2>
        		</div> 
        	</div>
            <div class="container">
            	<form name="addForm" action="./ReservationMakeAction.re<%if(request.getParameter("usingPeople")!=null){ %>?edit=1&num=<%=num %><%} %>" method="post">
	        		<table class="table">
	                    <tr>
	                        <th style="text-align:center">상품 이름</th>
	                        <th style="text-align:center">예약금</th>
	                        <th style="text-align:center">이용 인원</th>
	                        <th style="text-align:center">이용 날짜</th>
							<th style="text-align:center">예약 시간</th>
							<th style="text-align:center">이용 시간</th>
	                    </tr>
  		                <tr>
			                <td><input type="text" name="p_name" value="<%=cate%>_<%=p_name%>" style="text-align:center;" readOnly></td>
			                <td><input type="text" name="p_unitPrice" value="<%=unitPrice%>" style="text-align:right;" readOnly>원</td>
			                <td>
								<label for="usingPeople"></label>
								<input type="number" id="usingPeople" name="usingPeople" min="1" max="10" style="text-align:center;" value="<%=usingPeople %>">인
							</td>
			                <td><input type="date" name="usingDate" style="text-align:center;" value="<%=usingDate %>"></td>
							<td><input type="time" name="usingTime" style="text-align:center;" value="<%=usingTime %>"></td>
							<td>
								<label for="usingHours"></label>
								<input type="number" id="using" name="usingHours" min="1" max="5" style="text-align:right;" value="<%=usingHours %>">시간
							</td>
			            </tr>
	                </table>
	            </form>
	            
				<div class="container" style="display:flex; justify-content: center;">
	                <div class="row">
	                    <div class="col-md-12">
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
		</script>
	</body>
</html>
</html>	
	