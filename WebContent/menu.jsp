<%@ page contentType="text/html; charset=utf-8"%>
<%
	String name = (String) (session.getAttribute("name"));
	String email = (String) (session.getAttribute("email"));
	String url = (String) request.getServletPath();
%>
<header class="st-navbar st-navbar-mini">
	<nav class="navbar navbar-default navbar-fixed-top clearfix" role="navigation">
		<div class="container"><!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#sept-main-nav">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="./welcome.jsp"><img src="photos/logo3.png" alt="" class="img-responsive"></a>
			</div>
			
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse main-nav" id="sept-main-nav">
				<ul class="nav navbar-nav navbar-right">
					<li class="active"><a href="./welcome.jsp">Home</a></li>
					<%if(session.getAttribute("name")==null){ %>
					<li><a href="<%=url.indexOf("welcome.jsp")>-1?"#login":"./welcome.jsp#login" %>">로그인</a></li>
					<li><a href="./signUpForm.jsp">회원가입</a></li>
					<%} else { %>
						<%if(name.equals("admin")){ %>
					<li><a href="admin_main.jsp">관리자 전용 페이지입니다</a></li>
						<%} else {%>
					<li><a><%=name %>님 안녕하세요</a></li>
						<%} %>
					<li><a href="./logout.me">로그아웃</a></li>
					<li><a href="./MemberViewAction.me?email=<%=email%>">회원 정보 수정/탈퇴</a></li>
					<li><a href="./ReservationList.re?email=<%=email%>">나의 예약 리스트</a></li>
					<%}%>
					<li class=""><a href="<%=url.indexOf("welcome.jsp")>-1?"#cafe":"./CafeListAction.do?pageNum=1&cate=카페" %>">카페</a></li>
					<li class=""><a href="<%=url.indexOf("welcome.jsp")>-1?"#accomodation":"./CafeListAction.do?pageNum=1&cate=숙소" %>">숙소</a></li>
					<li class=""><a href="<%=url.indexOf("welcome.jsp")>-1?"#restaurant":"./CafeListAction.do?pageNum=1&cate=맛집" %>">맛집</a></li>
				</ul>
			</div><!-- /.navbar-collapse -->
		</div>
	</nav>
</header>
