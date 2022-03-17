<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/firstProject.css">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&family=Oswald&family=Roboto:wght@100;400&display=swap"
	rel="stylesheet">
<title>MemberJoin</title>
</head>
<body>
<script>

	var id = document.forms[0].id.value;
	var password1 = document.forms[0].password1.value;
	var password2 = document.forms[0].password2.value;
	var name = document.forms[0].name.value;
	var email = document.forms[0].email.value;
	var phone = document.forms[0].phone.value;

	function formCheck(){
		if(id == null || id == ""){
			alert('id를 입력하세요.');
			document.forms[0].id.focus();
			return false;
		}
		
		if(password1 == null || password1 == ""){
			alert('password를 입력하세요.');
			document.forms[0].password1.focus();
			return false;
		}
		if(password2 == password1){
			alert('password가 틀립니다.');
			document.forms[0].passwrod2.focus();
			return false;
		}
}
</script>
	<center>
		<h2>회원 가입</h2>
		<form action="MemberJoinProc.jsp" method="post" onsubmit="return formCheck();">
			<table width="1280" border="1">
				<tr height="50">
					<td width="300" align="center">아이디</td>
					<td width="980" align="center"><input type="text" name="id" size="40" placeholder="아이디를 입력하세요."></td>
				<tr height="50">
					<td width="150" align="center">비밀번호</td>
					<td width="350" align="center"><input type="password" name="password1" size="40" placeholder="비밀번호는 영문과 숫자만 넣어주세요.">
					</td>
				<tr height="50">
					<td width="150" align="center">비밀번호 확인</td>
					<td width="350" align="center"><input type="password" name="password2" size="40"></td>
				<tr height="50">
					<td width="150" align="center">이름</td>
					<td width="350" align="center"><input type="text" name="name"
						size="40"></td>
				<tr height="50">
					<td width="150" align="center">이메일</td>
					<td width="350" align="center"><input type="email"
						name="email" size="40"></td>
				<tr height="50">
					<td width="150" align="center">전화번호</td>
					<td width="350" align="center"><input type="text" name="phone"
						size="40"></td>
				<tr height="50">
					<td align="center" colspan="2"><input type="submit"
						value="회원 가입"> <input type="reset" value="취소"></td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>