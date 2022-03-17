<%@page import="model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	%>
	<!-- 데이터를 한번에 받아오는 빈클래스를 사용하도록 -->
	<jsp:useBean id="boardbean" class="model.BoardBean">
		<jsp:setProperty name="boardbean" property="*" />
	</jsp:useBean>
	
	<%
		BoardDAO bdao = new BoardDAO();
		bdao.reWriteBoard(boardbean);
		
		response.sendRedirect("SessionMain.jsp");
	%>
</body>
</html>