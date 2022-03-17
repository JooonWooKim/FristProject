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
	String center = request.getParameter("center");

	if(center == null){
		center = "Center.jsp";
	}
%>
	<center>
	<table border="1" width = "800">
		<!-- Top -->
		<tr height="150">
 			<td align="center" colspan="2">
 				<jsp:include page="Top.jsp" />		
			</td>
		</tr>
		<tr height="400">
			 <!-- Center -->	
			 <td align="center" width = "600"><jsp:include page ="<%=center %>" /></td>
		</tr>
	</table>
</center>
</body>
</html>