<%@page import="model.OrderDAO"%>
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
%>

<!-- 게시글 작성한 데이터를 한번에 읽어들임 -->
<jsp:useBean id="orderbean" class="model.OrderBean">
	<jsp:setProperty name="orderbean" property="*" />
</jsp:useBean>

<%
	//데이터 베이스쪽으로 빈클래스를 넘겨준다.
	OrderDAO odao = new OrderDAO();
	
	//데이터 저장 메소드를 호출한다.
	odao.insertOrder(orderbean);
	
	//게시글 저장후 전체 게시글보기
	response.sendRedirect("SessionMain.jsp");
	//response.sendRedirect("BoardList.jsp");

%>
</body>
</html>