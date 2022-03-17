<%@page import="model.OrderDAO"%>
<%@page import="model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<body>
<%
		String ordernum = request.getParameter("ordernum");
		int num = Integer.parseInt(request.getParameter("num"));
		
		//데이터베이스연결
		OrderDAO odao = new OrderDAO();
		String password = odao.getOrdernum(num);
		
		//기존 패스워드값과 delete form에서 작성한 패스워드를 비교
		if(ordernum.equals(ordernum)){
				
			//패스워드가 둘다 같다면
			odao.deleteorder(num);
			
			response.sendRedirect("SessionMain.jsp");
		}else{
%>
<script>
	alert("주문번호가 틀려서 삭제 할수없습니다. 패스워드를 확인해주세요.");
	history.go(-1);
</script>	
<% 			
		}
	%>
</body>
</html>