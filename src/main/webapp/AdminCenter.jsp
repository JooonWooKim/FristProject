<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
	<ul>
		<div class = "amount">
			<li>
				<div>
					<!-- # == 배송대행 신청 사이트 -->
					<a href="SessionMain.jsp?center=MemberList.jsp">
					<div class="contents1">회원 정보 관리</div>
					<div class="result">회원 정보 관리</div>
					</a>
				</div>
			</li>
			<li>
				<div>
					<!-- # == 구매대행 신청 사이트 -->
					<a href="SessionMain.jsp?center=OrderList.jsp">
						<div class="contents1">배송 주문 관리</div>
						<div class="result">배송 대행 관리</div>
					</a>
				</div>
			</li>
			<li>
				<div>
					<a href="SessionMain.jsp?center=BoardList.jsp">
					<div class="contents1">게시판 관리</div>
					<div class="result">게시판 관리</div>
					</a>
				</div>
			</li>
			<li>
				<div>
					<a href="#">
					<div class="contents1">이용가이드</div>
					<div class="result">이용가이드페이지</div>
					</a>  
				</div>
			</li>
		</ul>
		<!-- amount end -->
		<div class="main_text0">
			<ul class="icons">
				<li>
					<div class="iconsImg">
						<img src="images/eng.jpg">
					</div>
					<div class="contents1_bold">영국</div>
					<div class="contents1">배송대행지</div>
					<div class="more"><a href="#">more</a></div>
				</li>
                    <li>
                        <div class="iconsImg">
                            <img src="images/amr.jpg">
                        </div>
                        <div class="contents1_bold">미국</div>
                        <div class="contents1">배송대행지</div>
                        <div class="more"><a href="#">more</a></div>
                    </li>
                    <li>
                        <div class="iconsImg">
                            <img src="images/fra.jpg">
                        </div>
                            <div class="contents1_bold">프랑스</div>
                            <div class="contents1">배송대행지</div>
                            <div class="more"><a href="#">more</a></div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
</body>
</html>