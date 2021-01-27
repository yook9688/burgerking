<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="co.kr.vo.MemberVO" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../header.jsp"></jsp:include>
<style>
 	#content {clear: both; width: 100%; height: 100%; }
    .con_wrap {width: 100%; height: 100%; padding: 50px 0 45px 0;}
    .login_con {max-width: 1144px; height: 500px; padding: 0 20px; margin: 40px auto; }
    .login_box {width: 1000px; margin: 0 auto; position: relative;}
    .welcome_box {display:block; width: 500px; height: 400px; }
    .welcome_box p {font-size: 40px; text-align: center; margin:  20px 0; vertical-align: middle; font-weight: bold; color: #e22219;}
    .welcome_box P:first-child {padding-top: 100px; color:#000;}
    .login_form_box {display: block; width: 500px; height: 400px; border-left: 1px solid #aaa; position: absolute; top: 0; right: 0;}
    .login_form_box form { width: 500px; height: 400px;}
    .login_form_box form input {display: block; width: 300px; height: 60px; margin: 20px auto; font-size: 20px;}
    .login_form_box form input::placeholder {font-size: 20px; text-indent: 10px;}
    .login_tit {width: 100%; text-align: center; margin: 0 auto; font-size: 30px;}
    .login_btn_box {width: 500px; text-align: center;}
    .login_btn_box button {display: inline-block; width: 200px; height: 68px; margin: 20px; border: 0; font-size: 20px; cursor: pointer; }
    .login_btn {background: url("../resources/img/common/bg_btn01_m_red.a7587241.png") no-repeat;}
    .register_btn {background: url("../resources/img/common/bg_btn01_m.f1fea850.png") no-repeat; color: #fff;}
    .kakaoLogin_box {width: 500px;}
    .kakaoLogin_btn {width: 300px; height: 45px; border:0; padding: 0; margin: 0 auto; background: url("../resources/img/common/kakao_login_medium_wide.png") no-repeat;}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		<%
		MemberVO member = (MemberVO) session.getAttribute("member");
		if(member != null) {
		%>
		
			alert("이미 로그인 되어있습니다.")
	   		window.history.back();
		<% } %>
		$(".login_btn").on("click", function() {
			if($("#userId").val()=="" || $("#userId").val() == null ){
				alert("아이디를 입력해주세요.");
				$("#userId").focus();
				return false;
			}
			if($("#userPwd").val()=="" || $("#userPwd").val()== null ){
				alert("비밀번호를 입력해주세요.");
				$("#userPwd").focus();
				return false;
			}
			if($("#userId").val()!="" && $("#userPwd").val()) {
				$(".loginForm").submit()
			}
		});
		
		$(".register_btn").on("click", function() {
			location.href = "/member/register";
		});
	});	
	
</script>

	<div id="content">
		<div class="site_locate">
			<div class="locate_box">
				<a href="/">Home</a>
				<span>로그인</span>
			</div>
		</div>
		<div class="con_wrap">
			<div class="login_con">
				<h2 class="login_tit">로그인</h2>
				<div class="login_box">
					<div class="welcome_box">
						<p>WHERE IS TASTE IS KING!</p>
						<p>어서오세요! 버거킹입니다.</p>
					</div>
					<div class="login_form_box">
						<form class="loginForm" method="post" action="/member/login">
							<div>
								<label for="userId"></label>
								<input type="text" id="userId" name="userId" placeholder="아이디">
							</div>
							<div>
								<label for="userPwd"></label> 
								<input type="password" id="userPwd" name="userPwd" placeholder="비밀번호">
							</div>
							<div class="login_btn_box">
								<button class="login_btn" type="button">로그인</button>
								<button class="register_btn" type="button">회원가입</button>
							</div>
							<!-- <div class="kakaoLogin_box">
								<button type="button" class="kakaoLogin_btn"></button>
							</div>
						</form>
						<a href="https://kauth.kakao.com/oauth/authorize?
						client_id=4a83ef19ad127a06d8c4961fad1c1382
						&redirect_uri=http://localhost:8090/kakao/login&response_type=code">로그인</a> -->
						
					</div>
				</div>
			</div>
		</div>
	</div>
<jsp:include page="../footer.jsp"></jsp:include>