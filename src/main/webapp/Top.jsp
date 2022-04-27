<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<link rel="stylesheet" href="css/firstProject.css">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&family=Oswald&family=Roboto:wght@100;400&display=swap"
	rel="stylesheet">
<body>

<%
	//로그아웃 클릭시 파라미터를 통해서 로그아웃인지 여부를 확인
	String logout = request.getParameter("logout");
	
	if(logout != null){
		//아이디에 null값을 넣는다.
		session.setAttribute("id", null);
		//session유지시간을 없앤다.
		session.setMaxInactiveInterval(0);
	}
	
	String id = (String)session.getAttribute("id");
	if(id == null){
		id = "손님";
	}
%>
	<div class="wrap">
		<div class="header">
			<div class="searchArea">
				<form>
					<input type="Search" placeholder="Search"> <span>검색</span>
				</form>
			</div>
			<ul class="nav">
			
			<%
				if(id.equals("손님")){
			%>
				<%=id %> 님 
				<button onclick="location.href='SessionMain.jsp?center=MemberLogin.jsp'">로그인</button>
				<li><a href="SessionMain.jsp?center=MemberJoin.jsp">Account</a></li>
			
			<%	}else{ %>
				<%=id %> 님 
				<button onclick="location.href='SessionMain.jsp?logout=1'">Logout</button>
				<li><a href="SessionMain.jsp?center=MemberList.jsp">Account</a></li>
			<% } %>
			
				
				<li><a href="SessionMain.jsp?center=BoardList.jsp">Notify</a></li>
			<%
				if(id != null && id.equals("admin")){
			%>
					<input type="button" value="회원전체관리(관리자용)" onclick="location.href='SessionMain.jsp?center=AdminCenter.jsp'">
			<%
				}
			%>
			</ul>
		</div>
		<ul class="nav1">
			<h1 align="left"><a href="SessionMain.jsp">배송 대행지</a></h1>
			<li><a href="#">이용가이드</a></li>
			<li><a href="SessionMain.jsp?center=OrderWriteForm.jsp">구매대행</a></li>
			<li><a href="SessionMain.jsp?center=OrderWriteForm.jsp">배송대행</a></li>
			<li><a href="#">보관상품</a></li>
			<li><a href="#">해외브랜드샵</a></li>
			<li><a href="SessionMain.jsp?center=BoardList.jsp">고객센터</a></li>
		</ul>
	</div>
		</div>
		</div>
	</div>
</body>
</html>