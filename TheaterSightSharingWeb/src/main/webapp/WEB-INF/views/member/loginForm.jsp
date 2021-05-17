<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
	<script>
	 	const onClickGoogleLogin = (e) => {
	    	//구글 인증 서버로 인증코드 발급 요청
	 		window.location.replace("https://accounts.google.com/o/oauth2/v2/auth?
	        client_id=49852787284-es4kariitf8cnigae842omhkc0qufc32.apps.googleusercontent.com
	        &redirect_uri=http:${cp}/member/login/google/auth
	        &response_type=code
	        &scope=email%20profile%20openid
	        &access_type=offline")
	 	}
		
		const googleLoginBtn = document.getElementById("googleLoginBtn");
		googleLoginBtn.addEventListener("click", onClickGoogleLogin);
	    
	</script>
</head>
<body>
	<!-- <form action="">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password"></td>
			</tr>
			<tr>
				<td colspan="2">
				</td>
			</tr>
		</table>
		
	</form> -->
	<fieldset>
		<label>로그인</label><br>
		<div id="googleLoginBtn" style="cursor: pointer">
			<!-- <img id="googleLoginImg" src=""> -->
			구글로그인
		</div>
	</fieldset>
</body>
</html>