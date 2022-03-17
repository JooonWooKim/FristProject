<%@page import="model.MemberDAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<body>

<%
	request.setCharacterEncoding("UTF-8");
	
%>
	<!--  useBean을 이용하여 한꺼번에 데이터를 받아옴 -->
	<jsp:useBean id="mbean" class="model.MemberBean">
		<jsp:setProperty name="mbean" property="*" /> <!-- 맵핑시키세요 -->
	</jsp:useBean>
<%
	//데이터 베이스 클래스 객체 생성
	MemberDAO mdao = new MemberDAO();
	mdao.insertMember(mbean);
	
	response.sendRedirect("SessionMain.jsp");
	//response.sendRedirect("BoardList.jsp");
%>
	
	
	

</body>
</html>