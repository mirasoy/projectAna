<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="../includes/header.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>환영합니다</title>
</head>
	<body>
		<table border="1" width="500px">
			<tr>
				<td>
				<label>	<%=userLastName %><%=userFstName %>님 환영합니다. </label>
				<p>오늘은 우리나라의  어느 곳을 여행하고 싶으신가요?</p>
				<br>
				<a href="../acm/list">숙소 검색 홈으로 </a>
				<!-- <a href="logout">로그아웃하기</a> -->
				</td>
			</tr>
		</table>
	</body>
<%@include file="../includes/footer.jsp"%>
</html>