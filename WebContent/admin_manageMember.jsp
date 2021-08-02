<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="mvc.model.MemberDTO" %>
<%
	List member = (List) request.getAttribute("memberlist");
	int total_record = ((Integer) request.getAttribute("total_record")).intValue();
	int pageNum = ((Integer) request.getAttribute("pageNum")).intValue();
	int total_page = ((Integer) request.getAttribute("total_page")).intValue();
	
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
                    <h2>관리자용 회원 관리 페이지입니다</h2>
                </div>
            </div>
        </section>
        
        <section class="management">
        	<form action="./MemberManageView.me" method="post">
	        	<div class="container">
	        	<div class="text-right">
					<span class="badge badge-success">전체 회원 수 : <%=total_record%></span>
				</div>
			
			<!-- 게시글 검색바 -->
			
				<div align="left">
					<table>
						<tr>
							<td width="100%" align="left">&nbsp;&nbsp; 
								<select name="items" class="txt">
										<option value="name">이름</option>
										<option value="email">이메일</option>
										<option value="birthmm">출생월</option>
										<option value="birthdd">출생일</option>
										<option value="phonenumber">연락처</option>
								</select> 
								<input type="text" name="text"> 
								<input type="submit" id="btnAdd" class="btn btn-default" value="회원 검색">
							</td>
						</tr>
					</table>
				</div>
	        		<table class="table">
	                    <tr>
	                        <th>회원 이름</th>
	                        <th>이메일</th>
	                        <th>비고</th>
	                    </tr>
	                    <!-- for문으로 회원 정보 뿌리기 -->
	                    <%
								for (int j = 0; j < member.size(); j++) 
								{
									MemberDTO memberlist = (MemberDTO) member.get(j);
						%>
						<tr>
							<td><%=memberlist.getName() %></td>
							<td><%=memberlist.getEmail() %></td>
							<td><a href="./admin_MemberDeleteAction.me?email=<%=memberlist.getEmail()%>">회원 삭제</a> / 
								<a href="./admin_MemberViewAction.me?email=<%=memberlist.getEmail()%>">회원 정보 상세 보기</a></td>
						</tr>
						<%
								}
						%>
	             	</table>
	             </div>
	         </form>
        </section>
        
        <!-- 페이징 처리 -->
			<div align="center">
				<c:set var="pageNum" value="<%=pageNum%>" /> 
				<c:forEach var="i" begin="1" end="<%=total_page%>">
					<a href="<c:url value="./admin_MemberManageView.me?pageNum=${i}" /> ">
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
        
        <%@ include file="footer.jsp" %>
	</body>
</html>