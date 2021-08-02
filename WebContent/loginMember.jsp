<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="head.jsp" %>
</head>
	<body data-spy="scroll" data-target=".main-nav">
		<%@ include file="menu.jsp" %>
        <section class="check">
            <div class="jumbotron">
                <div class="container">
                    <h2>로그인 해주세요</h2> 
                </div>
            </div>
        </section>
        <section class="contact" id="signup">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="section-title st-center">
							<h3>로그인</h3>
						</div>
					</div>
				</div>
				<div class="row" style="display:flex; justify-content: center;">
					<div class="col-md-4">
						<form action="welcome.jsp" method="POST" class="form-group" role="form">
							<label for="email">이메일 : </label> 
							<input type="email" class="form-control" id="email" name="email" placeholder="이메일을 입력해주세요">
							<label for="password">비밀번호 : </label> 
							<input type="password" class="form-control" id="password" name="password" placeholder="비밀번호를 입력해주세요">
                            <div style="display:flex; justify-content: center;">
                                <input type="submit" class="btn btn-main btn-lg" value="로그인">
                            </div>
						</form>
					</div>
				</div>
			</div>
		</section>
</body>
</html>