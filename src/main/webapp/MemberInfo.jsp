<%@page import="model.MemberBean"%>
<%@page import="model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<body>
	<!-- memberlist에서 넘긴 id를 받아준다, 데이터베이스에서 한회원의 정보를 가져온다. table태그를 이용하여 화면에 회원의 정보를 출력 -->
<%
	String id = request.getParameter("id");	//memberlist id를 받아준다

	MemberDAO mdao = new MemberDAO();
	MemberBean mbean = mdao.oneSelectMember(id);	//해당하는 id의 회원정보를 리턴
%>
	<center>
	<h2> 회원 정보 보기</h2>
		<table width="400" border="1">
		<tr height="50">
			<td align="center" width="150">아이디</td>
			<td width="250"> <%=mbean.getId() %></td>
		</tr>
		<tr height="50">
			<td align="center" width="150">이름</td>
			<td width="250"><%=mbean.getName() %></td>
		</tr>
		<tr height="50">
			<td align="center" width="150">이메일</td>
			<td width="250"><%=mbean.getEmail() %></td>
		</tr>
		<tr height="50">
			<td align="center" width="150">전화번호</td>
			<td width="250"><%=mbean.getPhone() %></td>
		</tr>
		<tr height="50">
			<td align="center" colspan="2">
			<button onclick="location.href='SessionMain.jsp?center=MemberUpdateForm.jsp?id=<%=mbean.getId()%>'">회원수정</button>
			<button onclick="location.href='SessionMain.jsp?center=MemberDeleterForm.jsp?id=<%=mbean.getId()%>'">회원삭제</button>
			<button onclick="location.href='SessionMain.jsp?center=MemberList.jsp'">목록보기</button>
			<button onclick="location.href='SessionMain.jsp?center=MemberJoin.jsp'">회원가입</button>
			</td>
		</tr>
		</table>
	</center>
</body>
</html>