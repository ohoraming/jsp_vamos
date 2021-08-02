<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="mvc.model.MemberDTO" %>
<%
	MemberDTO member = (MemberDTO) request.getAttribute("member");
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
                    <h2>관리자용 회원 상세 정보 페이지입니다</h2>
                </div>
            </div>
        </section>
		
		<section class="management">
        	<form action="./admin_MemberUpdateAction.me?email=<%=email %>" method="post">
	        	<div class="container">
	        		<table class="table">
	                    <tr>
	                        <th>회원 이름</th>
	                        <th>이메일</th>
	                        <th>생일(월)</th>
	                        <th>생일(일)</th>
	                        <th>연락처</th>
	                        <th>비고</th>
	                    </tr>
						<tr>
							<td><input type="text" name="name" value="<%=member.getName() %>"></td>
							<td><input type="email" name="email" value="<%=member.getEmail() %>" readOnly></td>
							<td><input type="text" name="birthmm" value="<%=member.getBirthmm() %>"></td>
							<td><input type="text" name="birthdd" value="<%=member.getBirthdd() %>"></td>
							<td><input type="text" name="phonenumber" value="<%=member.getPhonenumber() %>"></td>
							<td><a href="./admin_MemberDeleteAction.me?email=<%=member.getEmail() %>">회원 삭제</a> 
								/ <input type="submit" value="회원 정보 수정"></td>
						</tr>
	             	</table>
	             </div>
	         </form>
        </section>
        
		<%@ include file="footer.jsp" %>
	</body>
</html>