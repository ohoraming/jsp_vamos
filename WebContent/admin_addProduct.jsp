<%@ page contentType="text/html; charset=utf-8"%>
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
		
		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
		<script src="./resources/js/jquery.min.js"></script>
		
		<!-- sun editor -->
		<link href="https://cdn.jsdelivr.net/npm/suneditor@latest/dist/css/suneditor.min.css" rel="stylesheet">
		<script src="https://cdn.jsdelivr.net/npm/suneditor@latest/dist/suneditor.min.js"></script>
		<!-- languages (Basic Language: English/en) -->
		<script src="https://cdn.jsdelivr.net/npm/suneditor@latest/src/lang/ko.js"></script>
		
		<script type="text/javascript">
			function checkForm() 
			{
				if (!document.newProduct.id.value) 
				{
					alert("상품id를 입력하세요");
					return false;
				}
				if (!document.newProduct.name.value) 
				{
					alert("상품 이름을 입력하세요");
					return false;
				}
				if (!document.newProduct.pic1.value) 
				{
					alert("사진을 첨부하세요");
					return false;
				}
			}
		</script>
	</head>
	<body data-spy="scroll" data-target=".main-nav">

		<%@ include file="menu.jsp" %>
		<section class="home" id="home" data-stellar-background-ratio="0.4"></section>
		
        <section class="check">
            <div class="jumbotron">
                <div class="container">
                    <h2>관리자용 상품 등록 페이지입니다</h2>
                </div>
            </div>
        </section>

        <section>
			<form name="newProduct" action="./ListRegisterAction.do" method="post" 
			onsubmit="return checkForm()" enctype="multipart/form-data">
				<div class="container" style="display:flex; justify-content: center;">
					<div class="col-sm-8" style="transform: translateX(25%);">
						
						<div class="form-group">
							<label for="id">상품 아이디</label>
							<input type="text" id="id" name="id" style="width: 100%;" placeholder="숫자만 입력하세요"><br>
						</div>
						<div class="form-group">
							<label for="name">상품 이름</label>
							<input type="text" id="name" name="name" style="width: 100%;"><br>
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
						<div class="form-group">
							<label>상품 분류</label>
							<div>
								<label for="cafe">카페</label>
								<input type="radio" name="cate" id="cafe" value="카페" checked>
								<label for="accomodation"> 숙소</label>
								<input type="radio" name="cate" id="accomodation" value="숙소">
								<label for="restaurant"> 맛집</label>
								<input type="radio" name="cate" id="restaurant" value="맛집">
							</div>
						</div>
						<div class="form-group">
							<label for="region">상품 지역</label>
							<input type="text" id="region" name="region">
						</div>	
						<div class="form-group">
							<label for="addr">상품의 주소</label>
							<input type="text" id="addr" name="addr" placeholder="주소 작성" style="width: 100%;"> 
						</div>
						<div class="form-group">
							<label for="phone">상품의 전화번호</label>
							<input type="text" id="phone" name="phone" placeholder="전화번호 작성" style="width: 100%;"> 
						</div>
						<div class="form-group">
							<label for="unitPrice">예약금</label>
							<input type="text" id="unitPrice" name="unitPrice" style="width: 95%;">원
						</div>
						<div class="form-group">
							<label for="descrip">상품 설명</label><br>
							<textarea name="descrip" rows="20" id="descrip" style="width: 100%;"></textarea>
						</div>
						
						<div class="form-group" style="text-align: center;">
							<input type="reset" class="btn btn-main btn-lg" value="취소하기">
							<input type="submit" class="btn btn-main btn-lg" value="새 상품 등록 하기">
						</div>	
					
					</div>
					<div class="col-sm-4"></div>
				</div>
			</form>
        </section>
        
		<!--여기까지 본문 작성하면 됨! -->
		<%@ include file="footer.jsp" %>
		<script>
    	const editor = SUNEDITOR.create((document.getElementById('descrip') || 'descrip'),{
	        // All of the plugins are loaded in the "window.SUNEDITOR" object in dist/suneditor.min.js file
	        // Insert options
	        // Language global object (default: en)
	        buttonList: [
	            ['undo', 'redo'],
	            ['font', 'fontSize', 'formatBlock'],
	            ['paragraphStyle', 'blockquote'],
	            ['bold', 'underline', 'italic', 'strike', 'subscript', 'superscript'],
	            ['fontColor', 'hiliteColor', 'textStyle'],
	            ['removeFormat'],
	            '/', // Line break
	            ['outdent', 'indent'],
	            ['align', 'horizontalRule', 'list', 'lineHeight'],
	            ['table', 'link', 'image', 'video', 'audio' /** ,'math' */], // You must add the 'katex' library at options to use the 'math' plugin.
	            /** ['imageGallery'] */ // You must add the "imageGalleryUrl".
	            ['fullScreen', 'showBlocks', 'codeView'],
	            ['preview', 'print'],
	            ['save', 'template']
	        ],
	        lang: SUNEDITOR_LANG['ko'],
	        placeholder:"간단한 설명 작성"
	    });
	    </script>
	</body>
</html>