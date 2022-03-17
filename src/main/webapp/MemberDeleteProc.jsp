<%@page import="model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<body>
<%
	request.setCharacterEncoding("UTF-8");
%>
	<jsp:useBean id="mbean" class="model.MemberBean">
		<jsp:setProperty name="mbean" property="*"/>
	</jsp:useBean>
<%

	MemberDAO mdao = new MemberDAO();
	//스트링타입으로 저장되어 있는 패스워드를 가져오도록한다.(데이터베이스에서 가져온 패스값이 저장된다)
	String password = mdao.getPassword(mbean.getId());

	//수정하기 위해서 작성한 패스워드값과 기존 데이터 베이스에서 가져온 패스워드값을 비교하는 문장
	if(mbean.getPassword1().equals(password)){
		//기존 패스와 데이터베이스 패스가 같다면 member테이블을 수정한다

		//MemberDAO클래스의 회원수정 메소드를 호출
		mdao.deleteMember(mbean.getId());
		response.sendRedirect("SessionMain.jsp");
		
			
	}else{
%>
	<script type="text/javascript">
		alert("패스워드가 틀립니다. 다시 확인해주세요");
		history.go(-1);
	</script>
<%
	}
%>
</body>
</html>