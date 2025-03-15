<%@page import="com.kh.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	Member loginUser = (Member)session.getAttribute("loginUser");
	String alertMsg = (String)session.getAttribute("alertMsg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
<!--
footer -->#footer_footer {
	
}

#form_footer {
	background-color: black;
	width: 1100px;;
	height: 280px;
	margin: auto;
}

/* #table_footer td{
    border: 1px solid white;
} */
#table_footer {
	color: white;
	width: 1000px;
	height: 280px;
	box-sizing: border-box;
	padding: 10px;
	font-size: 14px;
	font-style: normal;
	font-weight: 600;
}

.logo1_footer {
	background-image: url("resources/images/LOGO.jpg");
}

.kakao_footer {
	background-image: url("resources/images/kakao_logo.png");
}

.facebook_footer {
	background-image: url("resources/images/Facebook_logo.png");
}

.instar_footer {
	background-image: url("resources/images/Instar_logo.png");
}

.youtube_footer {
	background-image: url("resources/images/Youtube_logo.png");
}

.logo1_footer {
	width: 100%;
	background-position: center;
	background-repeat: no-repeat;
	background-size: contain;
}

.kakao_footer, .facebook_footer, .instar_footer, .youtube_footer {
	width: 50px;
	background-position: center;
	background-repeat: no-repeat;
	background-size: contain;
}
</style>
</head>
<body>
	<!-- footer -->
	<footer id="footer_footer">
		<form action="" id="form_footer" method="">
			<table id="table_footer" style="text-align: left;">
				<tr>
					<td rowspan="4" style="width: 30%;" class="logo1_footer"></td>

					<td style="width: 15%; height: 30%; padding: 5px;">뷰티톡 소개</td>
					<td style="width: 15%; padding: 5px;">이용 약관</td>
					<td style="width: 15%; padding: 5px;">개인정보처리방침</td>
					<td style="width: 15%; padding: 5px;">고객 지원</td>
					<td style="width: 50px;"></td>
					<td style="width: 50px;"></td>
					<td style="width: 50px;"></td>
					<td style="width: 50px;"></td>
				</tr>
				<tr>
					<td colspan="2" style="height: 25%; padding: 5px;">email:
						beautytalk@abcd.com</td>

					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>

					<td style="height: 25%; padding: 5px;">tel: 02-123-4567</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td colspan="3">© 2025 Brand, Inc. • Privacy • Terms • Sitemap</td>


					<td class="kakao_footer"></td>
					<td class="facebook_footer"></td>
					<td class="instar_footer"></td>
					<td class="youtube_footer"></td>
				</tr>
			</table>
		</form>
	</footer>
</body>
</html>