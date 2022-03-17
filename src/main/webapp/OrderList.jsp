<%@page import="java.util.Vector"%>
<%@page import="model.OrderBean"%>
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
	//전체 게시글의 내용을 jsp쪽으로 갖고와야 한다.
	OrderDAO odao = new OrderDAO();

	//전체 게시글을 리턴 받아주는 메소드
	Vector<OrderBean> vec = odao.getAllOrder();

%>
	<center>
		<h2>전체 주문 보기</h2>
		<table width="700" border="1" bgcolor="skyblue">
			<tr height="40">
				<td width="50" align="center">번호</td>
				<td width="320" align="center">주문번호</td>
				<td width="100" align="center">브랜드</td>
				<td width="150" align="center">옵션/색상</td>
				<td width="50" align="center">사이즈</td>
				<td width="50" align="center">수량</td>
				<td width="50" align="center">단가</td>
				<td width="50" align="center">영문상품명</td>
				<td width="50" align="center">url</td>
				<td width="50" align="center">트래킹번호</td>
			</tr>
<%
	for(int i=0; i<vec.size(); i++){
		OrderBean bean = vec.get(i);	//벡터에 저장되어있는 빈클래스를 하나씩 추출
%>
			<tr height="40">
				<td width="50" align="center"><%=i+1 %></td>
				<td width="320" align="left">
				<a href="OrderInfo.jsp?num=<%=bean.getNum() %>">
				<%=bean.getOrdernum() %>	</a>	</td>
				<td width="100" align="center"><%=bean.getBrand() %></td>
				<td width="150" align="center"><%=bean.getOption_() %></td>
				<td width="50" align="center"><%=bean.getSize() %></td>
				<td width="50" align="center"><%=bean.getPieces() %></td>
				<td width="50" align="center"><%=bean.getDoller() %></td>
				<td width="50" align="center"><%=bean.getEngname() %></td>
				<td width="50" align="center"><%=bean.getUrl() %></td>
				<td width="50" align="center"><%=bean.getTracking() %></td>
			</tr>
<%
}		
%>
		<tr height="40">
			<td align="center" colspan="5">
			<input type="button" value="글쓰기" onclick="location.href='SessionMain.jsp?center=OrderWriteForm.jsp'">
			</td>
		</tr>
		</table>
	</center>
</body>
</html>