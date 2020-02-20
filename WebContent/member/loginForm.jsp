<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>loginForm</title>
<style>
	
	table{
		width : 280px;
		height : 280px;
		margin-top : 100px;
	}
	
	#footer{
		float : center;
	}	
	
</style>
</head>
<body>
<!-- 로그인 링크 클릭 시 loginCheck.jsp 페이지 호출하여 로그인 처리 -->
	<form action="<%=request.getContextPath()%>/member/loginCheck.jsp" method="POST">
	<center>
		<table border = 1>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="mem_id" value="" /></td>
			</tr>
			<tr>
				<td>패스워드</td>
				<td><input type="text" name="mem_pass" value="" /></td>
			</tr>
			<tr>
				<td colspan="2" id="footer">
					<input type="submit" value="로그인"> 
					<input type="button" value="회원가입" onclick="location.href='<%=request.getContextPath()%>/member/memberForm.jsp'"/>
				</td>
			</tr>
		</table>
	</center>	
	</form>
</body>
</html>