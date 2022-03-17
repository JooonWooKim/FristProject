<%@page import="model.OrderBean"%>
<%@page import="model.OrderDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<body>
<%
		int num = Integer.parseInt(request.getParameter("num").trim());	//공백제거후 정수형으로 변환
		
		//데이터 베이스 접근
		OrderDAO odao = new OrderDAO();
		//boardbean타입으로 하나의 게시글을 리턴
		OrderBean bean = odao.getOneOrder(num);
		
%>
<center>
	<h2>게시글 보기</h2>
	<table width="600" border="1" bgcolor="skyblue">
		<tr height="40">
			<td align="center" width="120">글 번호</td>
			<td align="center" width="180"><%=bean.getNum() %>
			<td align="center" width="120">주문번호</td>
			<td align="center" width="180"><%=bean.getOrdernum() %></td>
		</tr>
		<tr height="40">
			<td align="center" width="120">브랜드</td>
			<td align="center" width="180"><%=bean.getBrand() %>
			<td align="center" width="120">옵션/색상</td>
			<td align="center" width="180"><%=bean.getOption_()%></td>
		</tr>
		<tr height="40">
			<td align="center" width="120">수량</td>
			<td align="center" width="180"><%=bean.getPieces() %></td>
			<td align="center" width="120">단가</td>
			<td align="center" width="180"><%=bean.getDoller() %></td>
		</tr>
		<tr height="40">
			<td align="center" width="120">영문상품명</td>
			<td align="center" width="180"><%=bean.getEngname() %></td>
		</tr>
		<tr height="40">
			<td align="center" width="120">url</td>
			<td align="center" width="180"><%=bean.getUrl() %></td>
			<td align="center" width="120">트래킹번호</td>
			<td align="center" width="180"><%=bean.getTracking() %></td>
		</tr>
		<tr height="40">
			<td align="center" colspan="4">
				<input type="button" value="수정하기" onclick="location.href='OrderUpdateForm.jsp?num=<%=bean.getNum()%>'">
				<input type="button" value="삭제하기" onclick="location.href='OrderDeleteForm.jsp?num=<%=bean.getNum()%>'">
				<input type="button" value="목록보기" onclick="location.href='OrderList.jsp'">
			</td>
		</tr>
	</table>
</center>
</body>
</html>