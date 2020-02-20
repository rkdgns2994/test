<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	response.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>memberForm</title>
</head>
<body>
	<script type='text/javascript' src='http://code.jquery.com/jquery-latest.js'></script>
	<script type='text/javascript' src='/Test/js/validation.js'></script>
	<script type='text/javascript'>
		$(function() {
			$('form').submit(
					function() {
						if (!$('input[name=mem_id]').val().validationID()) {
							alert('아이디를 바르게 입력해주세요.');
							return false;
						}
						if (!$('input[name=mem_pass]').val().validationPWD()) {
							alert('비밀번호를 바르게 입력해주세요.');
							return false;
						}
						if (!$('input[name=mem_name]').val().validationNM()) {
							alert('이름을 바르게 입력해주세요.');
							return false;
						}
						if (!$('input[name=mem_name]').val().validationNM()) {
							alert('생일을 바르게 입력해주세요.');
							return false;
						}
						if (!$('input[name=mem_hp]').val().validationHP()) {
							alert('휴대폰 번호를 바르게 입력해주세요.');
							return false;
						}
						if (!$('input[name=mem_mail]').val().validationMAIL()) {
							alert('이메일을 바르게 입력해주세요.');
							return false;
						}
						if (!$('input[name=mem_add1]').val().validationADD1()) {
							alert('주소를 바르게 입력해주세요.');
							return false;
						}
						if (!$('input[name=mem_job]').val().validationJOB()) {
							alert('직업을 바르게 입력해주세요.');
							return false;
						}
					});
		});
	</script>
</head>
<body>
	<form action='<%=request.getContextPath()%>/member/insertMember.jsp' method='POST'>
		<table border = 1>
			<tr>
				<td>아이디</td>
				<td><input type='text' name='mem_id' placeholder ='소문자숫자포함 3~5자리'/></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type='text' name='mem_pass' placeholder ='소문자숫자포함 4~8자리'/></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type='text' name='mem_name' placeholder ='한글로 2~6자리'/></td>
			</tr>
			<tr>
				<td>생일</td>
				<td><input type='text' name='mem_bir' placeholder ='1900-01-01'/></td>
			</tr>
			<tr>
				<td>휴대폰</td>
				<td><input type='text' name='mem_hp' placeholder ='010-0000-0000'/></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type='text' name='mem_mail' /></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type='text' name='mem_add1' />&nbsp;&nbsp; 
					<input type='text' name='mem_add2' /></td>
			</tr>
			<tr>
				<td>직업</td>
				<td><input type='text' name='mem_job' /></td>
			</tr>
			<tr>
				<td>취미</td>
				<td><input type='text' name='mem_like' /></td>
			</tr>
			<tr>
				<td colspan='2'>
					<input type='submit' value='회원가입' />
					<input type="button" value="처음으로" onclick="location.href='<%=request.getContextPath()%>/member/loginForm.jsp'"/>
				</td>
			</tr>
		</table>
	</form>

</body>
</html>