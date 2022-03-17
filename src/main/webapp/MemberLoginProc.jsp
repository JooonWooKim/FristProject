<%@page import="model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String password = request.getParameter("password");
	//회원 아이디와 패스워드가 일치하는지 비교
	MemberDAO mdao = new MemberDAO();
	
	//해당 회원이 있는지 여부를 숫자로 표현
	int result = mdao.getMember(id, password);
	
	if(result==0){
		%>
		<script>
			alert("회원 아이디 또는 패스워드가 틀립니다.");
			location.href='SessionMain.jsp?center=MemberLogin.jsp';
		</script>
		<%
	}else{
		//로그인 처리가 되었다면
		session.setAttribute("id", id);
		response.sendRedirect("SessionMain.jsp");
	}
%>
</body>
</html>