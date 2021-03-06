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
					alert("???????????? ???????????????.");
					return false;
				}
				if (!document.newMember.email.value) 
				{
					alert("???????????? ???????????????.");
					return false;
				}
				if (!document.newMember.password1.value) 
				{
					alert("??????????????? ???????????????.");
					return false;
				}
		
				if (document.newMember.password1.value != document.newMember.password2.value) 
				{
					alert("??????????????? ???????????? ???????????????.");
					return false;
				}
			}
		</script>
		
	</head>
	<body data-spy="scroll" data-target=".main-nav">
	
		<%@ include file="menu.jsp" %>
		<section class="home" id="home" data-stellar-background-ratio="0.4"></section>
	
		<!--??????????????? ?????? ???????????? ???! -->
        <section class="contact" id="signup">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="section-title st-center">
							<h3>????????????</h3>
							<p>??? ?????? ?????? ????????? ???????????????!</p>
						</div>
					</div>
				</div>
				<div class="row" style="display:flex; justify-content: center;">
					<div class="col-md-4">
						<form action="./MemberRegisterAction.me" class="form-group" name="newMember" onsubmit="return checkForm()">
							<label for="name">??????/??????</label>
							<input type="text" id="name" class="form-control" name="name" placeholder="??????/????????? ??????????????????">
							<label for="email">????????? (?????? ????????? ????????? ???????????????)</label> 
							<input type="email" id="email" class="form-control" name="email" placeholder="???????????? ??????????????????">
							<label for="password">????????????</label> 
							<input type="password" id="password1" class="form-control" name="password1" placeholder="??????????????? ??????????????????">
	                	    <label for="password">???????????? ??????</label> 
							<input type="password" id="password2" class="form-control" name="password2" placeholder="??????????????? ??????????????? ??????????????????">
							<label for="birth">??????</label>
							<select name="birthmm" id="birth" class="form-control" >
								<option value="">???</option>
								<option value="1"> 1???</option>
								<option value="2"> 2???</option>
								<option value="3"> 3???</option>
								<option value="4"> 4???</option>
								<option value="5"> 5???</option>
								<option value="6"> 6???</option>
								<option value="7"> 7???</option>
								<option value="8"> 8???</option>
								<option value="9"> 9???</option>
								<option value="10">10???</option>
								<option value="11">11???</option>
								<option value="12">12???</option>
							</select>
							<select name="birthdd" id="birth" class="form-control" >
								<option value="">???</option>
								<option value="1">1???</option>
								<option value="2">2???</option>
								<option value="3">3???</option>
								<option value="4">4???</option>
								<option value="5">5???</option>
								<option value="6">6???</option>
								<option value="7">7???</option>
								<option value="8">8???</option>
								<option value="9">9???</option>
								<option value="10">10???</option>
								<option value="11">11???</option>
								<option value="12">12???</option>
								<option value="13">13???</option>
								<option value="14">14???</option>
								<option value="15">15???</option>
								<option value="16">16???</option>
								<option value="17">17???</option>
								<option value="18">18???</option>
								<option value="19">19???</option>
								<option value="20">20???</option>
								<option value="21">21???</option>
								<option value="22">22???</option>
								<option value="23">23???</option>
								<option value="24">24???</option>
								<option value="25">25???</option>
								<option value="26">26???</option>
								<option value="27">27???</option>
								<option value="28">28???</option>
								<option value="29">29???</option>
								<option value="30">30???</option>
								<option value="31">31???</option>
							</select><br>
							<label for="phonenumber">?????? ?????? ??????</label>
							<input type="text" id="phonenumber" name="phonenumber" class="form-control" placeholder="-?????? ????????? ???????????????">
							<div>
								<input type="button" href="./signUpCancel.jsp" class="btn btn-main btn-lg" value="????????????">
								<input type="submit" class="btn btn-main btn-lg" value="????????????">
							</div>
						</form>
					</div>
				</div>
			</div>
		</section>
</body>
</html>