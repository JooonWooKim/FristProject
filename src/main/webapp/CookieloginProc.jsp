<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<body>
	
<%
	request.setCharacterEncoding("UTF-8");
	
	//아이디 저장 체크 박스가 체크되었는지 판단여부
	String save = request.getParameter("save");
	//아이디 값을 저장
	String id = request.getParameter("id");
	
	//체크되었는지를 비교 판단
	if(save != null){	//아이디 저장이 눌렸다면,
		Cookie cookie = new Cookie("id", id);//1번째는 String 키값을 적어줌, 해당하는 value값
		//쿠키 유효시간 설정
		cookie.setMaxAge(60*10);//10분간 유효하다.
		
		//사용자에게 쿠키 값을 넘겨준다.
		response.addCookie(cookie);
		
		out.write("쿠키 생성완료");
	}
	
	
%>
	
</body>
</html>