<%@page import="model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
	%>
<!-- 게시글 작성한 데이터를 한번에 읽어들임 -->
<jsp:useBean id="boardbean" class="model.BoardBean">
	<jsp:setProperty name="boardbean" property="*" />
</jsp:useBean>

<%
	//데이터 베이스쪽으로 빈클래스를 넘겨준다.
	BoardDAO bdao = new BoardDAO();
	
	//데이터 저장 메소드를 호출한다.
	bdao.insertBoard(boardbean);
	
	//게시글 저장후 전체 게시글보기
	response.sendRedirect("SessionMain.jsp");

%>
</body>
</html>