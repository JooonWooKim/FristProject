<%@page import="model.OrderBean"%>
<%@page import="model.OrderDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<body>
	<%
		OrderDAO odao = new OrderDAO();
	
		int num  = Integer.parseInt(request.getParameter("num"));
		//하나의 게시글을 리턴
		OrderBean bean = odao.getOneUpdateOrder(num);
	%>
<center>
	<h2>게시글 삭제</h2>
	<form action="OrderDeleteProc.jsp" method="post">
		<table width="600" border="1" bgcolor="skyblue">
			<tr height="40">
				<td width="120" align="center">주문번호</td>
				<td align="left" colsapn="3"><%= bean.getOrdernum() %></td>
			</tr>
			<tr height="40">
				<td width="120" align="center">주문번호</td>
				<td align="left" colsapn="3"><input type="text" name="ordernum" size="60"></td>
			</tr>
			<tr height="40">
				<td align="center" colspan="4">
				<input type="hidden" name="num" value="<%=num%>">
				<input type="submit" value="글삭제"> &nbsp;&nbsp;
				<input type="button" value="목록보기" onclick="location.href='SessionMain.jsp?center=OrderList.jsp'"> &nbsp;&nbsp;
			</tr>
		</table>
	</form>
</center>
</body>
</html>