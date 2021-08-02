<%@ page contentType="text/html; charset=utf-8"%>

<section class="home" id="home" data-stellar-background-ratio="0.4"></section>
<section class="contact" id="login">
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
						<form action="./LoginAction.me" class="form-group" role="form">
							<label for="email">이메일 : </label> 
							<input type="email" class="form-control" id="email" name="email" placeholder="이메일을 입력해주세요">
							
							<label for="password1">비밀번호 : </label> 
							<input type="password" class="form-control" id="password1" name="password1" placeholder="비밀번호를 입력해주세요">
                            
                            <div style="display:flex; justify-content: center;">
                               	<input type="button" onclick="location.href='signUpForm.jsp'" class="btn btn-main btn-lg" value="회원가입하기">
                                <input type="submit" class="btn btn-main btn-lg" value="로그인">
                            </div>
						</form>
					</div>
				</div>
			</div>
		</section>