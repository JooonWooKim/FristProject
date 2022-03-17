<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<body>
	<center>
	<h2>배송 대행 요청</h2>
	
	<form action="OrderWriteProc.jsp" method="post">
		<table width="600" border="1" bordercolor="grey" bgcolor="skyblue">
			<tr height="40">
				<td align="center" width="150">주문번호</td>
				<td width="450"><input type="text" name="ordernum" size="60"></td>
			</tr>
			<tr height="40">
				<td align="center" width="150">브랜드</td>
				<td width="450"><input type="text" name="brand" size="60"></td>
			</tr>
			<tr height="40">
				<td align="center" width="150">사이즈</td>
				<td width="450"><input type="text" name="size" size="60"></td>
			</tr>
			<tr height="40">
				<td align="center" width="150">수량</td>
				<td width="450"><input type="text" name="pieces" size="60"></td>
			</tr>
			<tr height="40">
				<td align="center" width="150">단가(달러)</td>
				<td width="450"><input type="text" name="doller" size="60"></td>
			</tr> 
			<tr height="40">
				<td align="center" width="150">영문 상품명</td>
				<td width="450"><input type="text" name="engname" size="60"></td>
			</tr>
			<tr height="40">
				<td align="center" width="150">url</td>
				<td width="450"><input type="text" name="url" size="60"></td>
			</tr>  
			<tr height="40">
				<td align="center" width="150">트래킹번호</td>
				<td width="450"><input type="text" name="tracking" size="60"></td>
			</tr> 
			<tr height="40">
				<td align="center" colspan="2">
					<input type="submit" value="글쓰기">&nbsp;&nbsp;
					<input type="reset" value="다시작성">&nbsp;&nbsp;
					<button onclick="location.href='SessionMain.jsp?center=OrderList.jsp'">전체 게시글보기</button>
				</td>
			</tr>
		</table>
	</form>
</center>
</body>
</html>