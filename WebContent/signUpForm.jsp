<%@ page contentType="text/html; charset=utf-8"%>
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
			function checkForm() 
			{
				if (!document.newMember.name.value) 
				{
					alert("아이디를 입력하세요.");
					return false;
				}
				if (!document.newMember.email.value) 
				{
					alert("이메일을 입력하세요.");
					return false;
				}
				if (!document.newMember.password1.value) 
				{
					alert("비밀번호를 입력하세요.");
					return false;
				}
		
				if (document.newMember.password1.value != document.newMember.password2.value) 
				{
					alert("비밀번호를 동일하게 입력하세요.");
					return false;
				}
			}
		</script>
		
	</head>
	<body data-spy="scroll" data-target=".main-nav">
	
		<%@ include file="menu.jsp" %>
		<section class="home" id="home" data-stellar-background-ratio="0.4"></section>
	
		<!--여기서부터 본문 작성하면 됨! -->
        <section class="contact" id="signup">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="section-title st-center">
							<h3>회원가입</h3>
							<p>더 많은 여행 정보를 받아보세요!</p>
						</div>
					</div>
				</div>
				<div class="row" style="display:flex; justify-content: center;">
					<div class="col-md-4">
						<form action="./MemberRegisterAction.me" class="form-group" name="newMember" onsubmit="return checkForm()">
							<label for="name">이름/별명</label>
							<input type="text" id="name" class="form-control" name="name" placeholder="이름/별명을 입력해주세요">
							<label for="email">이메일 (가입 이후에 변경이 불가합니다)</label> 
							<input type="email" id="email" class="form-control" name="email" placeholder="이메일을 입력해주세요">
							<label for="password">비밀번호</label> 
							<input type="password" id="password1" class="form-control" name="password1" placeholder="비밀번호를 입력해주세요">
	                	    <label for="password">비밀번호 확인</label> 
							<input type="password" id="password2" class="form-control" name="password2" placeholder="비밀번호가 일치하는지 확인해주세요">
							<label for="birth">생일</label>
							<select name="birthmm" id="birth" class="form-control" >
								<option value="">월</option>
								<option value="1"> 1월</option>
								<option value="2"> 2월</option>
								<option value="3"> 3월</option>
								<option value="4"> 4월</option>
								<option value="5"> 5월</option>
								<option value="6"> 6월</option>
								<option value="7"> 7월</option>
								<option value="8"> 8월</option>
								<option value="9"> 9월</option>
								<option value="10">10월</option>
								<option value="11">11월</option>
								<option value="12">12월</option>
							</select>
							<select name="birthdd" id="birth" class="form-control" >
								<option value="">일</option>
								<option value="1">1일</option>
								<option value="2">2일</option>
								<option value="3">3일</option>
								<option value="4">4일</option>
								<option value="5">5일</option>
								<option value="6">6일</option>
								<option value="7">7일</option>
								<option value="8">8일</option>
								<option value="9">9일</option>
								<option value="10">10일</option>
								<option value="11">11일</option>
								<option value="12">12일</option>
								<option value="13">13일</option>
								<option value="14">14일</option>
								<option value="15">15일</option>
								<option value="16">16일</option>
								<option value="17">17일</option>
								<option value="18">18일</option>
								<option value="19">19일</option>
								<option value="20">20일</option>
								<option value="21">21일</option>
								<option value="22">22일</option>
								<option value="23">23일</option>
								<option value="24">24일</option>
								<option value="25">25일</option>
								<option value="26">26일</option>
								<option value="27">27일</option>
								<option value="28">28일</option>
								<option value="29">29일</option>
								<option value="30">30일</option>
								<option value="31">31일</option>
							</select><br>
							<label for="phonenumber">휴대 전화 번호</label>
							<input type="text" id="phonenumber" name="phonenumber" class="form-control" placeholder="-없이 숫자만 입력하세요">
							<div>
								<input type="button" href="./signUpCancel.jsp" class="btn btn-main btn-lg" value="취소하기">
								<input type="submit" class="btn btn-main btn-lg" value="가입하기">
							</div>
						</form>
					</div>
				</div>
			</div>
		</section>
</body>
</html>