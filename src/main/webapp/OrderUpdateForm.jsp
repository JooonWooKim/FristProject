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
	<h2>게시글 수정</h2>
<%
	//해당 게시글번호를 통하여 게시글을 리턴
	int num = Integer.parseInt(request.getParameter("num").trim());

	//하나의 게시글의 대한 정보를 리턴
	OrderDAO dbao = new OrderDAO();
	OrderBean bean = dbao.getOneUpdateOrder(num);
%>
<form action="OrderUpdateProc.jsp" method="post">
	<table width="600" border="1" bgcolor="skyblue">
		<tr height="40">
			<td width="120" align="center">주문번호</td>
			<td width="180"> &nbsp; <input type="text" name="ordernum" value="<%=bean.getOrdernum() %>" size="60"></td>			
		</tr>
		<tr height="40">
			<td width="120" align="center">브랜드</td>
			<td width="180"> &nbsp; <input type="text" name="brand" value="<%=bean.getBrand() %>" size="60"></td>			
			<td width="120" align="center">옵션/색상</td>
			<td width="180"> &nbsp; <input type="text" name="option_" value="<%=bean.getOption_() %>" size="60"></td>			
		</tr>
		<tr height="40">
			<td width="120" align="center">수량</td>
			<td width="180"> &nbsp; <input type="text" name="pieces" value="<%=bean.getPieces() %>" size="60"></td>			
			<td width="120" align="center">단가</td>
			<td width="180"> &nbsp; <input type="text" name="doller" value="<%=bean.getDoller() %>" size="60"></td>			
		</tr>
		<tr height="40">
			<td width="120" align="center">영문상품명</td>
			<td width="180"> &nbsp; <input type="text" name="engname" value="<%=bean.getEngname() %>" size="60"></td>					
		</tr>
		<tr height="40">
			<td width="120" align="center">url</td>
			<td width="180"> &nbsp; <input type="text" name="url" value="<%=bean.getUrl() %>" size="60"></td>			
			<td width="120" align="center">트래킹번호</td>
			<td width="180"> &nbsp; <input type="text" name="tracking" value="<%=bean.getUrl() %>" size="60"></td>			
		</tr>
		<tr height="40">
			<td colspan="4" align="center">
			<input type="hidden" name="num" value="<%=bean.getNum() %>">
			<input type="submit" value="글수정">&nbsp; &nbsp;
			<input type="button" onclick="location.href='BoardList.jsp'" value="전체글보기"></td>		
		</tr>
	</table>
</form>
</center>
</body>
</html>
</body>
</html>